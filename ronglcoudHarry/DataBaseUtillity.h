//
//  DataBaseUtillity.h
//  ronglcoudHarry
//
//  Created by harryfeng on 9/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseUtillity : NSObject
{
    void (^_completionHandler)(int someParameter);
    void (^_getStudentComplete)(AVObject *someParameter);
}
- (void) doSomethingWithCompletionHandler:(void(^)(int))handler;

- (void) GetNormalStudentFriend:(NSString *)id block:(void(^)(AVObject *result))handler;
@end
