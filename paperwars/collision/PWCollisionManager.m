//
//  PWCollisionManager.m
//  paperwars
//
//  Created by Tim Wood on 2/10/13.
//
//


#import "PWCollisionManager.h"
#import "PWShape.h"


static PWCollisionManager *_manager = nil;


@implementation PWCollisionManager


#pragma mark -
#pragma mark singleton


+ (PWCollisionManager *)manager {
    if (!_manager) {
        _manager = [[self alloc] init];
    }
    return _manager;
}


#pragma mark -
#pragma mark init


- (id)init {
    self = [super init];
    if (self) {
        _shapes = [[NSMutableArray alloc] init];
        _shapesToAdd = [[NSMutableArray alloc] init];
        _shapesToRemove = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark -
#pragma mark shapes


- (void)add:(PWShape *)shape {
    if (![_shapesToAdd containsObject:shape]) {
        [_shapesToAdd addObject:shape];
    }
}

- (void)reallyAdd {
    while ([_shapesToAdd count] > 0) {
        PWShape *shape = (PWShape *) [_shapesToAdd objectAtIndex:0];
        [_shapesToAdd removeObject:shape];
        if (![_shapes containsObject:shape]) {
            [_shapes addObject:shape];
        }
    }
}

- (void)remove:(PWShape *)shape {
    if (![_shapesToRemove containsObject:shape]) {
        [_shapesToRemove addObject:shape];
    }
}

- (void)reallyRemove {
    while ([_shapesToRemove count] > 0) {
        PWShape *shape = (PWShape *) [_shapesToRemove objectAtIndex:0];
        [_shapesToRemove removeObject:shape];
        if ([_shapes containsObject:shape]) {
            [_shapes removeObject:shape];
        }
    }
}

- (void)removeAll {
    [_shapes removeAllObjects];
}


#pragma mark -
#pragma mark update


- (void)update {
    [self reallyAdd];
    [self reallyRemove];
    for (int i = 0; i < [_shapes count]; i++) {
        for (int j = i + 1; j < [_shapes count]; j++) {
            PWShape *shapeA = (PWShape *) [_shapes objectAtIndex:i];
            PWShape *shapeB = (PWShape *) [_shapes objectAtIndex:j];
            if ([shapeA willCollideWith:shapeB]) {
                [shapeA didCollideWith:shapeB];
                [shapeB didCollideWith:shapeA];
            }
        }
    }
    [self reallyAdd];
    [self reallyRemove];
}


#pragma mark -
#pragma mark opponents



- (CGPoint)nearestOpponent:(int)allegiance toPosition:(CGPoint)position inXDirection:(int)direction {
    CGPoint nearest = ccp(99999, 99999);
    float nearestLengthSquared = ccpLengthSQ(nearest);
    
    for (int i = 0; i < [_shapes count]; i++) {
        PWShape *other = (PWShape *) [_shapes objectAtIndex:i];
        if (other.allegiance == allegiance || !other.isVehicle) {
            continue;
        }
        CGPoint otherPosition = [other worldPosition];
        if (direction > 0 && position.x > otherPosition.x) {
            continue;
        }
        if (direction < 0 && position.x < otherPosition.x) {
            continue;
        }
        float diffSquared = ccpLengthSQ(ccpSub(otherPosition, position));
        if (diffSquared < nearestLengthSquared) {
            nearestLengthSquared = diffSquared;
            nearest = otherPosition;
        }
    }
    
    return nearest;
}

- (CGPoint)nearestOpponent:(int)allegiance toPosition:(CGPoint)position {
    return [self nearestOpponent:allegiance toPosition:position inXDirection:0];
}


@end
