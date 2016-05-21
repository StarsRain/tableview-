//
//  GroupModel.h
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface GroupModel : BaseModel

@property(nonatomic,copy)NSString * groupName;

/**
 *  已经选中多少个
 */
@property(nonatomic,assign)NSInteger selectNum;

/**
 *  总共多少个
 */
@property(nonatomic,assign)NSInteger totalNum;

/**
 *  子数组
 */
@property(nonatomic,strong)NSArray * childrenArray;

@end
