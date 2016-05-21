//
//  BaseModel.h
//  WXXTreeView
//
//  Created by myApple on 16/5/18.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SelectStatus) {
    SelectStatusNone = 0,//未选
    SelectStatusAll,//全选
    SelectStatusOther,//半选
};

typedef NS_ENUM(NSInteger, NodeType) {
    NodeTypeGroup = 0,
    NodeTypeItem,
};

@interface BaseModel : NSObject

/**
 *  节点所处层次
 */
@property(nonatomic,assign)NSInteger nodeLevel;

/**
 *  节点是否展开
 */
@property(nonatomic,assign)BOOL isExpanded;

/**
 *  选中状态
 */
@property(nonatomic,assign)NodeType nodeType;

@property(nonatomic,copy)NSString * nodeId;

@end
