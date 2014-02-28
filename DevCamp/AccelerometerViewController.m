//
//  AccelerometerViewController.m
//  DevCamp
//
//  Created by Rizki Calame on 27-02-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import "AccelerometerViewController.h"

@interface AccelerometerViewController ()

@end

@implementation AccelerometerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self.view setBackgroundColor:[UIColor blueColor]];
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

@end
