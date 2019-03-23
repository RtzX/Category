//
//  NSAttributedString+Safe.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Safe)

@end


/*
 
 目前可避免以下方法crash
    1.- (instancetype)initWithString:(NSString *)str;
    2.- (instancetype)initWithString:(NSString *)str attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs;
    3.- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr;
 
 */
