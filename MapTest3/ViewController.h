//
//  ViewController.h
//  MapTest3
//
//  Created by James Baker on 4/28/18.
//  Copyright © 2018 James Baker. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@import CoreLocation;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *outputTextView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

