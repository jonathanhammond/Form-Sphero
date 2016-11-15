//
//  SpheroPatch.m
//  Sphero
//
//  Created by Jonathan Hammond on 10/10/2016.
//  Copyright © 2016 Just Add Music Media. All rights reserved.
//

#import "SpheroPatch.h"
#import <RobotKit/RobotKit.h>

//@property (nonatomic) BOOL ledOn;
//@property (strong, nonatomic) IBOutlet UILabel* connectionLabel;
//@property (strong, atomic) RKConvenienceRobot* robot;
//@property (nonatomic) BOOL ledOn;
//@property (strong, atomic) RKConvenienceRobot* robot;

//@end

@implementation SpheroPatch

//- (BOOL)isConsumerPatch {
//    return YES;
//}

BOOL ledOn;
RKConvenienceRobot *robot;

- (void)processPatchWithContext:(PMRProcessContext *)context {
    
    NSLog(@"start");
    // [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    [[RKRobotDiscoveryAgent sharedAgent] addNotificationObserver:self selector:@selector(handleRobotStateChangeNotification:)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
        NSLog (@"discovering");
    // _connectionLabel.text = @"Discovering Robots";
    
    
    
    
    [RKRobotDiscoveryAgent startDiscovery];
    
 //   [self.handleRobotStateChangeNotification ];
    
    // Get the value from the on/off input.
    BOOL onOff = _onOffInput.booleanValue;
    
    // If the input is on, create a random color.
    if (onOff)

    
    // Store the color in the color output.
        [robot driveWithHeading:_HeadingDegrees.numberValue andVelocity:_andVelocity.numberValue];
    else
    [robot stop];
     }



    


/*- (void)viewDidLoad {
 //  [super viewDidLoad];
 [[RKRobotDiscoveryAgent sharedAgent] addNotificationObserver:self selector:@selector(handleRobotStateChangeNotification:)];
 
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(appWillResignActive:)
 name:UIApplicationWillResignActiveNotification
 object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(appDidBecomeActive:)
 name:UIApplicationDidBecomeActiveNotification
 object:nil];
 }
 */
- (void)appDidBecomeActive:(NSNotification*)n {
    NSLog (@"hmmm");
    [self startDiscovery];
 
    
}

- (void)appWillResignActive:(NSNotification*)n {
    NSLog (@"stopDiscovery");
    [RKRobotDiscoveryAgent stopDiscovery];
    //   [_connectionLabel setText:@"Sleeping"];
    [RKRobotDiscoveryAgent disconnectAll];
}

- (void)startDiscovery {
    NSLog (@"discovering");
    // _connectionLabel.text = @"Discovering Robots";
    [RKRobotDiscoveryAgent startDiscovery];
}

- (void)sendSetDataStreamingCommand {
    // Requesting the Accelerometer X, Y, and Z filtered (in Gs)
    //            the IMU Angles roll, pitch, and yaw (in degrees)
    //            the Quaternion data q0, q1, q2, and q3 (in 1/10000) of a Q
    RKDataStreamingMask mask =  RKDataStreamingMaskAccelerometerFilteredAll |
    RKDataStreamingMaskIMUAnglesFilteredAll   |
    RKDataStreamingMaskQuaternionAll;
    [robot enableSensors:mask atStreamingRate:10];
}

- (void)handleAsyncMessage:(RKAsyncMessage *)message forRobot:(id<RKRobotBase>)robot {
    // Need to check which type of async data is received as this method will be called for
    // data streaming packets and sleep notification packets. We are going to ingnore the sleep
    // notifications.
    if ([message isKindOfClass:[RKDeviceSensorsAsyncData class]]) {
        
        // Received sensor data, so display it to the user.
        RKDeviceSensorsAsyncData *sensorsAsyncData = (RKDeviceSensorsAsyncData *)message;
        RKDeviceSensorsData *sensorsData = [sensorsAsyncData.dataFrames lastObject];
        RKAccelerometerData *accelerometerData = sensorsData.accelerometerData;
        RKAttitudeData *attitudeData = sensorsData.attitudeData;
        RKQuaternionData *quaternionData = sensorsData.quaternionData;
        
        
        // Print data to the text fields


        _xValueLabel.numberValue = accelerometerData.acceleration.x;
        _yValueLabel.stringValue = [NSString stringWithFormat:@"%.6f", accelerometerData.acceleration.y];
        _zValueLabel.stringValue = [NSString stringWithFormat:@"%.6f", accelerometerData.acceleration.z];
        _pitchValueLabel.stringValue = [NSString stringWithFormat:@"%.0f", attitudeData.pitch];
        _rollValueLabel.stringValue = [NSString stringWithFormat:@"%.0f", attitudeData.roll];
        _yawValueLabel.stringValue = [NSString stringWithFormat:@"%.0f", attitudeData.yaw];
        _q0ValueLabel.stringValue = [NSString stringWithFormat:@"%.6f", quaternionData.quaternions.q0];
        _q1ValueLabel.stringValue = [NSString stringWithFormat:@"%.6f", quaternionData.quaternions.q1];
        _q2ValueLabel.stringValue = [NSString stringWithFormat:@"%.6f", quaternionData.quaternions.q2];
        _q3ValueLabel.stringValue = [NSString stringWithFormat:@"%.6f", quaternionData.quaternions.q3];
        
    }
}

- (void)handleRobotStateChangeNotification:(RKRobotChangedStateNotification*)n {
    switch(n.type) {
            NSLog (@"Running@");
        case RKRobotConnecting:
            [self handleConnecting];
            break;
        case RKRobotOnline: {
            // Do not allow the robot to connect if the application is not running
            RKConvenienceRobot *convenience = [RKConvenienceRobot convenienceWithRobot:n.robot];
            if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateActive) {
                [convenience disconnect];
                return;
            }
            
            robot = convenience;
           //   robot = convenience;
            
            [self handleConnected];
            break;
        }
        case RKRobotDisconnected:
            [self handleDisconnected];
            robot = nil;
         //   robot = nil;
            [RKRobotDiscoveryAgent startDiscovery];
            break;
        default:
            break;
    }
}

- (void)handleConnecting {
    // [_connectionLabel setText:[NSString stringWithFormat:@"%@ Connecting", _robot.robot.name]];
    NSLog(@"connecting");
  //  _colorOutput.stringValue = [NSString stringWithFormat:@"%@ Connecting", _robot.robot.name];
}

- (void)handleConnected {
    //  [_connectionLabel setText:_robot.robot.name];
  //  NSLog (@"toogleLED");
    [self toggleLED];
}

- (void)handleDisconnected {
    // _connectionLabel.text = @"Disconnected";
    [self startDiscovery];
}

/*- (IBAction)onDisconnectPressed:(id)sender {
 if (_robot) {
 [_connectionLabel setText:@"Disconnecting..."];
 [_robot sleep];
 }
 }
 */
- (void)toggleLED {
    // NSLog (@"lights");

  //
    BOOL _ledOn;
      if(!robot || ![robot isConnected]) return; // stop the toggle if no robot.
    
      if (_ledOn) {
          [robot setLEDWithRed:0 green:0 blue:0];
       }
      else {

          [robot setLEDWithRed:_red.numberValue green:_green.numberValue blue:_blue.numberValue];
      }
      _ledOn = !_ledOn;
    [self performSelector:@selector(toggleLED) withObject:nil afterDelay:0.5];
 
}


@end
