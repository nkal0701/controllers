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

#pragma mark - life cycle
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
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - device orientation method
- (void)updateLayoutForNewOrientation:(UIInterfaceOrientation)orientation
{
    switch (self.interfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            [self.mapView setFrame:CGRectMake(0, 0, 320, 568)];
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            [self.mapView setFrame:CGRectMake(0, 0, 320, 568)];
            break;
        case UIInterfaceOrientationLandscapeLeft:
            [self.mapView setFrame:CGRectMake(0, 0, 568, 320)];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [self.mapView setFrame:CGRectMake(0, 0, 568, 320)];
            break;
            
        default:
            break;
    }
    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    [self updateLayoutForNewOrientation:self.interfaceOrientation];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
