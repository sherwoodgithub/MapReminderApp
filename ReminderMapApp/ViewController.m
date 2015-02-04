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

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) CLLocationManager * locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPointAnnotation *myAnnotation;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    //    [super viewWillAppear:true];
    
    _locationToDisplay.latitude = 47.613114;
    _locationToDisplay.longitude = -122.344670;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 4000, 4000);
    self.mapView.mapType = MKMapTypeHybrid;
    [self.mapView setRegion:_viewRegion animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    
    _myAnnotation = [[MKPointAnnotation alloc] init];
    _myAnnotation.coordinate = CLLocationCoordinate2DMake(47.613114, -122.344670);
    _myAnnotation.title = @"Cool Places In Seattle";
    [self.mapView addAnnotation:_myAnnotation];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
        if ([CLLocationManager authorizationStatus]) {
            NSLog(@"current LocationManager status is : %d", [CLLocationManager authorizationStatus]);
            if ([CLLocationManager authorizationStatus] == 0){
                [self.locationManager requestAlwaysAuthorization];
            } else {
                self.mapView.showsUserLocation = true;
                // start monitoring significant changes
            }
        } else {
            // REMINDER: SET UP WARNING THAT USERLOCATION NOT SET UP
            // ... MAYBE ONLY ONCE WEEK??
        }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//MARK: MapView

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    //TRY: change back to MKPinAnnotationView (a subclass)... bug where long press turns image to pin fixed?
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
    //annotationView.animatesDrop = true;
    annotationView.canShowCallout = true;
    annotationView.image = [UIImage imageNamed:@"iceCubes.png"];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iceCubes.png"]];
    annotationView.leftCalloutAccessoryView = iconView;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
////    MKAnnotationView *annotation = view.annotation;
//    
//    [self performSegueWithIdentifier:@"SHOW_DETAIL" sender:self];
//
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKAnnotationView class]])
    {
        NSLog(@"Clicked Cool Place");
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Disclosure Pressed" message:@"Click Cancel to Go Back" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
    NSLog(@"button tapped");
}

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
    [self.mapView setRegion:userLocation animated:YES];
}

//MARK: Gesture Recognizer

//-(void)mapLongPressed:

//MARK: button pressed
//Refactor these 3 methods
// http://www.devfright.com/mkpointannotation-tutorial/ : myAnnotation.coordinate = CLLocationCoordinate2DMake(51.49795, -0.174056);

- (IBAction)buttonOnePressed:(id)sender {
    // subZero refrigerators
    _locationToDisplay.latitude = 47.633779;
    _locationToDisplay.longitude = -122.372448;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
    _myAnnotation.coordinate = _locationToDisplay;
    [self.mapView addAnnotation:_myAnnotation];
    [_mapView setRegion:_viewRegion animated:YES];
    NSLog(@"button 1 pressed");
}
- (IBAction)buttonTwoPressed:(id)sender {
    // ice rink
    _locationToDisplay.latitude = 47.761905;
    _locationToDisplay.longitude = -122.346339;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
    [_mapView setRegion:_viewRegion animated:YES];
    _myAnnotation.coordinate = _locationToDisplay;
    [self.mapView addAnnotation:_myAnnotation];
    NSLog(@"button 2 pressed");
    
}
- (IBAction)buttonThreePressed:(id)sender {
    // arctic club
    _locationToDisplay.latitude = 47.603750;
    _locationToDisplay.longitude = -122.331695;
    _viewRegion = MKCoordinateRegionMakeWithDistance(_locationToDisplay, 2000, 2000);
    [_mapView setRegion:_viewRegion animated:YES];
    _myAnnotation.coordinate = _locationToDisplay;
    [self.mapView addAnnotation:_myAnnotation];
    NSLog(@"button 3 pressed");
}

@end