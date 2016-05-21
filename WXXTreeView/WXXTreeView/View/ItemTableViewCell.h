//
//  ItemTableViewCell.h
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface ItemTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)setData:(ItemModel *)itemInfo;

@end
