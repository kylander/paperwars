//
//  PWAirMovement.m
//  paperwars
//
//  Created by Tim Wood on 2/23/13.
//
//


#import "PWAirMovement.h"


@implementation PWAirMovement


- (void)update:(ccTime)t {
    _time += t;
    
    CGPoint pos;
    pos.x = _speed * _time * self.allegiance;
    pos.y = sinf(M_PI * 2 * pos.x / _waveLength) * _waveHeight;
    [self move:pos];
}

- (void)move:(CGPoint)point {
    CGPoint diff = ccpSub(point, _lastPosition);
    _lastPosition = point;
	[parent_ setPosition:ccpAdd([parent_ position], diff)];
}


@end
