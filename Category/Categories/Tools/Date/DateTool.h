//
//  DateTool.h
//  Category
//
//  Created by Mu on 2019/3/23.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDateAdapter.h"

@interface DateTool : NSObject <IDateAdapter, IDateConvert, IDateInfo, IDateDispose>

@end

