//
//  SpheroPatch.m
//  Sphero
//
//  Created by Jonathan Hammond on 10/10/2016.
//  Copyright © 2016 Just Add Music Media. All rights reserved.
//

#import "SpheroPatch.h"

@implementation SpheroPatch

- (void)processPatchWithContext:(PMRProcessContext *)context {
    // Start off with a black color.
    RIColorRGBA randomColor = RIColorBlackRGBA;
    
    // Get the value from the on/off input.
    BOOL onOff = _onOffInput.booleanValue;
    
    // If the input is on, create a random color.
    if (onOff)
        randomColor = RIColorMakeRGBA(randomFloat(),
                                      randomFloat(),
                                      randomFloat(),
                                      1.0);
    
    // Store the color in the color output.
    _colorOutput.colorValue = randomColor;
}

float randomFloat() {
    return ((double)arc4random() / 0x100000000);
}

@end
