//
//  NSDictionary+Collection.m
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import "NSDictionary+Collection.h"
#import "NSArray+Collection.h"

@implementation NSDictionary (Collection)

- (BOOL)isEmptyOrNull
{
    if (self == nil ||
        self == NULL ||
        [self isKindOfClass:[NSNull class]] ||
        self.allKeys.count == 0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isEmptyOrNull:(id<ICollectionAdapter>)parmars
{
    if (parmars == nil ||
        parmars == NULL ||
        [parmars isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([parmars isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary *)parmars allKeys].count == 0;;
    }
    return NO;
}
//===================================
#pragma mark - Converters
//===================================
+ (NSDictionary *_Nullable)fromData:(NSData *_Nullable)data {
    if (!data)
        return nil;
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    return json;
}

+ (NSDictionary *_Nullable)fromString:(NSString *_Nullable)string {
    if (!string || ![string isKindOfClass:NSString.class])
        return nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self.class fromData:data];
}

- (NSString *_Nullable)toString {
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&err];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSDictionary *_Nullable)except:(NSArray *_Nullable)exceptKeys {
    NSMutableDictionary *result = self.mutableCopy;
    [exceptKeys each:^(NSString *key) { [result removeObjectForKey:key]; }];
    
    return result;
}

- (NSDictionary *_Nullable)only:(NSArray *_Nullable)keysToKeep {
    NSMutableDictionary *result = self.mutableCopy;
    [result.allKeys each:^(id key) {
        if (![keysToKeep containsObject:key])
            [result removeObjectForKey:key];
    }];
    return result;
}

//===================================
#pragma mark - Collection
//===================================
- (void)each:(void (^_Nullable)(id _Nonnull key, id _Nonnull object))operation {
    if (operation) {
        [self enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) { operation(key, obj); }];
    }
}

- (NSDictionary *_Nullable)filter:(BOOL (^_Nullable)(id _Nonnull key, id _Nonnull object))condition {
    NSSet *keys = [self keysOfEntriesPassingTest:^BOOL(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) { return condition(key, obj); }];
    return [self dictionaryWithValuesForKeys:keys.allObjects];
}

- (NSDictionary *_Nullable)reject:(BOOL (^_Nullable)(id _Nonnull key, id _Nonnull object))condition {
    NSSet *keys = [self keysOfEntriesPassingTest:^BOOL(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) { return !condition(key, obj); }];
    return [self dictionaryWithValuesForKeys:keys.allObjects];
}

- (NSDictionary *_Nullable)map:(id _Nonnull (^_Nullable)(id _Nonnull key, id _Nonnull object))callback {
    NSMutableDictionary *newDictionary = [NSMutableDictionary new];
    [self each:^(id key, id object) { newDictionary[key] = callback(key, object); }];
    return newDictionary;
}

@end
