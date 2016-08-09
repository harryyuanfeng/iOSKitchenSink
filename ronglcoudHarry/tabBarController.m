//
//  tabBarController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "tabBarController.h"
#import "chatVC.h"
#import "groupChatViewController.h"
#import "UserSignUpViewController.h"
#import "LoginViewController.h"
#import "OtherViewController.h"
#import "OtherViewControllerWithTableView.h"
@implementation tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //chatVC *chatvc = [[chatVC alloc] init];
    
    chatVC *view1 = [[chatVC alloc] init];
    groupChatViewController *view2 = [[groupChatViewController alloc] init];
    UserSignUpViewController *view3 = [[UserSignUpViewController alloc] init];
    LoginViewController *view4 = [[LoginViewController alloc] init];
    //OtherViewController *view5 = [[OtherViewController alloc] init];
    OtherViewControllerWithTableView *view5 = [[OtherViewControllerWithTableView alloc] init];
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:view1];
    [tabViewControllers addObject:view2];
    [tabViewControllers addObject:view3];
    [tabViewControllers addObject:view4];
    [tabViewControllers addObject:view5];
    
    [self setViewControllers:tabViewControllers];
    [self setSelectedIndex:4];
    //can't set this until after its added to the tab bar
    view1.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"聊天"
                                  image:[UIImage imageNamed:@"view1"]
                                    tag:1];
    view2.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"群聊"
                                  image:[UIImage imageNamed:@"view3"]
                                    tag:2];
    view3.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"注册"
                                  image:[UIImage imageNamed:@"view3"]
                                    tag:3];

    view4.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"登录"
                                  image:[UIImage imageNamed:@"view4"]
                                    tag:4];
    view5.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"其他"
                                  image:[UIImage imageNamed:@"view5"]
                                    tag:5];
}

@end
