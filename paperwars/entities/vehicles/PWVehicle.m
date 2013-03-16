//
//  PWVehicle.m
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "PWVehicle.h"
#import "PWShape.h"
#import "PWCollisionManager.h"


@implementation PWVehicle


#pragma mark -
#pragma mark init


- (id)init {
    return [self initWithAllegiance:1];
}

- (id)initWithAllegiance:(int)allegiance {
    self = [super init];
    if (self) {
        // set values
        _allegiance = allegiance;
        
        // movement
        _movement = [self initialMovement];
        _movement.allegiance = allegiance;
        [self addChild:_movement];
        
        // main skin
        [self addChild:[CCSprite spriteWithFile:@"placeholderUnit_72x72.png"]];
        
        // collision
        _shape = [[PWShape alloc] init];
        _shape.isVehicle = YES;
        _shape.damage = [self initialDamage];
        _shape.radius = [self initialRadius];
        _shape.health = [self initialHealth];
        _shape.allegiance = allegiance;
        [self addChild:_shape];
        
        // update
        [self schedule:@selector(update:)];
        [self schedule:@selector(fire) interval:.3];
    }
    return self;
}


#pragma mark -
#pragma mark terrain


- (void)setTerrain:(PWTerrain *)terrain {
    _terrain = terrain;
    [_movement setTerrain:_terrain];
}


#pragma mark -
#pragma mark enter


- (void)onEnter {
    _targetPosition = [self position];
    [super onEnter];
}


#pragma mark -
#pragma mark fire


- (void)fire {
    CGPoint diff = ccpSub(_targetPosition, [self position]);
    float length = ccpLength(diff);
    
    // we never fire outside the awareness radius
    if (length > [self awarenessRadius]) {
        return;
    }
    
    // clamp to max radius
    length = fminf([self maxFireRadius], length);

    float angle = ccpToAngle(diff);
    angle += FloatRandomBetween(-1, 1) * (M_TAU / 360) * [self angleMarginOfError];
    CGPoint point = ccpMult(ccpForAngle(angle), length);
    
    PWMortarShell *shell = [[PWMortarShell alloc] init];
    shell.position = ccpAdd([self position], point);
    shell.allegiance = _allegiance;
    [parent_ addChild:shell];
}


#pragma mark -
#pragma mark radius


- (float)awarenessRadius {
    return 400;
}

- (float)maxFireRadius {
    return 200;
}

- (float)angleMarginOfError {
    return 30;
}


#pragma mark -
#pragma mark initial values


- (float)initialDamage {
    return 1;
}

- (float)initialHealth {
    return 1;
}

- (float)initialRadius {
    return 1;
}


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement {
    return [[PWGroundMovement alloc] init];
}


#pragma mark -
#pragma mark update


- (void)update:(ccTime)t {
    _targetPosition = [[PWCollisionManager manager] nearestOpponent:_allegiance
                                                         toPosition:[self position]
                                                       inXDirection:_allegiance];
    
    if (position_.x > 1000 || position_.x < 0) {
        [self removeFromParentAndCleanup:YES];
    }
    if (_shape && [_shape healthPercent] <= 0) {
        [self removeFromParentAndCleanup:YES];
    }
    
    //[_healthBar setScaleX:[_shape healthPercent]];
}


#pragma mark -
#pragma mark draw


- (void)draw {
	glLineWidth(1);
    
    if (_targetPosition.x < 9999 && _targetPosition.y < 9999) {
        ccDrawColor4F(1, 0, 0, 1);
        ccDrawLine(ccp(0, 0), ccpSub(_targetPosition, [self position]));
    }
    
	ccDrawColor4F(0, 1, 0, 0.25);
    ccDrawCircle(ccp(0, 0), [self awarenessRadius], M_TAU, 16, NO);
	ccDrawColor4F(0, 1, 0, 0.5);
    ccDrawCircle(ccp(0, 0), [self maxFireRadius], M_TAU, 16, NO);
    
    [super draw];
}


@end
