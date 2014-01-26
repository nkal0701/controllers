//
//  APAnnotation.m
//  controllers
//
//  Created by Alfred Marius Nkemla Lienou on 1/26/14.
//  Copyright (c) 2014 Alfred Marius Nkemla Lienou. All rights reserved.
//

#import "APAnnotation.h"
#import <MapKit/MapKit.h>


@implementation APAnnotation

- (id)initWithPosition:(CLLocationCoordinate2D)coords
{
    if (self == [super init]) {
        self.coordinate = coords;
    }
    return self;
}

@end
