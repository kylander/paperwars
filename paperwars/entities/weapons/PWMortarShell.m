//
//  PWMortarShell.m
//  paperwars
//
//  Created by Tim Wood on 2/23/13.
//
//


#import "PWMortarShell.h"


@implementation PWMortarShell


- (id)init {
    self = [super init];
    if (self) {
        CCSprite *skin = [CCSprite spriteWithFile:@"Icon-72.png"];
        [skin setScale:0.3];
        [self addChild:skin];
        [self scheduleOnce:@selector(remove) delay:0.2];
        [self schedule:@selector(update:)];
        
        // collision
        _shape = [[PWShape alloc] init];
        _shape.damage = MORTAR_DAMAGE;
        _shape.radius = MORTAR_RADIUS;
        _shape.isVehicle = NO;
        [self addChild:_shape];
    }
    return self;
}


#pragma mark -
#pragma mark update


- (void)onEnter {
    _shape.allegiance = _allegiance;
    [super onEnter];
}

- (void)update:(float)delta {
    // shape only lasts one frame
    [_shape removeFromParentAndCleanup:YES];
    _shape = nil;
}


#pragma mark -
#pragma mark destroy


- (void)remove {
    [self removeFromParentAndCleanup:YES];
}


#pragma mark -
#pragma mark draw


- (void)draw {
	glLineWidth(1);
    
	ccDrawColor4F(0, 1, 1, 1);
    ccDrawCircle(ccp(0, 0), MORTAR_RADIUS, M_TAU, 16, NO);
    
    [super draw];
}


@end
