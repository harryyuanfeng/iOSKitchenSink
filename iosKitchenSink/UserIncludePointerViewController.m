//
//  UserIncludePointerViewController.m
//  iosKitchenSink
//
//  Created by harryfeng on 16/9/3.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import "UserIncludePointerViewController.h"

@interface UserIncludePointerViewController ()

@end

@implementation UserIncludePointerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [AVUser logInWithUsernameInBackground:@"111" password:@"1" block:^(AVUser *user, NSError *error) {
        AVObject *mycategory = [user objectForKey:@"category"];
        NSString *name = [mycategory objectForKey:@"name"];
        NSString *categoryId = mycategory.objectId;
        AVObject *mycategory2 = [[AVUser currentUser] objectForKey:@"category"];
        NSString *mycategoryId2 = mycategory2.objectId;
        AVQuery *query = [AVUser query];
        [query includeKey:@"category"];
        [query whereKey:@"objectId" equalTo:user.objectId];
        [query getFirstObjectInBackgroundWithBlock:^(AVObject *object, NSError *error) {
            AVObject *category = [object objectForKey:@"category"];
            NSLog(@"%@",[category objectForKey:@"name"]);
        }];
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
