//
//  TKSocketClient.h
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"
#import "TKThumb.h"

@protocol TKSocketClientDelegate
- (void) thumbAdded:(TKThumb*) thumb;
- (void) thumbRemoved:(TKThumb*) thumb;
- (void) clientMoved:(CGPoint) point;
@end

@interface TKSocketClient : NSObject <SocketIODelegate>

@property (nonatomic, strong) SocketIO* client;
@property (nonatomic, strong) id<TKSocketClientDelegate> delegate;
@property (nonatomic, strong) NSNumber* myClientId;
@property (nonatomic, strong) NSMutableDictionary* thumbs;

- (id) initWithDelegate:(id) delegate;
- (void) movedAtPoint:(CGPoint) point;
- (void) socketIO:(SocketIO *)socket didReceiveJSON:(SocketIOPacket *)packet;
- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet;
- (void) connect;
@end
