//
//  HomeViewController.h
//  DevCamp
//
//  Created by Rizki Calame on 25-02-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "GyroscopeViewController.h"
#import "WhackAMoleViewViewController.h"

@interface HomeViewController : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UIView *homeView;
@property (nonatomic, retain) UITableView *menuView;
@property (nonatomic, readonly) NSArray *menuItems;

@end
