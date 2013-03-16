//
//  PWCollisionManager.h
//  paperwars
//
//  Created by Tim Wood on 2/10/13.
//
//


#import <Foundation/Foundation.h>


@class PWShape;


@interface PWCollisionManager : NSObject {
@private;
    NSMutableArray *_shapes;
    NSMutableArray *_shapesToAdd;
    NSMutableArray *_shapesToRemove;
}


#pragma mark -
#pragma mark singleton


+ (PWCollisionManager *)manager;


#pragma mark -
#pragma mark shapes


- (void)add:(PWShape *)shape;
- (void)remove:(PWShape *)shape;
- (void)removeAll;


#pragma mark -
#pragma mark update


- (void)update;


#pragma mark -
#pragma mark opponents


- (CGPoint)nearestOpponent:(int)allegiance
                toPosition:(CGPoint)position
              inXDirection:(int)direction;
- (CGPoint)nearestOpponent:(int)allegiance
                toPosition:(CGPoint)position;


@end
