//
//  SpheroPatch.h
//  Sphero
//
//  Created by Jonathan Hammond on 10/10/2016.
//  Copyright © 2016 Just Add Music Media. All rights reserved.
//

#import <Performer/Performer.h>

@interface SpheroPatch : PMRPatch

@property (nonatomic, readonly) PMRPrimitiveInputPort *onOffInput;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *colorOutput;

@end
