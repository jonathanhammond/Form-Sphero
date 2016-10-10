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
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"On / Off" uniqueKey:@"Form.onOffInput" defaultValue:[PMRPrimitive primitiveWithBooleanValue:NO]] portGroup:nil];
        
        // Outputs
        [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"Color" uniqueKey:@"Form.colorOutput"] portGroup:nil];
    }
    return self;
}

- (void)dealloc {
    
}

@end
