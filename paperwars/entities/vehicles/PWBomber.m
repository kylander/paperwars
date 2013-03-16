//
//  PWBomber.m
//  paperwars
//
//  Created by Tim Wood on 2/20/13.
//
//

#import "PWBomber.h"


@implementation PWBomber


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
    return BOMBER_DAMAGE;
}

- (float)initialHealth {
    return BOMBER_HEALTH;
}

- (float)initialRadius {
    return BOMBER_RADIUS;
}

- (float)awarenessRadius {
    return BOMBER_AWARENESS_RADIUS;
}

- (float)maxFireRadius {
    return BOMBER_MAX_FIRE_RADIUS;
}

- (float)angleMarginOfError {
    return BOMBER_ERROR_ANGLE;
}


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement {
    PWAirMovement *_movement = [[PWAirMovement alloc] init];
    [_movement setSpeed:BOMBER_SPEED];
    [_movement setWaveHeight:BOMBER_WAVE_HEIGHT];
    [_movement setWaveLength:BOMBER_WAVE_LENGTH];
    return _movement;
}


@end
