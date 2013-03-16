//
//  PWTank.m
//  paperwars
//
//  Created by Tim Wood on 2/20/13.
//
//

#import "PWTank.h"


@implementation PWTank


#pragma mark -
#pragma mark init


- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark -
#pragma mark initial values


- (float)initialDamage {
    return TANK_DAMAGE;
}

- (float)initialHealth {
    return TANK_HEALTH;
}

- (float)initialRadius {
    return TANK_RADIUS;
}

- (float)awarenessRadius {
    return TANK_AWARENESS_RADIUS;
}

- (float)maxFireRadius {
    return TANK_MAX_FIRE_RADIUS;
}

- (float)angleMarginOfError {
    return TANK_ERROR_ANGLE;
}


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement {
    PWGroundMovement *_movement = [[PWGroundMovement alloc] init];
    [_movement setHoverHeight:TANK_HOVER_HEIGHT];
    [_movement setSpeed:TANK_SPEED];
    return _movement;
}


@end
