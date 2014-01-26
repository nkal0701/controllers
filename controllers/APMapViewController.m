//
//  APMapViewController.m
//  controllers
//
//  Created by Alfred Marius Nkemla Lienou on 1/10/14.
//  Copyright (c) 2014 Alfred Marius Nkemla Lienou. All rights reserved.
//

#import "APMapViewController.h"
#import <MapKit/MapKit.h>

// New York
    #define NY_LATITUDE 40.754445
    #define NY_LONGITUDE -73.977364
    
    // Carpinteria
    #define CA_LATITUDE 34.3989
    #define CA_LONGITUDE -119.5175
    
    #define SPAN_VALUE 0.20f

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
    center.latitude = NY_LATITUDE;
    center.longitude = NY_LONGITUDE;
    // span
    MKCoordinateSpan span;
    span.latitudeDelta = SPAN_VALUE;
    span.longitudeDelta = SPAN_VALUE;
    
    // region center
    region.center = center;
    // region span
    region.span = span;
    
    // assign region to the map
    [self.mapView setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
