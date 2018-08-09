//
//  VSStateMachine.m
//  VSStateMachine
//
//  Created by Viktar Semianchuk on 8/8/18.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "VSStateMachine.h"
#import "VSTransitionTable.h"

@interface VSStateMachine ()

@property (nonatomic) VSTransitionTable *transitionTable;

@end

@implementation VSStateMachine

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lastState = state1;
    }
    return self;
}

- (instancetype)initWithState:(State)state {
    self = [super init];
    if (self) {
        self.lastState = state;
    }
    return self;
}

- (State)performEvent:(Event)event {
    State lastState = [self.transitionTable nextStateForState:self.lastState andEvent:event];
    self.lastState = lastState;
    return lastState;
}

- (void)setupTransitions:(NSArray<VSTransition *> *)transitions {
    self.transitionTable = [[VSTransitionTable alloc] initWithArray:transitions];
}

@end
