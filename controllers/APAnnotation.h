//
//  APAnnotation.h
//  controllers
//
//  Created by Alfred Marius Nkemla Lienou on 1/26/14.
//  Copyright (c) 2014 Alfred Marius Nkemla Lienou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface APAnnotation : NSObject  <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id)initWithPosition:(CLLocationCoordinate2D)coords;

@end
