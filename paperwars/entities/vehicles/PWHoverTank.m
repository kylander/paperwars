//
//  BWHoverTank.m
//  paperwars
//
//  Created by Tim Wood on 2/20/13.
//
//

#import "PWHoverTank.h"


@implementation PWHoverTank


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
    return HOVERTANK_DAMAGE;
}

- (float)initialHealth {
    return HOVERTANK_HEALTH;
}

- (float)initialRadius {
    return HOVERTANK_RADIUS;
}

- (float)awarenessRadius {
    return HOVERTANK_AWARENESS_RADIUS;
}

- (float)maxFireRadius {
    return HOVERTANK_MAX_FIRE_RADIUS;
}

- (float)angleMarginOfError {
    return HOVERTANK_ERROR_ANGLE;
}


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement {
    PWGroundMovement *_movement = [[PWGroundMovement alloc] init];
    [_movement setHoverHeight:HOVERTANK_HOVER_HEIGHT];
    [_movement setSpeed:HOVERTANK_SPEED];
    return _movement;
}


@end
