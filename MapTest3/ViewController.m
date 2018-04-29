//
//  ViewController.m
//  MapTest3
//
//  Created by James Baker on 4/28/18.
//  Copyright © 2018 James Baker. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButton:(id)sender {
    CLLocationCoordinate2D source =  CLLocationCoordinate2DMake(44.26686859130859, 24.51898765563965);
    CLLocationCoordinate2D destination = CLLocationCoordinate2DMake(44.10536575317383, 24.3679256439209);
    
    MKPlacemark *placemarkSrc = [[MKPlacemark alloc] initWithCoordinate:source addressDictionary:nil];
    MKMapItem *mapItemSrc = [[MKMapItem alloc] initWithPlacemark:placemarkSrc];
    MKPlacemark *placemarkDest = [[MKPlacemark alloc] initWithCoordinate:destination addressDictionary:nil];
    MKMapItem *mapItemDest = [[MKMapItem alloc] initWithPlacemark:placemarkDest];
    [mapItemSrc setName:@"Start Name"];
    [mapItemDest setName:@"Destination Name"];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:mapItemSrc];
    [request setDestination:mapItemDest];
    [request setTransportType:MKDirectionsTransportTypeAutomobile];
    request.requestsAlternateRoutes = NO;
    //can specify NSDate *departureDate;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];

    
    [directions calculateETAWithCompletionHandler:
     ^(MKETAResponse *response, NSError *error) {
         if (error) {
             // Handle Error
             NSLog(@"Erroroed out the calculateETAWithCompletionHandler with error code %ldd and userInfo %@",(long)error.code, error.userInfo);
         } else {
            //[self->_mapView removeOverlays:self->_mapView.overlays];
            //[self showRoute:response];
             
            //Output the Departure Date
            NSDate *busExpectedDepartureDate = response.expectedDepartureDate;
            NSLog(@"The expected Departure time is %@", busExpectedDepartureDate);

            //Output the ExpectedTravelTime
            NSTimeInterval busExpectedTravelTime = response.expectedTravelTime;
            NSLog(@"The expected Travel time is %f", busExpectedTravelTime);
             
            //Output the ExpectedArrival Date
            NSDate *busExpectedArrivalDate = response.expectedArrivalDate;
            NSLog(@"The expected Arrival date is %@", busExpectedArrivalDate);
                   
            //Output the travel distance
            CLLocationDistance busDistance = response.distance;
            NSLog(@"The travel distance is %f", busDistance);
                   
            //Output the Transportation Type
            MKDirectionsTransportType busTransportType = response.transportType;
            NSLog(@"The Transportatoin type is %lu", (unsigned long)busTransportType);
             //MKDirectionsTransportTypeAutomobile
             //MKDirectionsTransportTypeWalking
             //MKDirectionsTransportTypeTransit
             //MKDirectionsTransportTypeAny
             
         }
     }];

}

@end
