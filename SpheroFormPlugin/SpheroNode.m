//
//  SpheroNode.m
//  Sphero
//
//  Created by Jonathan Hammond on 10/10/2016.
//  Copyright © 2016 Just Add Music Media. All rights reserved.
//

#import "SpheroNode.h"

@implementation SpheroNode

+ (NSString *)defaultName {
    return @"Sphero";
}

+ (NSString *)processClassName {
    return @"SpheroPatch";
}

- (instancetype)init {
    if ((self = [super init]) != nil) {
        // Inputs
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"red" uniqueKey:@"Form.red" defaultValue:[PMRPrimitive primitiveWithNumberValue:0]] portGroup:nil];
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"green" uniqueKey:@"Form.green" defaultValue:[PMRPrimitive primitiveWithNumberValue:0]] portGroup:nil];
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"blue" uniqueKey:@"Form.blue" defaultValue:[PMRPrimitive primitiveWithNumberValue:0]] portGroup:nil];
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"HeadingDegrees" uniqueKey:@"Form.HeadingDegrees" defaultValue:[PMRPrimitive primitiveWithNumberValue:0]] portGroup:nil];
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"andVelocity" uniqueKey:@"Form.andVelocity" defaultValue:[PMRPrimitive primitiveWithNumberValue:0]] portGroup:nil];
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"onOffInput" uniqueKey:@"Form.onOffInput" defaultValue:[PMRPrimitive primitiveWithBooleanValue:NO]] portGroup:nil];
        
        
        
        // Outputs
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"xValueLabel" uniqueKey:@"Form.xValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"yValueLabel" uniqueKey:@"Form.yValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"zValueLabel" uniqueKey:@"Form.zValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"pitchValueLabel" uniqueKey:@"Form.pitchValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"rollValueLabel" uniqueKey:@"Form.rollValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"yawValueLabel" uniqueKey:@"Form.yawValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"q0ValueLabel" uniqueKey:@"Form.q0ValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"q1ValueLabel" uniqueKey:@"Form.q1ValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"q2ValueLabel" uniqueKey:@"Form.q2ValueLabel"] portGroup:nil];
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"q3ValueLabel" uniqueKey:@"Form.q3ValueLabel"] portGroup:nil];
    }
    return self;
}


- (void)dealloc {
    
}

@end
