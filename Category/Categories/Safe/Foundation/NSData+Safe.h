//
//  NSData+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
1. _NSZeroData
   [NSData data]空data
 
2.NSConcreteMutableData
   [NSMutableData data];
 
3.NSConcreteData
   [NSJSONSerialization dataWithJSONObject:[NSMutableDictionary dictionary] options:0 error:nil]
 
4._NSInlineData
     [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:@"https://www.baidu.com/"]]
 
5.__NSCFData 
*/

/*
 可防止以下crash
 1.subdataWithRange
 2.rangeOfData:options:range:
 
 */



@interface NSData (Safe)

@end
