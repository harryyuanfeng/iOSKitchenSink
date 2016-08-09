//
//  studentModelGlobalVariable.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/21/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "studentModelGlobalVariable.h"

@implementation studentModelGlobalVariable
static studentModelGlobalVariable *instance = nil;

+(studentModelGlobalVariable *)getStudent
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [studentModelGlobalVariable new];
        }
    }
    return instance;
}
@end
