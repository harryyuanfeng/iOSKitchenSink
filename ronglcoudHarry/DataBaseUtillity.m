//
//  DataBaseUtillity.m
//  ronglcoudHarry
//
//  Created by harryfeng on 9/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "DataBaseUtillity.h"

@implementation DataBaseUtillity

- (void) doSomethingWithCompletionHandler:(void(^)(int))handler
{
    // NOTE: copying is very important if you'll call the callback asynchronously,
    // even with garbage collection!
    _completionHandler = [handler copy];
    
    // Do stuff, possibly asynchronously...
    int result = 5 + 3;
    
    // Call completion handler.
    _completionHandler(result);
    
    // Clean up.
    //[_completionHandler release];
    _completionHandler = nil;
}
- (void) GetNormalStudentFriend:(NSString *)id block:(void(^)(NSArray *result))handler{
    _getStudentComplete = [handler copy];
    AVQuery *query = [AVQuery queryWithClassName:@"NormalStudent"];
    NSString *userId = [AVUser currentUser].objectId;
    [query whereKey:@"user" equalTo:[AVUser currentUser]];
    [query getFirstObjectInBackgroundWithBlock:^(AVObject *object, NSError *error) {
         _getStudentComplete(object);
    }];
    
    // Do stuff, possibly asynchronously...
    
    
    // Call completion handler.
   // _completionHandler(result);
}

@end
