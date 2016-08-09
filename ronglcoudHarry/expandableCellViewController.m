//
//  expandableCellViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 6/7/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "expandableCellViewController.h"

@interface expandableCellViewController ()

@end

@implementation expandableCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    AVObject *todoFolder = [AVObject objectWithoutDataWithClassName:@"xyqNews" objectId:@"574efaf671cfe4005ec51aea"];
    AVRelation *relation = [todoFolder relationforKey:@"comments"];
    AVQuery *query = [relation queryd];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
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
