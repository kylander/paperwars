//
//  PWGunship.m
//  paperwars
//
//  Created by Tim Wood on 2/20/13.
//
//

#import "PWGunship.h"


@implementation PWGunship


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
    return GUNSHIP_DAMAGE;
}

- (float)initialHealth {
    return GUNSHIP_HEALTH;
}

- (float)initialRadius {
    return GUNSHIP_RADIUS;
}

- (float)awarenessRadius {
    return GUNSHIP_AWARENESS_RADIUS;
}

- (float)maxFireRadius {
    return GUNSHIP_MAX_FIRE_RADIUS;
}

- (float)angleMarginOfError {
    return GUNSHIP_ERROR_ANGLE;
}


#pragma mark -
#pragma mark movement


- (PWMovement *)initialMovement {
    PWAirMovement *_movement = [[PWAirMovement alloc] init];
    [_movement setSpeed:GUNSHIP_SPEED];
    [_movement setWaveHeight:GUNSHIP_WAVE_HEIGHT];
    [_movement setWaveLength:GUNSHIP_WAVE_LENGTH];
    return _movement;
}


@end
