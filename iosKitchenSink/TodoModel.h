//
//  TodoModel.h
//  iosKitchenSink
//
//  Created by harryfeng on 16/9/4.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface TodoModel : JSONModel
@property NSString *name;
-(NSString *)getLastName;
@end
