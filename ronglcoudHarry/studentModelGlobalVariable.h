//
//  studentModelGlobalVariable.h
//  ronglcoudHarry
//
//  Created by harryfeng on 5/21/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentModelGlobalVariable : NSObject{
    AVObject *student;
}
@property(nonatomic,retain)AVObject *student;
+(studentModelGlobalVariable*)getStudent;
@end
