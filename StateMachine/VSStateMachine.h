//
//  VSStateMachine.h
//  VSStateMachine
//
//  Created by Viktar Semianchuk on 8/8/18.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSTransitionTable.h"

@interface VSStateMachine : NSObject

@property (assign, nonatomic, readonly) State lastState;

- (instancetype)initWithState:(State)state;
- (State)performEvent:(Event)event;
- (void)setupTransitions:(NSArray<VSTransition *> *)transitions;

@end
