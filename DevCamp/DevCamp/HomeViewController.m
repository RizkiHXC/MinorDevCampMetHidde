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

@synthesize menuView = menuView,
            menuItems = menuItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        menuItems = [NSArray arrayWithObjects:@"GPS", @"Gyroscope", @"Whac-A-Mole", nil];
        
        menuOpen = false;
        
        [self.view setBackgroundColor:[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]];
        
        UIBarButtonItem *openMenu = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(openMenu)];
        [openMenu setTintColor:[UIColor blueColor]];
        
        self.navigationItem.leftBarButtonItem = openMenu;
        
        menuView = [[UITableView alloc] initWithFrame:self.view.frame];
        [menuView setDelegate:self];
        [menuView setDataSource:self];
        
        self.homeView = [[UIView alloc] initWithFrame:self.view.frame];
        
        MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.homeView.frame];
        [mapView setShowsUserLocation:YES];
        [mapView setShowsBuildings:YES];
        [mapView setDelegate:self];
        [mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:YES];
        [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
        
        [menuView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuItems count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, cell.frame.size.height / 2 - 10, 200, 20)];
    [cellLabel setText:[menuItems objectAtIndex:indexPath.row]];
    [cellLabel setBackgroundColor:[UIColor clearColor]];
    
    [cell addSubview:cellLabel];
    
    // Configure the cell...
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        GyroscopeViewController *viewcontroller = [[GyroscopeViewController alloc] init];
        [self.navigationController pushViewController:viewcontroller animated:YES];
    } else if (indexPath.row == 2) {
        WhackAMoleViewViewController *whackmole = [[WhackAMoleViewViewController alloc] init];
        [self.navigationController pushViewController:whackmole animated:YES];
    }
}



// Functions
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
