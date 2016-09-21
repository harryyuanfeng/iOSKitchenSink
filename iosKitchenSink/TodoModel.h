//
//  TodoModel.h
//  iosKitchenSink
//
//  Created by harryfeng on 16/9/4.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"
@interface TodoModel : JSONModel
@property NSString *name;
@property AVFile *imageFile;
@property NSString *imageFileString;
@property NSString *imageFileId;
@property CategoryModel *category;
@property NSMutableDictionary *imageFileDic;
-(NSString *)getLastName;
@end
