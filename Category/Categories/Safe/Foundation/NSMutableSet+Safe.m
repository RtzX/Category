
//
//  NSMutableSet+Safe.m
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import "NSMutableSet+Safe.h"
#import "NSObject+SafeSwizzle.h"
#import "LSSafeProtector.h"

@implementation NSMutableSet (Safe)
+(void)openSafeProtector
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dClass=NSClassFromString(@"__NSSetM");
        [self safe_exchangeInstanceMethod:dClass originalSel:@selector(addObject:) newSel:@selector(safe_addObject:)];
        [self safe_exchangeInstanceMethod:dClass originalSel:@selector(removeObject:) newSel:@selector(safe_removeObject:)];
    });
}
- (void)safe_addObject:(id)object
{
    @try {
        [self safe_addObject:object];
    }
    @catch (NSException *exception) {
        LSSafeProtectionCrashLog(exception,LSSafeProtectorCrashTypeNSMutableSet);
    }
    @finally {
    }
}
- (void)safe_removeObject:(id)object
{
    @try {
        [self safe_removeObject:object];
    }
    @catch (NSException *exception) {
        LSSafeProtectionCrashLog(exception,LSSafeProtectorCrashTypeNSMutableSet);
    }
    @finally {
    }
}

@end
