//
//  TKThumb.m
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import "TKThumb.h"

@implementation TKThumb
@synthesize imageView;
@synthesize clientId = _clientId;
@synthesize currentPoint;

- (id) initWithClientId:(NSNumber *)clientId {
    id value = [super init];
    
    if(value) {
        NSLog(@"Initializing new thumb with id %@", clientId);
        _clientId = clientId;
        imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"thumbprint.png"]];
        [imageView setFrame: CGRectMake(50, 50, 83, 124)];
    }
    
    return value;
}

- (void) updateWithPoint:(CGPoint)point {
    imageView.center = point;
}

@end
