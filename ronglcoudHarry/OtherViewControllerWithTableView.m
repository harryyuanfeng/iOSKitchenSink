//
//  OtherViewControllerWithTableView.m
//  ronglcoudHarry
//
//  Created by harryfeng on 7/12/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "OtherViewControllerWithTableView.h"
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
#import "recursiveBlockViewController.h"
@interface OtherViewControllerWithTableView ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableView;
    NSArray *labelText;
}
@end

@implementation OtherViewControllerWithTableView

-(void)viewDidLoad{
    labelText = [[NSArray alloc] initWithObjects:@"recursiveBlockViewController",@"CurrentUserAddObjViewController",@"NSNotificationCenterViewController",@"SDWebImageViewController",@"WevViewViewController",@"LoadMoreViewController",@"containedInViewController",@"expandableCellViewController",@"GeoLocationUIViewController",@"addlater", nil];
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
     tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return labelText.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = labelText[indexPath.row];
    //etc.
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
    switch (indexPath.row) {
        case 0:{
            //recursiveBlockViewController *vc = [[recursiveBlockViewController all]]
            NSLog(@"");
            recursiveBlockViewController *vc = [[recursiveBlockViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            CurrentUserAddObjViewController *vc = [[CurrentUserAddObjViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            NSNotificationCenterViewController *vc = [[NSNotificationCenterViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 3:{
            SDWebImageViewController *vc = [[SDWebImageViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 4:{
            WevViewViewController *vc = [[WevViewViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 5:{
            LoadMoreViewController *vc = [[LoadMoreViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 6:{
            containedInViewController *vc = [[containedInViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 7:{
            expandableCellViewController *vc = [[expandableCellViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 8:{
            GeoLocationUIViewController *vc = [[GeoLocationUIViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 9:{
//            recursiveBlockViewController *vc = [[recursiveBlockViewController alloc] init];
//            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        default:
            break;
    }
}

@end
