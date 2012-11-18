//
//  TKSocketClient.m
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import "TKSocketClient.h"

@implementation TKSocketClient

@synthesize client;

- (id) initWithDelegate: (id) delegate {
    id value = [super init];
    
    if(value) {
        client = [[SocketIO alloc] initWithDelegate: self];
    }
    
    return value;
}
@end
