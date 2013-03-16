//
//  PWShape.m
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "PWCollisionManager.h"
#import "PWShape.h"


@implementation PWShape


#pragma mark -
#pragma mark enter / exit


- (void)onEnter {
    [super onEnter];
    [[PWCollisionManager manager] add:self];
}

- (void)onExit {
    [super onExit];
    [[PWCollisionManager manager] remove:self];
}


#pragma mark -
#pragma mark position


- (CGPoint)worldPosition {
    if (parent_) {
        return [parent_ convertToWorldSpace:position_];
    }
    return position_;
}


#pragma mark -
#pragma mark health


- (void)doDamage:(float)damage {
    _damageDone = fminf(_health, _damageDone + damage);
}

- (void)doHealing:(float)healing {
    _damageDone = fmaxf(0, _damageDone - healing);
}

- (float)healthPercent {
    return (_health - _damageDone) / _health;
}


#pragma mark -
#pragma mark collision


- (BOOL)willCollideWith:(PWShape *)shape {
    if ([shape allegiance] == [self allegiance]) {
        return NO;
    }
    float distanceSquared = ccpDistanceSQ([self worldPosition], [shape worldPosition]);
    float radiiSquared = ([self radius] + [shape radius]) * ([self radius] + [shape radius]);
    return (distanceSquared < radiiSquared);
}

- (void)didCollideWith:(PWShape *)shape {
    [self doDamage:[shape damage]];
}


#pragma mark -
#pragma mark draw


- (void)draw {
	glLineWidth(1);
    
	ccDrawColor4F(0, 1, 1, 1);
    ccDrawCircle(ccp(0, 0), _radius, M_TAU, 16, NO);
    
    [super draw];
}

@end
