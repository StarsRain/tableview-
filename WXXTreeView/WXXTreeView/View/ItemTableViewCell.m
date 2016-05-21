//
//  ItemTableViewCell.m
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "UIView+Extension.h"

@interface ItemTableViewCell()

@property (nonatomic,strong) UIImageView * selectImageView;

@property (nonatomic,strong) UILabel * nameLabel;

@property (nonatomic,strong) ItemModel * itemInfo;

@end

@implementation ItemTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * identityId = @"ItemTableViewCell";
    ItemTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identityId];
    if (!cell) {
        cell = [[ItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identityId];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllSubviews];
    }
    return self;
}

-(void)addAllSubviews
{
    [self addSubview:self.nameLabel];
    [self addSubview:self.selectImageView];
}


-(void)setData:(ItemModel *)itemInfo
{
    self.itemInfo = itemInfo;
    self.nameLabel.text = self.itemInfo.itemName;
    if (self.itemInfo.isSelect) {
        self.selectImageView.image = [UIImage imageNamed:@"select"];
    }
    else
    {
         self.selectImageView.image = [UIImage imageNamed:@"UnSelect"];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat XoffSet = 15;
    if (self.itemInfo) {
        XoffSet += self.itemInfo.nodeLevel * 15;
    }
    
    _nameLabel.frame = CGRectMake(XoffSet, 0, self.width - XoffSet, self.height);
    XoffSet += 20;
    
    _selectImageView.frame = CGRectMake(self.width - 100, (self.height - 16)/2, 16, 16);
}

#pragma mark - lazy

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

- (UIImageView *)selectImageView
{
    if(!_selectImageView)
    {
        _selectImageView = [[UIImageView alloc] init];
    }
    return _selectImageView;
}





























- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
