//
//  NSSet+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 可避免以下crash
 1.setWithObject:
 2.(instancetype)initWithObjects:(ObjectType)firstObj
 3.setWithObjects:(ObjectType)firstObj
 */
@interface NSSet (Safe)

@end
