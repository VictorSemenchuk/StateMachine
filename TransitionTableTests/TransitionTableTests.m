//
//  TransitionTableTests.m
//  TransitionTableTests
//
//  Created by Victor Macintosh on 08/08/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VSTransitionTable.h"

@interface TransitionTableTests : XCTestCase

@property (assign, nonatomic) State initialState;
@property (nonatomic) VSTransitionTable *transitionTable;

@end

@implementation TransitionTableTests

- (void)setUp {
    [super setUp];
    self.initialState = state3;
    self.transitionTable = [[VSTransitionTable alloc] initWithArray:@[[VSTransition transitionWithState:state1 event:event1 andNextState:state2],
                                                                      [VSTransition transitionWithState:state2 event:event2 andNextState:state3],
                                                                      [VSTransition transitionWithState:state3 event:event3 andNextState:state4],
                                                                      [VSTransition transitionWithState:state3 event:event4 andNextState:state5],
                                                                      [VSTransition transitionWithState:state4 event:event10 andNextState:state5],
                                                                      [VSTransition transitionWithState:state5 event:event5 andNextState:state6],
                                                                      [VSTransition transitionWithState:state6 event:event6 andNextState:state7],
                                                                      [VSTransition transitionWithState:state7 event:event7 andNextState:state8],
                                                                      [VSTransition transitionWithState:state8 event:event8 andNextState:state9],
                                                                      [VSTransition transitionWithState:state7 event:event8 andNextState:state9],
                                                                      [VSTransition transitionWithState:state1 event:event9 andNextState:state10],
                                                                      [VSTransition transitionWithState:state3 event:event9 andNextState:state10],
                                                                      [VSTransition transitionWithState:state4 event:event9 andNextState:state10],
                                                                      [VSTransition transitionWithState:state5 event:event9 andNextState:state10],
                                                                      [VSTransition transitionWithState:state10 event:event8 andNextState:state9]]];
}

- (void)tearDown {
    self.transitionTable = nil;
    [super tearDown];
}

- (void)test_nextStateForState_success {
    State nextState = [self.transitionTable nextStateForState:state3 andEvent:event4];
    XCTAssertEqual(nextState, state5);
}

- (void)test_nextStateForState_failure {
    State nextState = [self.transitionTable nextStateForState:state3 andEvent:event10];
    XCTAssertEqual(nextState, self.initialState);
}

@end
