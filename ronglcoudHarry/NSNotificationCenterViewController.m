//
//  NSNotificationCenterViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/20/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "NSNotificationCenterViewController.h"

@interface NSNotificationCenterViewController ()

@end
@implementation NSNotificationCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *NSNotificationCenterButton = [[UIButton alloc] init];
    NSNotificationCenterButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 360, 200, 30)];
    [NSNotificationCenterButton addTarget:self action:@selector(clickNSNotificationCenterButton) forControlEvents:UIControlEventTouchDown];
    [NSNotificationCenterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [NSNotificationCenterButton setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [NSNotificationCenterButton setTitle:@"clickNSNotificationCenterButton" forState:UIControlStateNormal];
    [NSNotificationCenterButton setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:NSNotificationCenterButton];
    
    // Do any additional setup after loading the view.
}

-(void)clickNSNotificationCenterButton{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"TestNotification"
     object:self];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
