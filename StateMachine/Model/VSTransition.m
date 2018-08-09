//
//  VSTransition.m
//  StateMachine
//
//  Created by Victor Macintosh on 08/08/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "VSTransition.h"

@implementation VSTransition

- (instancetype)initWithState:(State)state event:(Event)event andNextState:(State)nextState {
    self = [super init];
    if (self) {
        _state = state;
        _event = event;
        _nextState = nextState;
    }
    return self;
}

+ (instancetype)transitionWithState:(State)state event:(Event)event andNextState:(State)nextState {
    return [[VSTransition alloc] initWithState:state event:event andNextState:nextState];
}

@end
