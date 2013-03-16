//
//  PWAirMovement.h
//  paperwars
//
//  Created by Tim Wood on 2/23/13.
//
//


#import "cocos2d.h"
#import "PWMovement.h"


@interface PWAirMovement : PWMovement {
    CGPoint _lastPosition;
    float _time;
}


@property (nonatomic, assign) float speed;
@property (nonatomic, assign) float waveLength;
@property (nonatomic, assign) float waveHeight;


@end
