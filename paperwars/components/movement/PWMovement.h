//
//  PWMovement.h
//  paperwars
//
//  Created by Tim Wood on 3/2/13.
//
//


#import "CCNode.h"
#import "PWTerrain.h"


@interface PWMovement : CCNode {
    
}


@property (nonatomic, retain) PWTerrain *terrain;
@property (nonatomic, assign) int allegiance;


#pragma mark -
#pragma mark update


- (void)update:(ccTime)t;


#pragma mark -
#pragma mark x


- (float)terrainHeightAtX:(float)x;


@end
