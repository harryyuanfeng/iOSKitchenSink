//
//  DBASingleton.m
//  ronglcoudHarry
//
//  Created by harryfeng on 10/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "DBASingleton.h"

@implementation DBASingleton

+ (id)sharedManager {
    static DBASingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+ (void)beginTaskWithCallbackBlock:(void (^)(NSMutableArray *array))callbackBlock{
    NSMutableArray *myarray = [[NSMutableArray alloc] init];
    [myarray addObject:@"aaa"];
    callbackBlock(myarray);
}

+(void)testSingleton{
    NSLog(@"test testSingleton");
}

- (id)init {
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
