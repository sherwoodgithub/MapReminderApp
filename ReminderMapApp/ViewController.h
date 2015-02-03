//
//  ViewController.h
//  ReMap
//
//  Created by Stephen on 2/2/15.
//  Copyright (c) 2015 Sherwood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    //UIButton *buttonOne;
    //UIButton *buttonTwo;
    //UIButton *buttonThree;
    
}

@property CLLocationCoordinate2D locationToDisplay;
@property MKCoordinateRegion viewRegion;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;

@end
