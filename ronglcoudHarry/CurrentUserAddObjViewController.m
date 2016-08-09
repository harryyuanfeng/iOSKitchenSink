//
//  CurrentUserAddObjViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/21/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "CurrentUserAddObjViewController.h"

@interface CurrentUserAddObjViewController ()

@end

@implementation CurrentUserAddObjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    studentModelGlobalVariable *obj=[studentModelGlobalVariable getStudent];
//    AVObject *student = obj.student;
//    NSLog((NSString *)[student objectForKey:@"name"]);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *array = [userDefaults objectForKey:@"obj"];
    AVObject *obj = [AVObject objectWithDictionary:array];
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
