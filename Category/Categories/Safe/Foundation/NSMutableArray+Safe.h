//
//  NSMutableArray+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
   可避免以下crash
 
   1. - (void)addObject:(ObjectType)anObject(实际调用insertObject:)
   2. - (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
   3. - (id)objectAtIndex:(NSUInteger)index( 包含   array[index]  形式  )
   4. - (void)removeObjectAtIndex:(NSUInteger)index
   5. - (void)replaceObjectAtIndex:(NSUInteger)index
   6. - (void)removeObjectsInRange:(NSRange)range
   7. - (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray*)otherArray;
 
*/
 
@interface NSMutableArray (Safe)



@end
