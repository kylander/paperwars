//
//  PWGroundMovement.h
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import "cocos2d.h"
#import "PWMovement.h"


@interface PWGroundMovement : PWMovement {
    CGPoint _velocity;
}


@property (nonatomic, assign) float hoverHeight;
@property (nonatomic, assign) float speed;


@end
