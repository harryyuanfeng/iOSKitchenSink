//
//  groupChatViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 8/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "groupChatViewController.h"
#import "RCDChatViewController.h"
@interface groupChatViewController ()

@end

@implementation groupChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    DataBaseUtillity *dbs = [[DataBaseUtillity alloc] init];
    __weak typeof(&*self)  weakSelf = self;
    NSMutableArray *userIdList = [NSMutableArray new];
    
    [userIdList addObject:@"001"];
    [userIdList addObject:@"002"];
    [userIdList addObject:@"003"];
    [[RCIMClient sharedRCIMClient] createDiscussion:@"hello" userIdList:userIdList success:^(RCDiscussion *discussion) {
        NSLog(@"create room success");
        RCDChatViewController *room = [[RCDChatViewController alloc] init];
        room.targetId                      = discussion.discussionId;
        room.userName                    = discussion.discussionName;
        room.conversationType              = ConversationType_GROUP;
        room.title                         = @"harrygroup";
        dispatch_async(dispatch_get_main_queue(), ^{
            UITabBarController *tabbarVC = weakSelf.navigationController.viewControllers[0];
            [weakSelf.navigationController popToViewController:tabbarVC animated:NO];
            room.hidesBottomBarWhenPushed = YES;
            [tabbarVC.navigationController  pushViewController:room animated:YES];
            
        });
    } error:^(RCErrorCode status) {
        NSLog(@"create room error");
    }];
    
    NSLog(@"success");
    //AVUser *cuser = [AVUser currentUser];
    
    AVRelation *relation = [[AVUser currentUser] relationForKey:@"friend"];
    AVQuery *query = [relation query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"find objects success");
        // objects 是一个 AVObject 的 NSArray，它包含所有当前 todoFolder 的 tags
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
