//
//  PWGroundMovement.m
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "PWGroundMovement.h"


@implementation PWGroundMovement


- (void)update:(ccTime)t {
    CGPoint pos = [parent_ position];
    float miny = [self terrainHeightAtX:pos.x];
    
    if (pos.y > miny + _hoverHeight) {
        pos.y = miny + _hoverHeight;
        _velocity.y -= 1000 * t;
    } else {
        _velocity.y = 0;
    }
    _velocity.x = _speed * self.allegiance;
    pos = ccpAdd(pos, ccpMult(_velocity, t));
    pos.y = fmaxf(miny, pos.y);
	[parent_ setPosition:pos];
}


@end
