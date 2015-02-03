//
//  ViewController.m
//  ReMap
//
//  Created by Stephen on 2/2/15.
//  Copyright (c) 2015 Sherwood. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager * locationManager;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    //    [super viewWillAppear:true];
    
    _locationToDisplay.latitude = 47.613114;
    _locationToDisplay.longitude = -122.344670;
    
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 4000, 4000);
    
    [_mapView setRegion:_viewRegion animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    //    if ([CLLocationManager authorizationStatus]) {
    //
    //    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void) setRegion {
//    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
//    [_mapView setRegion:_viewRegion animated:YES];
//}

//MARK: MapView



//MARK: Location
- (void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"locationStatus : %d", status);
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations lastObject];
    CLLocation *oldLocation;
    if (locations.count > 1) {
        oldLocation = [locations objectAtIndex:locations.count -2];
    } else {
        oldLocation = nil;
    }
    NSLog(@"didUpdateLocations: from %@ to %@", oldLocation, newLocation);
    MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 2000, 2000);
    [_mapView setRegion:userLocation animated:YES];
}

//MARK: button pressed
- (IBAction)buttonOnePressed:(id)sender {
    // subZero refrigerators
    _locationToDisplay.latitude = 47.633779;
    _locationToDisplay.longitude = -122.372448;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
    [_mapView setRegion:_viewRegion animated:YES];
    NSLog(@"button 1 pressed");
}
- (IBAction)buttonTwoPressed:(id)sender {
    // ice rink
    _locationToDisplay.latitude = 47.761905;
    _locationToDisplay.longitude = -122.346339;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
    [_mapView setRegion:_viewRegion animated:YES];
    NSLog(@"button 2 pressed");
    
}
- (IBAction)buttonThreePressed:(id)sender {
    // arctic club
    _locationToDisplay.latitude = 47.603750;
    _locationToDisplay.longitude = -122.331695;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
    [_mapView setRegion:_viewRegion animated:YES];
    NSLog(@"button 3 pressed");
}

@end