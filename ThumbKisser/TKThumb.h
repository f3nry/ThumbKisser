//
//  TKThumb.h
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TKThumb : NSObject
@property(nonatomic, strong)UIImageView* imageView;
@property(nonatomic, strong)NSNumber* clientId;
@property CGPoint currentPoint;

- (id) initWithClientId: (NSNumber*) clientId;
- (void) updateWithPoint: (CGPoint) point;

@end
