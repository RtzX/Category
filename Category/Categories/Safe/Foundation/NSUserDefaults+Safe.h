//
//  NSUserDefaults+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSUserDefaults (Safe)

/*
 可避免以下方法  key=nil时的crash
     1.objectForKey:
     2.stringForKey:
     3.arrayForKey:
     4.dataForKey:
     5.URLForKey:
     6.stringArrayForKey:
     7.floatForKey:
     8.doubleForKey:
     9.integerForKey:
     10.boolForKey:
     11.setObject:forKey:
 */
@end
