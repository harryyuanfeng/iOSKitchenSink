//
//  OtherViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 11/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "OtherViewController.h"
#import "DBCameraViewController.h"
#import "DBCameraContainerViewController.h"
#import "WevViewViewController.h"
#import "LoadMoreViewController.h"
#import "SDWebImageViewController.h"
#import "NSNotificationCenterViewController.h"
#import "CurrentUserAddObjViewController.h"
#import "recursiveBlockViewController.h"
#import "containedInViewController.h"
#import "expandableCellViewController.h"
#import "GeoLocationUIViewController.h"

@interface OtherViewController ()<DBCameraViewControllerDelegate>{
    UIButton *DBCamera;
    UIButton *SDWebImage;
    UIButton *WebViewButton;
    UIButton *loadMore;
    UIButton *NSNotificationCenterButton;
    UIButton *CurrentUserAddObj;
    UIButton *recursiveBlock;
    UIButton *containedIn;
    UIButton *expandableCell;
    UIButton *AVGeolocation1;
}

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    DBCamera = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 300, 30)];
    [DBCamera addTarget:self action:@selector(openCamera) forControlEvents:UIControlEventTouchDown];
    [DBCamera setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [DBCamera setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [DBCamera setTitle:@"DBcamera" forState:UIControlStateNormal];
    [DBCamera setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:DBCamera];
    
    WebViewButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 240, 300, 30)];
    [WebViewButton addTarget:self action:@selector(clickWebViewButton) forControlEvents:UIControlEventTouchDown];
    [WebViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [WebViewButton setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [WebViewButton setTitle:@"WebViewButton" forState:UIControlStateNormal];
    [WebViewButton setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:WebViewButton];
    
    loadMore = [[UIButton alloc] initWithFrame:CGRectMake(100, 280, 300, 30)];
    [loadMore addTarget:self action:@selector(clickLoadMore) forControlEvents:UIControlEventTouchDown];
    [loadMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loadMore setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [loadMore setTitle:@"loadMore" forState:UIControlStateNormal];
    [loadMore setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:loadMore];
    
    SDWebImage = [[UIButton alloc] initWithFrame:CGRectMake(100, 320, 300, 30)];
    [SDWebImage addTarget:self action:@selector(clickSDWebImage) forControlEvents:UIControlEventTouchDown];
    [SDWebImage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [SDWebImage setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [SDWebImage setTitle:@"clickSDWebImage" forState:UIControlStateNormal];
    [SDWebImage setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:SDWebImage];
    
    NSNotificationCenterButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 360, 300, 30)];
    [NSNotificationCenterButton addTarget:self action:@selector(clickNSNotificationCenterButton) forControlEvents:UIControlEventTouchDown];
    [NSNotificationCenterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [NSNotificationCenterButton setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [NSNotificationCenterButton setTitle:@"clickNSNotificationCenterButton" forState:UIControlStateNormal];
    [NSNotificationCenterButton setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:NSNotificationCenterButton];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];    // Do any additional setup after loading the view.

    
    CurrentUserAddObj = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 300, 30)];
    [CurrentUserAddObj addTarget:self action:@selector(clickCurrentUserAddObj) forControlEvents:UIControlEventTouchDown];
    [CurrentUserAddObj setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [CurrentUserAddObj setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [CurrentUserAddObj setTitle:@"clickCurrentUserAddObj" forState:UIControlStateNormal];
    [CurrentUserAddObj setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:CurrentUserAddObj];
    
    recursiveBlock = [[UIButton alloc] initWithFrame:CGRectMake(100, 440, 300, 30)];
    [recursiveBlock addTarget:self action:@selector(clickrecursiveBlock) forControlEvents:UIControlEventTouchDown];
    [recursiveBlock setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [recursiveBlock setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [recursiveBlock setTitle:@"clickrecursiveBlock" forState:UIControlStateNormal];
    [recursiveBlock setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:recursiveBlock];
    
    containedIn = [[UIButton alloc] initWithFrame:CGRectMake(100, 480, 300, 30)];
    [containedIn addTarget:self action:@selector(clickcontainedIn) forControlEvents:UIControlEventTouchDown];
    [containedIn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [containedIn setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [containedIn setTitle:@"clickcontainedIn" forState:UIControlStateNormal];
    [containedIn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:containedIn];
    
    expandableCell = [[UIButton alloc] initWithFrame:CGRectMake(100, 520, 300, 30)];
    [expandableCell addTarget:self action:@selector(expandableCell) forControlEvents:UIControlEventTouchDown];
    [expandableCell setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [expandableCell setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [expandableCell setTitle:@"expandableCell" forState:UIControlStateNormal];
    [expandableCell setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:expandableCell];
    
    AVGeolocation1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 560, 300, 30)];
    [AVGeolocation1 addTarget:self action:@selector(clickAVGeolocation1) forControlEvents:UIControlEventTouchDown];
    [AVGeolocation1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [AVGeolocation1 setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [AVGeolocation1 setTitle:@"clickAVGeolocation1" forState:UIControlStateNormal];
    [AVGeolocation1 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:AVGeolocation1];
}

-(void)clickAVGeolocation1{
    GeoLocationUIViewController *vc = [[GeoLocationUIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)expandableCell{
    expandableCellViewController *vc = [[expandableCellViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickcontainedIn{
    containedInViewController *vc = [[containedInViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickrecursiveBlock{
    recursiveBlockViewController *vc = [[recursiveBlockViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickCurrentUserAddObj{
    
   
    
    AVUser *user = [AVUser currentUser];
    
    AVObject *student = [user objectForKey:@"xyqStudent"];
    NSString *name = [student objectForKey:@"name"];
    AVQuery *query = [AVQuery queryWithClassName:@"xyqStudent"];
    [query whereKey:@"user" equalTo:user];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        AVObject *obj = objects[0];
        NSMutableDictionary *dic = [obj dictionaryForObject];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:dic forKey:@"obj"];
        [userDefaults synchronize];
        
        CurrentUserAddObjViewController* vc = [[CurrentUserAddObjViewController alloc] init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];
    }];
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"Successfully received the test notification!");
}

-(void)clickNSNotificationCenterButton{
    NSNotificationCenterViewController* vc = [[NSNotificationCenterViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
    }];
}

-(void)clickSDWebImage{
     SDWebImageViewController *vc = [[SDWebImageViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickWebViewButton{
    WevViewViewController *webview = [[WevViewViewController alloc] init];
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)clickLoadMore{
    LoadMoreViewController *webview = [[LoadMoreViewController alloc] init];
    [self.navigationController pushViewController:webview animated:YES];
}

- (void) openCamera
{
    DBCameraContainerViewController *cameraContainer = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    [cameraContainer setFullScreenMode];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraContainer];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void) openCameraWithoutSegue
{
    DBCameraViewController *cameraController = [DBCameraViewController initWithDelegate:self];
    [cameraController setUseCameraSegue:NO];
    
    DBCameraContainerViewController *container = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    [container setCameraViewController:cameraController];
    [container setFullScreenMode];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:container];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void) openCameraWithoutContainer
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[DBCameraViewController initWithDelegate:self]];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DBCameraViewControllerDelegate

- (void) camera:(id)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    [cameraViewController restoreFullScreenMode];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) dismissCamera:(id)cameraViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
    [cameraViewController restoreFullScreenMode];
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
