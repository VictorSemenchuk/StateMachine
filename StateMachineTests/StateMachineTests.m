//
//  StateMachineTests.m
//  StateMachineTests
//
//  Created by Victor Macintosh on 08/08/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VSStateMachine.h"

@interface StateMachineTests : XCTestCase

@property (nonatomic) VSStateMachine *stateMachine;

@end

@implementation StateMachineTests

- (void)setUp {
    [super setUp];
    self.stateMachine = [[VSStateMachine alloc] init];
    [self.stateMachine setupTransitions:@[[VSTransition transitionWithState:state1 event:event1 andNextState:state2],
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
    self.stateMachine = nil;
    [super tearDown];
}

//test_performForChain1

- (void)test_performForChain1_success {
    [self.stateMachine performEvent:event9];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain1_failure {
    [self.stateMachine performEvent:event1];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

//test_performForChain2

- (void)test_performForChain2_success {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event9];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain2_failure {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event3];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

//test_performForChain3

- (void)test_performForChain3_success {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event3];
    [self.stateMachine performEvent:event9];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain3_failure {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event3];
    [self.stateMachine performEvent:event10];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

//test_performForChain4

- (void)test_performForChain4_success {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event3];
    [self.stateMachine performEvent:event10];
    [self.stateMachine performEvent:event9];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain4_failure {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event3];
    [self.stateMachine performEvent:event10];
    [self.stateMachine performEvent:event5];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

//test_performForChain5

- (void)test_performForChain5_success {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event4];
    [self.stateMachine performEvent:event9];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain5_failure {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event4];
    [self.stateMachine performEvent:event5];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

//test_performForChain6

- (void)test_performForChain6_success {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event4];
    [self.stateMachine performEvent:event5];
    [self.stateMachine performEvent:event6];
    [self.stateMachine performEvent:event7];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain6_failure {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event4];
    [self.stateMachine performEvent:event5];
    [self.stateMachine performEvent:event9];
    [self.stateMachine performEvent:event7];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

//test_performForChain7

- (void)test_performForChain7_success {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event4];
    [self.stateMachine performEvent:event5];
    [self.stateMachine performEvent:event6];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertEqual(currentState, state9);
}

- (void)test_performForChain7_failure {
    [self.stateMachine performEvent:event1];
    [self.stateMachine performEvent:event2];
    [self.stateMachine performEvent:event3];
    [self.stateMachine performEvent:event5];
    [self.stateMachine performEvent:event6];
    State currentState = [self.stateMachine performEvent:event8];
    XCTAssertNotEqual(currentState, state9);
}

@end
