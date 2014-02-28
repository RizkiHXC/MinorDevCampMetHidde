//
//  GyroscopeViewController.m
//  DevCamp
//
//  Created by Rizki Calame on 28-02-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import "GyroscopeViewController.h"

@interface GyroscopeViewController ()

@end

@implementation GyroscopeViewController

#define degrees(x) (180 * x / M_PI)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    xLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 20)];
    yLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, 100, 20)];
    zLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, 100, 20)];
    yawLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 100, 20)];
    pitchLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, 100, 20)];
    rollLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 100, 20)];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
	// Do any additional setup after loading the view.
    
    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 1/60;
    [motionManager startDeviceMotionUpdates];

    timer = [NSTimer scheduledTimerWithTimeInterval:(1/60) target:self selector:@selector(read) userInfo:Nil repeats:YES];
    
    if ([motionManager isGyroAvailable]) {
        if (![motionManager isGyroActive]) {
            [motionManager setGyroUpdateInterval:.1];
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
                NSString *x = [[NSString alloc] initWithFormat:@"%@%.02f", @"X is: ", gyroData.rotationRate.x];
                [xLabel setText:x];
                NSString *y = [[NSString alloc] initWithFormat:@"%@%.02f", @"y is: ", gyroData.rotationRate.y];
                [yLabel setText:y];
                NSString *z = [[NSString alloc] initWithFormat:@"%@%.02f", @"Z is: ", gyroData.rotationRate.z];
                [zLabel setText:z];
            }];
        }
    } else {
        NSLog(@"SWAG");
    }
    
    [self.view addSubview:xLabel];
    [self.view addSubview:yLabel];
    [self.view addSubview:zLabel];
    [self.view addSubview:yawLabel];
    [self.view addSubview:rollLabel];
    [self.view addSubview:pitchLabel];
}

- (void) read {
    CMAttitude *attitude;
    CMDeviceMotion *motion = motionManager.deviceMotion;
    attitude = motion.attitude;
    
    NSString *yaw = [NSString stringWithFormat:@"Yaw: %f", degrees(attitude.yaw)];
    [yawLabel setText:yaw];
    
    NSString *pitch = [NSString stringWithFormat:@"Pitch: %f", degrees(attitude.pitch)];
    [pitchLabel setText:pitch];
    
    NSString *roll = [NSString stringWithFormat:@"Roll: %f", degrees(attitude.roll)];
    [rollLabel setText:roll];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
