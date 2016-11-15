//
//  SpheroPatch.h
//  Sphero
//
//  Created by Jonathan Hammond on 10/10/2016.
//  Copyright © 2016 Just Add Music Media. All rights reserved.
//

#import <Performer/Performer.h>

@interface SpheroPatch : PMRPatch

@property (nonatomic, readonly) PMRPrimitiveInputPort *red;
@property (nonatomic, readonly) PMRPrimitiveInputPort *green;
@property (nonatomic, readonly) PMRPrimitiveInputPort *blue;
@property (nonatomic, readonly) PMRPrimitiveInputPort *HeadingDegrees;
@property (nonatomic, readonly) PMRPrimitiveInputPort *andVelocity;
@property (nonatomic, readonly) PMRPrimitiveInputPort *onOffInput;






@property (nonatomic, readonly) PMRPrimitiveOutputPort *xValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *yValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *zValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *rollValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *yawValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *pitchValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *q0ValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *q1ValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *q2ValueLabel;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *q3ValueLabel;

@end
