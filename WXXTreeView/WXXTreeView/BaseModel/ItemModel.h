//
//  ItemModel.h
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface ItemModel : BaseModel

@property(nonatomic,copy)NSString * itemName;

/**
 *  是否被选中
 */
@property(nonatomic,assign)BOOL isSelect;

@end
