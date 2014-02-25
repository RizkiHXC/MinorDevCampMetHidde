//
//  HomeViewController.m
//  DevCamp
//
//  Created by Rizki Calame on 25-02-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () {
    BOOL *menuOpen;
}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        menuOpen = false;
        
        [self.view setBackgroundColor:[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]];
        
        UIBarButtonItem *openMenu = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(openMenu)];
        [openMenu setTintColor:[UIColor blueColor]];
        
        self.navigationItem.leftBarButtonItem = openMenu;
        
        UITableView *menuView = [[UITableView alloc] initWithFrame:self.view.frame];
        [menuView setDelegate:self];
        [menuView setDataSource:self];
        
        self.homeView = [[UIView alloc] initWithFrame:self.view.frame];
        
        MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.homeView.frame];
        [mapView setShowsUserLocation:YES];
        [mapView setShowsBuildings:YES];
        [mapView setDelegate:self];
        [mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:YES];
        [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
        
        [self.view addSubview:menuView];
        [self.view addSubview:self.homeView];
        [self.homeView addSubview:mapView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) openMenu {
    NSLog(@"Open Menu");
    
    if (menuOpen) {
        [UIView animateWithDuration:.4 animations:^{
            self.homeView.frame = CGRectMake(self.homeView.frame.origin.x - 200, self.homeView.frame.origin.y, self.homeView.frame.size.width, self.homeView.frame.size.height);
        }];
        
        menuOpen = false;
    } else {
        [UIView animateWithDuration:.4 animations:^{
            self.homeView.frame = CGRectMake(self.homeView.frame.origin.x + 200, self.homeView.frame.origin.y, self.homeView.frame.size.width, self.homeView.frame.size.height);
        }];
        
        menuOpen = true;
    }
}

@end
