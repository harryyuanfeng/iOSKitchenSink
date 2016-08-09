//
//  containedInViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/23/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "containedInViewController.h"

@interface containedInViewController ()

@end
UIButton *_containedInBtn;
UIButton *lessThanBtn;
@implementation containedInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _containedInBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 300, 30)];
    [_containedInBtn addTarget:self action:@selector(clickcontainedIn) forControlEvents:UIControlEventTouchDown];
    [_containedInBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_containedInBtn setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [_containedInBtn setTitle:@"click containedIn" forState:UIControlStateNormal];
    [_containedInBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_containedInBtn];

    
    lessThanBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 240, 300, 30)];
    [lessThanBtn addTarget:self action:@selector(clicklessThanBtn) forControlEvents:UIControlEventTouchDown];
    [lessThanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lessThanBtn setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [lessThanBtn setTitle:@"click clicklessThanBtn" forState:UIControlStateNormal];
    [lessThanBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:lessThanBtn];

    // Do any additional setup after loading the view.
}

-(void)clickcontainedIn{
    
    NSArray *reminders =[NSArray arrayWithObjects:@"0", @"2",@"3", nil];
    //NSArray *reminders =[NSArray arrayWithObjects:@"0", @"2",@"3", nil];
    //NSArray *reminders =[NSArray arrayWithObjects:@"0", @"2",@"3", nil];
    
    AVQuery *query = [AVQuery queryWithClassName:@"TODO"];
    [query whereKey:@"containInTest" containedIn:reminders];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
    }];
}

-(void)clicklessThanBtn{
    //NSArray *reminders =[NSArray arrayWithObjects:@"1", @"2",@"3", nil];
    NSArray *reminders =[NSArray arrayWithObjects:@"1", @"2",@"3", nil];
    //NSArray *reminders =[NSArray arrayWithObjects:@"0", @"2",@"3", nil];
    //NSArray *reminders =[NSArray arrayWithObjects:@"0", @"2",@"3", nil];
    
    AVQuery *query = [AVQuery queryWithClassName:@"TODO"];
    [query whereKey:@"containInTest" lessThan:reminders];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
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
