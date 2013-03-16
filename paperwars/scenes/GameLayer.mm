//
//  GameLayer.mm
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "GameLayer.h"
#import "PWVehicle.h"
#import "PWCollisionManager.h"

// vehicles
#import "PWBomber.h"
#import "PWTank.h"
#import "PWTroopship.h"
#import "PWHoverTank.h"
#import "PWGunship.h"


@implementation GameLayer


#pragma mark -
#pragma mark scene


+ (CCScene *)scene {
	CCScene *scene = [CCScene node];
	GameLayer *layer = [GameLayer node];
	[scene addChild:layer];
	return scene;
}


#pragma mark -
#pragma mark init


- (id)init {
    self = [super init];
    if (self) {
		// enable events
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = YES;
    }
    return self;
}


#pragma mark -
#pragma mark enter


- (void)onEnter {
	[super onEnter];
    
	[self createBackground];
    
    [self schedule:@selector(update:)];
}


#pragma mark -
#pragma mark background


- (void)createBackground {
	CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCSprite *background;
    
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
        background = [CCSprite spriteWithFile:@"Default.png"];
        background.rotation = 90;
    } else {
        background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
    }
    background.position = ccp(size.width / 2, size.height / 2);
    
    [self addChild:background];
    
    _terrain = [[PWTerrain alloc] init];
    [self addChild:_terrain];
}


#pragma mark -
#pragma mark touch


- (void)addOpponent:(ccTime)t {
    PWVehicle *vehicle = [[PWVehicle alloc] initWithAllegiance:-1];
    vehicle.position = ccp(600, 300);
	[self addChild:vehicle];
}

- (void)addNewSpriteAtPosition:(CGPoint)p {
    nextType = (nextType + 1) % 5;
    
    int allegiance = 1;
	CGSize size = [[CCDirector sharedDirector] winSize];
    
    if (p.x > size.width / 2) {
        allegiance = -1;
    }
    
    PWVehicle *vehicle;
    switch (nextType % 3) {
        case 0:
            vehicle = [[PWTank alloc] initWithAllegiance:allegiance];
            break;
        case 1:
            vehicle = [[PWTroopship alloc] initWithAllegiance:allegiance];
            break;
        case 2:
            vehicle = [[PWHoverTank alloc] initWithAllegiance:allegiance];
            break;
        case 3:
            vehicle = [[PWBomber alloc] initWithAllegiance:allegiance];
            break;
        default:
            vehicle = [[PWGunship alloc] initWithAllegiance:allegiance];
            break;
    }
    
    vehicle.terrain = _terrain;
    vehicle.position = p;
	[self addChild:vehicle];
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		CGPoint location = [touch locationInView:[touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL:location];
		
		[self addNewSpriteAtPosition:location];
	}
}


#pragma mark -
#pragma mark update


- (void)update:(ccTime)t {
    [[PWCollisionManager manager] update];
}


@end
