//
//  PWTroopship.m
//  paperwars
//
//  Created by Tim Wood on 2/20/13.
//
//

#import "PWTroopship.h"


@implementation PWTroopship


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
    return TROOPSHIP_DAMAGE;
}

- (float)initialHealth {
    return TROOPSHIP_HEALTH;
}

- (float)initialRadius {
    return TROOPSHIP_RADIUS;
}

- (float)awarenessRadius {
    return TROOPSHIP_AWARENESS_RADIUS;
}

- (float)maxFireRadius {
    return TROOPSHIP_MAX_FIRE_RADIUS;
}

- (float)angleMarginOfError {
    return TROOPSHIP_ERROR_ANGLE;
}


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement {
    PWGroundMovement *_movement = [[PWGroundMovement alloc] init];
    [_movement setHoverHeight:TROOPSHIP_HOVER_HEIGHT];
    [_movement setSpeed:TROOPSHIP_SPEED];
    return _movement;
}


@end
