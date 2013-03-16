//
//  PWShape.h
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface PWShape : CCNode {
@private;
    float _damageDone;
}


#pragma mark -
#pragma mark properties


@property (nonatomic, assign) float damage;
@property (nonatomic, assign) float health;
@property (nonatomic, assign) int allegiance;
@property (nonatomic, assign) float radius;
@property (nonatomic, assign) BOOL isVehicle;


#pragma mark -
#pragma mark position


- (CGPoint)worldPosition;


#pragma mark -
#pragma mark health


- (void)doDamage:(float)damage;
- (void)doHealing:(float)healing;
- (float)healthPercent;


#pragma mark -
#pragma mark collision


- (BOOL)willCollideWith:(PWShape *)shape;
- (void)didCollideWith:(PWShape *)shape;


@end
