//
//  NSMutableData+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
可防止以下crash
 1.subdataWithRange:
 2.rangeOfData:options:range:
 3.resetBytesInRange:
 4.replaceBytesInRange:withBytes:
 5.replaceBytesInRange:withBytes:length:
 
 */

@interface NSMutableData (Safe)

@end
