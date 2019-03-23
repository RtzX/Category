//
//  ICollectionAdapter.h
//  Category
//
//  Created by Mu on 2019/3/23.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICollectionAdapter <NSObject>
@required
/**
 判断是否为空 目前只针对 字符串 数组 字典 为 `空` 的情况判断
 
 字符串: nil null 字符串都是空格组成
 
 数组or字典: nil null 数组lenght=0, 字典allkeys.count=0
 */
- (BOOL)isEmptyOrNull;
+ (BOOL)isEmptyOrNull:(id<ICollectionAdapter>)parmars;

@end
