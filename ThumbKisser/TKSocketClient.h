//
//  TKSocketClient.h
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"

@interface TKSocketClient : NSObject <SocketIODelegate>
@property (nonatomic, strong) SocketIO* client;

- (id) initWithDelegate: (id) delegate;
@end
