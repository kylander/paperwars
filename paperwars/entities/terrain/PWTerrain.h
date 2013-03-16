//
//  PWTerrain.h
//  paperwars
//
//  Created by Tim Wood on 3/2/13.
//
//

#import "cocos2d.h"


@interface PWTerrain : CCNode


@property (nonatomic, assign) float leftY;
@property (nonatomic, assign) float rightY;

@property (nonatomic, assign) float x1;
@property (nonatomic, assign) float x2;
@property (nonatomic, assign) float x3;

@property (nonatomic, assign) float height1;
@property (nonatomic, assign) float height2;
@property (nonatomic, assign) float height3;

@property (nonatomic, assign) float length1;
@property (nonatomic, assign) float length2;
@property (nonatomic, assign) float length3;


#pragma mark -
#pragma mark height


- (float)heightAtPoint:(float)x;


@end
