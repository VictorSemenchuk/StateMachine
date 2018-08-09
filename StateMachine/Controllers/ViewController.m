//
//  ViewController.m
//  StateMachine
//
//  Created by Victor Macintosh on 08/08/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"
#import "VSStateMachine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    VSStateMachine *stateMachine = [[VSStateMachine alloc] init];
    [stateMachine setupTransitions:@[[VSTransition transitionWithState:state1 event:event1 andNextState:state2],
                                     [VSTransition transitionWithState:state2 event:event2 andNextState:state3],
                                     [VSTransition transitionWithState:state3 event:event3 andNextState:state4],
                                     [VSTransition transitionWithState:state3 event:event4 andNextState:state5],
                                     [VSTransition transitionWithState:state4 event:event10 andNextState:state5],
                                     [VSTransition transitionWithState:state5 event:event5 andNextState:state6],
                                     [VSTransition transitionWithState:state6 event:event6 andNextState:state7],
                                     [VSTransition transitionWithState:state7 event:event7 andNextState:state8],
                                     [VSTransition transitionWithState:state8 event:event8 andNextState:state9],
                                     [VSTransition transitionWithState:state7 event:event9 andNextState:state9],
                                     [VSTransition transitionWithState:state1 event:event9 andNextState:state10],
                                     [VSTransition transitionWithState:state3 event:event9 andNextState:state10],
                                     [VSTransition transitionWithState:state4 event:event9 andNextState:state10],
                                     [VSTransition transitionWithState:state5 event:event9 andNextState:state10],
                                     [VSTransition transitionWithState:state10 event:event11 andNextState:state9]]];
    
    State lastState = [stateMachine performEvent:event1];
    NSLog(@"%d", lastState);
}

@end