//
//  PWMortarShell.h
//  paperwars
//
//  Created by Tim Wood on 2/23/13.
//
//


#import "cocos2d.h"
#import "PWShape.h"


@interface PWMortarShell : CCNode {
@private;
    PWShape *_shape;
}


@property (nonatomic, assign) int allegiance;


@end
