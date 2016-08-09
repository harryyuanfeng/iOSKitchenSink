//
//  GeoLocationUIViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 7/12/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "GeoLocationUIViewController.h"

@interface GeoLocationUIViewController ()<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
    UITextField *longitudeLabel;
    UITextField *latitudeLabel;
    
    UITextField *distanceLabel;
    
    AVGeoPoint *point;
}
@end
@implementation GeoLocationUIViewController
// refer to this link http://stackoverflow.com/questions/4152003/how-can-i-get-current-location-from-user-in-ios
//and this link http://www.appcoda.com/how-to-get-current-location-iphone-user/
-(void)viewDidLoad{
    [self setupLocationInitService];
    [self setupSomeUI];
    
}

-(void)setupLocationInitService{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [locationManager requestWhenInUseAuthorization];
    
    [locationManager startUpdatingLocation];
}

-(void)setupSomeUI{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    longitudeLabel = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    longitudeLabel.textColor = [UIColor blackColor];
    [self.view addSubview:longitudeLabel];
    
    latitudeLabel = [[UITextField alloc] initWithFrame:CGRectMake(100, 140, 100, 30)];
    latitudeLabel.textColor = [UIColor blackColor];
    [self.view addSubview:latitudeLabel];
    
    distanceLabel = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, 100, 30)];
    distanceLabel.textColor = [UIColor blackColor];
    [self.view addSubview:distanceLabel];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    point = [AVGeoPoint geoPointWithLatitude:39.000001 longitude:116.01];
    double kilodisatnce = [point distanceInKilometersTo:[AVGeoPoint geoPointWithLatitude:currentLocation.coordinate.latitude longitude:currentLocation.coordinate.longitude]];
    distanceLabel.text = [NSString stringWithFormat:@"%f", kilodisatnce];
    
    [locationManager stopUpdatingLocation];
}

@end
