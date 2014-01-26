//
//  APMapViewController.m
//  controllers
//
//  Created by Alfred Marius Nkemla Lienou on 1/10/14.
//  Copyright (c) 2014 Alfred Marius Nkemla Lienou. All rights reserved.
//

#import "APMapViewController.h"
#import <MapKit/MapKit.h>
#import "APAnnotation.h"

// New York
    #define NY_LATITUDE 40.754445
    #define NY_LONGITUDE -73.977364
    
    // Carpinteria
    #define CAM_LATITUDE 7.3697
    #define CAM_LONGITUDE 12.3547
    
    #define SPAN_VALUE 60.00f

@interface APMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation APMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // region
    MKCoordinateRegion region;
    // center
    CLLocationCoordinate2D center;
    center.latitude = CAM_LATITUDE;
    center.longitude = CAM_LONGITUDE;
    // span
    MKCoordinateSpan span;
    span.latitudeDelta = SPAN_VALUE;
    span.longitudeDelta = SPAN_VALUE;
    
    // region center
    region.center = center;
    // region span
    region.span = span;
    
    // location
    CLLocationCoordinate2D location;
    location.longitude = CAM_LONGITUDE;
    location.latitude = CAM_LATITUDE;
    
    // annotation
    APAnnotation *ann = [[APAnnotation alloc]initWithPosition:location];
    ann.title = @"New York";
    ann.subtitle = @"Hello World";
    
    // assign region to the map
    [self.mapView setRegion:region animated:YES];
    
    //add annotation
    [self.mapView addAnnotation:ann];
    
//    MKMapCamera* camera = [MKMapCamera
//                           cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)region.center
//                           fromEyeCoordinate:(CLLocationCoordinate2D)location
//                           eyeAltitude:(CLLocationDistance)SPAN_VALUE];
//    [self.mapView setCamera:camera animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

@end
