//
//  GroupTableViewCell.m
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import "GroupTableViewCell.h"
#import "UIView+Extension.h"
#import "RoomViewController.h"

@interface GroupTableViewCell ()

@property (nonatomic,strong) UIImageView * arrowImageView;//展开按钮
@property (nonatomic,strong) UILabel  *nameLable;//名字
@property (nonatomic,strong) UILabel * selectNumLabel;//选中和总共数据的显示
@property (nonatomic,strong) GroupModel * groupInfo;

@end

@implementation GroupTableViewCell

#pragma mark -------init
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellId = @"GroupTableViewCell";
    GroupTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[GroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllSubView];
    }
    return self;
}

-(void)addAllSubView
{
    [self addSubview:self.arrowImageView];
    [self addSubview:self.nameLable];
    [self addSubview:self.selectNumLabel];
}

#pragma mark --------initData
-(void)setData:(GroupModel *)groupInfo
{
    self.groupInfo = groupInfo;
    self.nameLable.text = self.groupInfo.groupName;
    self.selectNumLabel.text = [NSString stringWithFormat:@"%d/%d",self.groupInfo.selectNum,self.groupInfo.totalNum];
    if (self.groupInfo.isExpanded) {
//        [UIView animateWithDuration:0.1 animations:^{
//            _arrowImageView.transform = CGAffineTransformMakeRotation(M_PI * (180)/180);}];
         _arrowImageView.image = [UIImage imageNamed:@"arrowImageExpand"];
    }
    else
    {
         _arrowImageView.image = [UIImage imageNamed:@"arrowImageNone"];
    }
}

#pragma mark -----------layOutView
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat xOffSet = 15;
    if (self.groupInfo) {
        xOffSet += self.groupInfo.nodeLevel * 15;
    }
    
    _arrowImageView.frame = CGRectMake(xOffSet, (self.height - 16)/2.0, 16, 16);
    xOffSet += 20;
    _nameLable.frame = CGRectMake(xOffSet, 0, self.width - xOffSet, self.height);
    _selectNumLabel.frame = CGRectMake(self.width - 100, 0, 100, self.height);
}

#pragma mark ---------lazy
-(UILabel *)nameLable
{
    if (!_nameLable) {
        _nameLable  = [[UILabel alloc]init];
        _nameLable.font = [UIFont systemFontOfSize:16.0];
    }
    return _nameLable;
}

-(UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc]init];
    }
    return _arrowImageView;
}

-(UILabel *)selectNumLabel
{
    if (_selectNumLabel) {
        _selectNumLabel = [[UILabel alloc]init];
        _selectNumLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _selectNumLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
