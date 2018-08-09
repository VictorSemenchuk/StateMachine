//
//  VSTransition.h
//  StateMachine
//
//  Created by Victor Macintosh on 08/08/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "State.h"

@interface VSTransition : NSObject

@property (assign, nonatomic) State state;
@property (assign, nonatomic) Event event;
@property (assign, nonatomic) State nextState;

- (instancetype)initWithState:(State)state event:(Event)event andNextState:(State)nextState;
+ (instancetype)transitionWithState:(State)state event:(Event)event andNextState:(State)nextState;

@end
