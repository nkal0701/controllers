//
//  APMapView.h
//  controllers
//
//  Created by Alfred Marius Nkemla Lienou on 1/26/14.
//  Copyright (c) 2014 Alfred Marius Nkemla Lienou. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface APMapView : MKMapView

@property (nonatomic, assign) id <MKMapViewDelegate> delegate;

@end
