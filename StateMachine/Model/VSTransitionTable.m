//
//  VSTransitionTable.m
//  StateMachine
//
//  Created by Viktar Semianchuk on 8/8/18.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "VSTransitionTable.h"

@implementation VSTransitionTable

- (instancetype)initWithArray:(NSArray<VSTransition *> *)array {
    self = [super init];
    if (self) {
        _transitions = [NSArray arrayWithArray:array];
    }
    return self;
}

- (State)nextStateForState:(State)state andEvent:(Event)event {
    State nextState = state;
    for(VSTransition *transition in self.transitions) {
        if (transition.state == state && transition.event == event) {
            nextState = transition.nextState;
        }
    }
    return nextState;
}

@end
