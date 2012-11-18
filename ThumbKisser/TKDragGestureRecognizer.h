//
//  TKDragGestureRecognizer.h
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizer.h>

@interface TKDragGestureRecognizer : UIGestureRecognizer
- (void)reset;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
@end
