//
//  PWVehicle.h
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "cocos2d.h"
#import "PWGroundMovement.h"
#import "PWAirMovement.h"
#import "PWMortarShell.h"
#import "PWTerrain.h"
#import "PWMovement.h"


@class PWShape;
@class PWGroundMovement;


@interface PWVehicle : CCNode {
@private;
    CCSprite *_healthBar;
    PWMovement *_movement;
    
    CGPoint _targetPosition;
}


#pragma mark -
#pragma mark init


- (id)initWithAllegiance:(int)allegiance;


#pragma mark -
#pragma mark properties


@property (nonatomic, assign) PWTerrain *terrain;
@property (nonatomic, retain) PWShape *shape;
@property (nonatomic, assign) int allegiance;


#pragma mark -
#pragma mark radius


- (float)awarenessRadius;
- (float)maxFireRadius;
- (float)angleMarginOfError;


#pragma mark -
#pragma mark initial values


- (float)initialDamage;
- (float)initialHealth;
- (float)initialRadius;


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement;


@end
