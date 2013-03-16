//
//  GameLayer.h
//  paperwars
//
//  Created by Tim Wood on 2/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PWTerrain.h"


@interface GameLayer : CCLayer {
    int nextType;
    
    PWTerrain *_terrain;
}


#pragma mark -
#pragma mark scene


+ (CCScene *)scene;


@end
