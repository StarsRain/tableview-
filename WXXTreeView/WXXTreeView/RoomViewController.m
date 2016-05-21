//
//  RoomViewController.m
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import "RoomViewController.h"
#import "GroupTableViewCell.h"
#import "ItemTableViewCell.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface RoomViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * roomTableView;

@property(nonatomic,strong)NSArray * displayArray;//保存要显示在界面上的数据的数组

@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"房间树形展示界面";
    self.roomTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.roomTableView.dataSource = self;
    self.roomTableView.delegate = self;
    self.roomTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.roomTableView];
    
     [self reloadDisplayArray];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _displayArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel * model = [_displayArray objectAtIndex:indexPath.row];
    if (model.nodeType == NodeTypeGroup) {
        GroupTableViewCell *cell = [GroupTableViewCell cellWithTableView:tableView];
        [cell setData:(GroupModel *) model];
        return cell;
    }
    else
    {
        ItemTableViewCell *cell = [ItemTableViewCell cellWithTableView:tableView];
        [cell setData:(ItemModel *)model];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseModel * model = _displayArray[indexPath.row];
    model.isExpanded = !model.isExpanded;
    [self reloadDisplayArray];
}

-(void)reloadDisplayArray
{
    NSMutableArray * tmpList = [[NSMutableArray alloc]init];
    for (GroupModel * model in self.nodeList) {
        if (model.isExpanded) {
            [self addData:model toArray:tmpList];
        }
        else
        {
            [tmpList addObject:model];
        }
    }
    _displayArray = [NSArray arrayWithArray:tmpList];
    [self.roomTableView reloadData];
}

-(void)addData:(GroupModel *)model toArray:(NSMutableArray *)tmpList
{
     [tmpList addObject:model];
    for (GroupModel * floorModel in model.childrenArray) {
        [tmpList addObject:floorModel];
        if (floorModel.isExpanded) {
            for (ItemModel * roomModel in floorModel.childrenArray) {
                [tmpList addObject:roomModel];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
