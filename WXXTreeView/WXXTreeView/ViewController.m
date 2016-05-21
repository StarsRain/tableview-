//
//  ViewController.m
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import "ViewController.h"
#import "RoomViewController.h"
#import "GroupModel.h"
#import "ItemModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel * promtLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2.0 - 10, self.view.frame.size.width, 20)];
    promtLabel.text = @"点击屏幕";
    promtLabel.textAlignment = NSTextAlignmentCenter;
    promtLabel.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:promtLabel];
}

#pragma mark ---------创建树形结构
-(NSMutableArray *)creatData
{
    NSMutableArray * buildingArray = [NSMutableArray array];
    NSMutableArray * floorArray = [NSMutableArray array];
    NSMutableArray * roomArray = [NSMutableArray array];
    NSString * path = [[NSBundle mainBundle]pathForResource:@"roomInfo" ofType:@"plist"];
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    NSArray * array = [dict objectForKey:@"roomInfo"];
    for (NSDictionary * dict in array) {
        GroupModel * model = [[GroupModel alloc]init];
        model.nodeLevel = 0;
        model.isExpanded = NO;
        model.nodeType = NodeTypeGroup;
        model.nodeId = [dict objectForKey:@"buildingid"];
        model.groupName = [dict objectForKey:@"buildingname"];
        model.selectNum = 5;
        model.totalNum = 10;
        [floorArray removeAllObjects];
        for (NSDictionary * floorDict in [dict objectForKey:@"floors"]) {
            GroupModel * fGmodel = [[GroupModel alloc]init];
            fGmodel.nodeLevel = 0;
            fGmodel.isExpanded = NO;
            fGmodel.nodeType = NodeTypeGroup;
            fGmodel.nodeId = [floorDict objectForKey:@"floorid"];
            fGmodel.groupName = [floorDict objectForKey:@"floorname"];
            fGmodel.selectNum = 2;
            fGmodel.totalNum = 3;
            [roomArray removeAllObjects];
            for (NSDictionary * roomDict in [floorDict objectForKey:@"rooms"]) {
                ItemModel * model = [[ItemModel alloc]init];
                model.isSelect = [[roomDict objectForKey:@"isSelectd"] boolValue];
                model.itemName = [roomDict objectForKey:@"roomname"];
                model.nodeType = NodeTypeItem;
                model.isExpanded = NO;
                model.nodeId = [roomDict objectForKey:@"roomid"];
                model.nodeLevel = 2;
                [roomArray addObject:model];
            }
            fGmodel.childrenArray = [roomArray copy];
            [floorArray addObject:fGmodel];
        }
        model.childrenArray = [floorArray copy];
        [buildingArray addObject:model];
    }

    return buildingArray;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    RoomViewController * rvc = [[RoomViewController alloc]init];
    rvc.nodeList = [self creatData];
    [self presentViewController:rvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
