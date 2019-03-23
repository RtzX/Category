//
//  NSOrderedSet+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 可避免以下crash
 
 1.orderedSetWithSet
 2.initWithObjects:count:
 3.objectAtIndex:
 
 */
@interface NSOrderedSet (Safe)


@end
