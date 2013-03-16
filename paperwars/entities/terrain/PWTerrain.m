//
//  PWTerrain.m
//  paperwars
//
//  Created by Tim Wood on 3/2/13.
//
//


#import "PWTerrain.h"


@implementation PWTerrain


- (id)init {
    self = [super init];
    if (self) {
        _height1 = 200;
        _length1 = 300;
        _x1 = 400;
        
        _height2 = -50;
        _length2 = 200;
        _x2 = 600;
        
        _height3 = 40;
        _length3 = 200;
        _x3 = 800;
        
        _leftY = 20;
        _rightY = 300;
    }
    return self;
}


#pragma mark -
#pragma mark height


- (float)heightAtPoint:(float)x {
    float width = [[CCDirector sharedDirector] winSize].width;
    float percent = x / width;
    
    float linearY = FloatLerp(_leftY, _rightY, percent);
    float diffy = 0;
    
    if (fabsf(x - _x1) < _length1) {
        diffy += (1 + cosf(((x - _x1) / _length1) * M_PI)) * _height1 / 2;
    }
    
    if (fabsf(x - _x2) < _length2) {
        diffy += (1 + cosf(((x - _x2) / _length2) * M_PI)) * _height2 / 2;
    }
    
    if (fabsf(x - _x3) < _length3) {
        diffy += (1 + cosf(((x - _x3) / _length3) * M_PI)) * _height3 / 2;
    }
    
    return linearY + diffy;
}


#pragma mark -
#pragma mark draw


- (void)draw {
	glLineWidth(3);
    
    CGPoint points[200];
    
    float width = [[CCDirector sharedDirector] winSize].width;
    
    for (int i = 0; i < 200; i++) {
        float x = (i / 200.0) * width;
        points[i] = ccp(x, [self heightAtPoint:x]);
    }
    
	ccDrawColor4F(0, 0, 0, 1);
    ccDrawPoly(points, 200, NO);
    //ccDrawPoints(points, 60);
    
    [super draw];
}


@end
