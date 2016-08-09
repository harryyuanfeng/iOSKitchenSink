//
//  DBASingleton.h
//  ronglcoudHarry
//
//  Created by harryfeng on 10/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBASingleton : NSObject

+ (id)sharedManager;
+ (void)testSingleton;
+ (void)beginTaskWithCallbackBlock:(void (^)(NSMutableArray *array))callbackBlock;
@end
