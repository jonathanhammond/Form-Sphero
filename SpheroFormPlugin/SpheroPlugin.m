//
//  SpheroPlugin.m
//  Sphero
//
//  Created by Jonathan Hammond on 10/10/2016.
//  Copyright © 2016 Just Add Music Media. All rights reserved.
//

#import "SpheroPlugin.h"
#import "SpheroNode.h"

@implementation SpheroPlugin

+ (NSString *)name {
    return @"Sphero";
}

+ (NSString *)description {
    return @"Created by Jonathan Hammond on 10/10/2016";
}

+ (NSArray *)nodeClasses {
    return @[[SpheroNode class]];
}

@end
