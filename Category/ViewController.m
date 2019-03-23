//
//  ViewController.m
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Collection.h"
#import "NSDictionary+Collection.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self array];
    
//    [self string];
//
//    [self dict];
}

- (void)array
{
    NSArray * array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
   id a1 = [array filter:^BOOL(NSString *  _Nonnull object) {
       return [object isEqualToString:@"2"];
    }];
    
    id a2 = [array filterWith:@"5"];
    
    id a4 = [array reject:^BOOL(NSString *  _Nonnull object) {
        return [object isEqualToString:@"6"];
    }];
    NSLog(@"");
}

- (void)string
{
    
}

- (void)dict
{
    NSDictionary *dict = @{
                           @"k1" : @"v1",
                           @"k2" : @"v2",
                           @"k3" : @"v3",
                           @"k4" : @"v4",
                           };
    NSDictionary *re = [dict except:@[@"k5", @"k3"]];
    NSDictionary *rr = [dict only:@[@"k2"]];
    NSDictionary *rrr = [dict only:@[@"k5"]];
    NSDictionary *rrrr = [dict only:@[]];
    
    [dict each:^(id  _Nonnull key, id  _Nonnull object) {
        NSLog(@"");
    }];
    
    id bn = [dict filter:^BOOL(NSString *  _Nonnull key, NSString *  _Nonnull object) {
        return [key isEqualToString:@"k3"] && [object isEqualToString:@"v3"];
    }];
    id nmm = [dict reject:^BOOL(id  _Nonnull key, id  _Nonnull object) {
        return [key isEqualToString:@"8"] || [object isEqualToString:@"10"];
    }];
    
    id ee = [dict map:^id _Nonnull(NSString *  _Nonnull key, id  _Nonnull object) {
        NSLog(@"key: %@===value: %@", key, object);
        if ([key isEqualToString:@"k3"]) {
            return @{
                     @"k7" : @"v7"
                     };
        }
        return @{
                 @"k17" : @"v17"
                 };
    }];
        [dict map:^id _Nonnull(id  _Nonnull key, id  _Nonnull object) {
            return @"";
        }];
    NSLog(@"");
}


@end
