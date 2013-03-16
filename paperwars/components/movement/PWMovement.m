//
//  PWMovement.m
//  paperwars
//
//  Created by Tim Wood on 3/2/13.
//
//


#import "PWMovement.h"


@implementation PWMovement


- (id)init {
    self = [super init];
    if (self) {
        [self schedule:@selector(update:)];
    }
    return self;
}


#pragma mark -
#pragma mark update


- (void)update:(ccTime)t {
    
}


#pragma mark -
#pragma mark x


- (float)terrainHeightAtX:(float)x {
    if (_terrain) {
        return [_terrain heightAtPoint:x];
    }
    return 20;
}


@end
