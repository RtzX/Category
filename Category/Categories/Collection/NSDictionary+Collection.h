//
//  NSDictionary+Collection.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Collection)
/**
 将2进制 data 数据转化为 字典
 */
+ (NSDictionary *_Nullable)fromData:(NSData *_Nullable)data;
/**
 将 json 字符串 转化为 字典
 */
+ (NSDictionary *_Nullable)fromString:(NSString *_Nullable)string;
/**
 将字典 转化为 json 字符串
 */
- (NSString *_Nullable)toString;

/**
 移除字典中 目标数组  所包含的 `key`,
 
 @param exceptKeys 将要被移除的 `key` 的集合,
 如果数组中 不包含 字典的key. 则无法移除对应的键值对 {key: value}
 @return 新的 字典对象
 */
- (NSDictionary *_Nullable)except:(NSArray *_Nullable)exceptKeys;

/**
 仅保留 数组中所包含的 `key`  所对应的键值对
 
 @param keysToKeep 需要保留的 `key` 的集合
 
 @return 新的字典对象
 如果 数组中包含的key 在字典中,都查询不到. 则会将原字典所有的 `key` 都移除,生成一个 空字典
 */
- (NSDictionary *_Nullable)only:(NSArray *_Nullable)keysToKeep;

/**
 便利 字典中的所有键值对
 */
- (void)each:(void (^_Nullable)(id _Nonnull key, id _Nonnull object))operation;

/**
 筛选字典中的键值对信息
 
 @param condition 回调 筛选规则
 @return 新的字典 如果没有符合要求的,则返回 @{空字典}
 */
- (NSDictionary *_Nullable)filter:(BOOL (^_Nullable)(id _Nonnull key, id _Nonnull object))condition;

/**
 筛选字典 -- 移除符合 规则(block) 键值对
 @return 如果没有符合规则的,则返回原字典的 键值对
 */
- (NSDictionary *_Nullable)reject:(BOOL (^_Nullable)(id _Nonnull key, id _Nonnull object))condition;

/**
 遍历字典 -- 方法接受一个block作为参数， 然后它会遍历整个 [@{k1:v1}] 数组，并对数组中每一个元素执行block中定义的操作。
 */
- (NSDictionary *_Nullable)map:(id _Nonnull (^_Nullable)(id _Nonnull key, id _Nonnull object))callback;

@end

