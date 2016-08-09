//
//  AVOSCloud+AVOSCloudCategory.m
//  ronglcoudHarry
//
//  Created by harryfeng on 6/9/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "AVOSCloud+AVOSCloudCategory.h"

@implementation AVRelation (AVOSCloudCategory)
- (AVQuery *)queryd{
    AVQuery *query = [self query];
    [query orderByDescending:@"updatedAt"];
    return query;
}
@end
