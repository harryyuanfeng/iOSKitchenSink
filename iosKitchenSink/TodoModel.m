//
//  TodoModel.m
//  iosKitchenSink
//
//  Created by harryfeng on 16/9/4.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import "TodoModel.h"
@interface TodoModel()

@property (nonatomic, retain) NSString *myString;

@end
@implementation TodoModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"helloworld";
        self.myString = @"harryfeng";
        
    }
    return self;
};

+(AVObject *)getAVObjectFromModel:(TodoModel *)model{
    AVObject *object = [AVObject objectWithClassName:@"Todo"];
    return object;
}

-(NSString *)getLastName{
    return _myString;
}

@end
