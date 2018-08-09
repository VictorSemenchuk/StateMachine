//
//  VSTransitionTable.h
//  StateMachine
//
//  Created by Viktar Semianchuk on 8/8/18.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSTransition.h"

@interface VSTransitionTable : NSObject

@property (nonatomic) NSArray<VSTransition *> *transitions;

- (instancetype)initWithArray:(NSArray<VSTransition *> *)array;
- (State)nextStateForState:(State)state andEvent:(Event)event;

@end
