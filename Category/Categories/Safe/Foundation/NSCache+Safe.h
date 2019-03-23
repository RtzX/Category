//
//  NSCache+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 可避免以下crash
 setObject:forKey:
 setObject:forKey:cost:
 
 */

@interface NSCache (Safe)

@end
