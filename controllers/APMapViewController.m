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

@interface APMapViewController ()   <NSXMLParserDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *temp;
@property CLLocationCoordinate2D points;

@end

@implementation APMapViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mapView.delegate = self;
    
    [self xmlDocument];
    
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
    
//    // assign region to the map
//    [self.mapView setRegion:region animated:YES];
//    
//    //add annotation
//    [self.mapView addAnnotation:ann];
    
    
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

#pragma mark - xml document
- (void)xmlDocument
{
    //xml document
    // load XML and initialize parsing
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSString *xml = [path stringByAppendingPathComponent:@"ca.xml"];
    NSURL *url = [NSURL fileURLWithPath:xml isDirectory:NO];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser.delegate = self;
    BOOL success = [parser parse];
    if (!success) {
        NSLog(@"You need the XML file to get data");
    }
    //parse
    //root element array
    //point element array
    //CCLocationCoordinate2D - size array
    //MKPolygon
    //MKPolygonView
}

//parse
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    // create array to store points
    if ([elementName isEqualToString:@"ca"]) {
        self.temp = [[NSMutableArray alloc]init];
        
        // store point information in NSDictionary
    } else if ([elementName isEqualToString:@"point"]) {
        NSDictionary *point = [[NSDictionary alloc] initWithObjectsAndKeys:[attributeDict objectForKey:@"lat"], @"latitude", [attributeDict objectForKey:@"lng"], @"longitude", nil];
        [self.temp addObject:point];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"ca"]) {
        // create CLLocationCoordinate2D
        CLLocationCoordinate2D *coordinates = malloc(sizeof(CLLocationCoordinate2D) * [self.temp count]);
        
        // store points in coordinates object
        for (int i = 0; i < [self.temp count]; i++) {
            NSDictionary *dict = [self.temp objectAtIndex:i];
            double lat = [[dict valueForKey:@"latitude"] doubleValue];
            double lon = [[dict valueForKey:@"longitude"] doubleValue];
            CLLocationCoordinate2D point;
            point.latitude = lat;
            point.longitude = lon;
            coordinates[i] = point;
            
            APAnnotation *ann = [[APAnnotation alloc]initWithPosition:point];
            [self.mapView addAnnotation:ann];
        }
        
        // create polygon from coordinates
        MKPolygon *polygon = [MKPolygon polygonWithCoordinates:coordinates count:[self.temp count]];
        [self.mapView addOverlay:polygon];
        
        // scale map to display polygon
        [self.mapView setVisibleMapRect:polygon.boundingMapRect];
        
        free(coordinates);
    }
}

- (void) handleSingleTap
{
    
}

#pragma mark - overlay renderer
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
	MKPolygonRenderer *polygonRenderer = [[MKPolygonRenderer alloc] initWithOverlay:overlay];
	polygonRenderer.strokeColor = [[UIColor cyanColor] colorWithAlphaComponent:0.5];
	polygonRenderer.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.6];
    polygonRenderer.lineWidth = 1;
    
	return polygonRenderer;
}

@end
