//
//  HomeViewController.h
//  DevCamp
//
//  Created by Rizki Calame on 25-02-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HomeViewController : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UIView *homeView;

@end
