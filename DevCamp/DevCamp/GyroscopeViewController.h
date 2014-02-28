//
//  GyroscopeViewController.h
//  DevCamp
//
//  Created by Rizki Calame on 28-02-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface GyroscopeViewController : UIViewController {
    
    CMMotionManager *motionManager;
    NSOperationQueue *operationQueue;
    NSTimer *timer;
    
    UILabel *xLabel;
    UILabel *yLabel;
    UILabel *zLabel;
    UILabel *yawLabel;
    UILabel *pitchLabel;
    UILabel *rollLabel;
}

@end
