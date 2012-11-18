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
@synthesize delegate = _delegate;
@synthesize myClientId;
@synthesize thumbs;

- (id) initWithDelegate: (id<TKSocketClientDelegate>) delegate {
    id value = [super init];
    
    if(value) {
        _delegate = delegate;
        thumbs = [[NSMutableDictionary alloc] init];
    }
    
    return value;
}

- (void) connect {
    NSLog(@"Connecting..");
    client = [[SocketIO alloc] initWithDelegate: self];
    [client connectToHost: @"192.168.1.39" onPort:8080];
    NSLog(@"Connected!");
}

#pragma mark Recievers

- (void) receivedYourClientId: (id) withObject {
    myClientId = withObject;
    
    NSLog(@"Received my client id: %@", myClientId);
}

- (void) receivedClientAdded: (id) withObject {
    NSMutableDictionary* clientIdDict = (NSMutableDictionary*) withObject;
    NSNumber* otherClientId = [clientIdDict objectForKey:@"client_id"];
    
    if(![myClientId isEqualToNumber: otherClientId]) {
        NSLog(@"Someone else connected! :D %@", otherClientId);
        
        TKThumb *newThumb = [[TKThumb alloc] initWithClientId:otherClientId];
        
        [thumbs setObject:newThumb forKey:otherClientId];
        [_delegate thumbAdded: newThumb];
    } else {
        NSLog(@"Got told that I connected. Boo.");
    }
}

- (void) receivedAllClients: (id) withObject {
    NSArray* allThumbs = [(NSMutableDictionary*)withObject objectForKey:@"clients"];
    
    for (NSNumber* thumbClientId in allThumbs) {
        NSLog(@"Looking at client: %@", thumbClientId);
        
        if([thumbClientId isKindOfClass: [NSNumber class]] && ![thumbClientId isEqualToNumber:myClientId]) {
            if(![thumbs objectForKey:thumbClientId]) {
                TKThumb *newThumb = [[TKThumb alloc] initWithClientId:thumbClientId];
                
                [thumbs setObject:newThumb forKey:thumbClientId];
                [_delegate thumbAdded: newThumb];
            }
        }
    }
}

- (void) receivedClientMoved: (id) withObject {
    NSNumber* movedClientId = (NSNumber*) [withObject objectForKey:@"client_id"];
    
    if(![movedClientId isEqualToNumber:myClientId]) {
        TKThumb* movedThumb = [thumbs objectForKey: movedClientId];
        
        if(movedThumb) {
            [movedThumb updateWithPoint:CGPointMake([[withObject objectForKey:@"x"] floatValue], [[withObject objectForKey:@"y"] floatValue])];
        }
    }
}

- (void) receivedClientDisconnected: (id) withObject {
    NSNumber* disconnectedClientId = [withObject objectForKey:@"client_id"];
    
    TKThumb* disconnectedThumb = [thumbs objectForKey:disconnectedClientId];
    
    if(disconnectedThumb) {
        [_delegate thumbRemoved:disconnectedThumb];
        [thumbs removeObjectForKey:disconnectedClientId];
    }
}

# pragma mark Senders

- (void) movedAtPoint:(CGPoint)point {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSNumber numberWithFloat:point.x] forKey:@"x"];
    [dict setObject:[NSNumber numberWithFloat:point.y] forKey:@"y"];
    
    [client sendEvent:@"moved" withData:dict];
}

# pragma mark SocketIODelegate

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet {
    NSMutableDictionary* dataAsJSON = [packet dataAsJSON];
    NSLog(@"didReceiveJSON() >>> data: %@", dataAsJSON);
    
    NSString* eventName = [dataAsJSON objectForKey:@"name"];
    id firstObject = [((NSArray*)[dataAsJSON objectForKey:@"args"]) objectAtIndex:(NSUInteger)0];
    
    if([eventName isEqualToString:@"yourClientId"]) {
        [self receivedYourClientId: firstObject];
    } else if([eventName isEqualToString:@"clientAdded"]) {
        [self receivedClientAdded: firstObject];
    } else if([eventName isEqualToString:@"allClients"]) {
        [self receivedAllClients: firstObject];
    } else if([eventName isEqualToString: @"clientMoved"]) {
        [self receivedClientMoved: firstObject];
    } else if([eventName isEqualToString: @"clientDisconnected"]) {
        [self receivedClientDisconnected:firstObject];
    }
}

@end
