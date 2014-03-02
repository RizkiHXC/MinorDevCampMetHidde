//
//  WhackAMoleViewViewController.m
//  DevCamp
//
//  Created by Hidde Statema on 02-03-14.
//  Copyright (c) 2014 Rizki Calame. All rights reserved.
//

#import "WhackAMoleViewViewController.h"

@interface WhackAMoleViewViewController (){
    UIImageView *mole;
    
    UIImageView *top;
    UIImageView *bottom;
    
    UIImageView *moker;
    
    
    NSTimer *changeMolePosition;
    
    int score;
    
    UILabel *scoreLabel;
}

@end

@implementation WhackAMoleViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self.view setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg_dirt.png"]]];
        
        
        
        top = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 568, 160)];
        [top setImage:[UIImage imageNamed:@"grass_upper.png"]];
        [self.view addSubview:top];
        
        
        mole = [[UIImageView alloc] initWithFrame:CGRectMake(60, 80, 100, 100)];
        [mole setImage:[UIImage imageNamed:@"mole_1.png"]];
        [self.view addSubview:mole];
        
        
        bottom = [[UIImageView alloc] initWithFrame:CGRectMake(0, 160, 568, 160)];
        [bottom setImage:[UIImage imageNamed:@"grass_lower.png"]];
        [self.view addSubview:bottom];
        
        scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 568, 33)];
        [scoreLabel setTextAlignment:NSTextAlignmentCenter];
        [scoreLabel setTextColor:[UIColor whiteColor]];
        [scoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16]];
        [self.view addSubview:scoreLabel];
        
        
        [self updateUI];
        score = 0;
        
        
        moker = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 164, 193)];
        [moker setImage:[UIImage imageNamed:@"moker.png"]];
        [self.view addSubview:moker];
        
        
        
        changeMolePosition = [NSTimer scheduledTimerWithTimeInterval:4.5f target:self selector:@selector(setMoleToARandomPosition) userInfo:nil repeats:YES];
        
        
        
        UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
        accel.delegate = self;
        accel.updateInterval = 1.0f/120.0f;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}





- (void)updateUI {
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %i", score]];
    [mole setImage:[UIImage imageNamed:@"mole_thump4.png"]];
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeMoleImageBack) userInfo:nil repeats:NO];
}

- (void)changeMoleImageBack {
    [mole setImage:[UIImage imageNamed:@"mole_1.png"]];
}


- (void)checkMokerHitsMole {
    
    // animation
    [moker setImage:[UIImage imageNamed:@"moker2.png"]];
    [NSTimer scheduledTimerWithTimeInterval:.5f target:self selector:@selector(changeMokerImageBack) userInfo:nil repeats:NO];
    
    // check
    int positionMole = mole.frame.origin.x;
    int positionMoker = moker.frame.origin.x;
    
    int distance = positionMoker - positionMole;
    
    NSLog(@"Distance between hammer and mole: %i", distance);
    
    if(distance > -50 && distance < 50) {
        score++;
        [self updateUI];
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    }
}

- (void)changeMokerImageBack {
    [moker setImage:[UIImage imageNamed:@"moker.png"]];
}

- (void)setMoleToARandomPosition {
    int e = arc4random()%3;
    
    switch (e) {
        case 0:
            [mole setFrame:CGRectMake(60, 80, mole.frame.size.width, mole.frame.size.height)];
            break;
        case 1:
            [mole setFrame:CGRectMake(235, 80, mole.frame.size.width, mole.frame.size.height)];
            break;
        case 2:
            [mole setFrame:CGRectMake(405, 80, mole.frame.size.width, mole.frame.size.height)];
            break;
            
        default:
            break;
    }
}


- (void)accelerometer:(UIAccelerometer *)acel didAccelerate:(UIAcceleration *)acceleration {
    
    [moker setFrame:CGRectMake(moker.frame.origin.x + (acceleration.y *8), moker.frame.origin.y + acceleration.x, moker.frame.size.width, moker.frame.size.height)];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        [self checkMokerHitsMole];
    }
}

@end
