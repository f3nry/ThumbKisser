//
//  TKDragGestureRecognizer.m
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import "TKDragGestureRecognizer.h"

@implementation TKDragGestureRecognizer
- (void)reset {
    [super reset];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView: self.view];
    NSLog(@"Tapped point: %f %f", point.x, point.y);
    [self setState: UIGestureRecognizerStateRecognized];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView: self.view];
    NSLog(@"Tapped point: %f %f", point.x, point.y);
    [self setState: UIGestureRecognizerStateRecognized];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView: self.view];
    NSLog(@"Tapped point: %f %f", point.x, point.y);
    [self setState: UIGestureRecognizerStateEnded];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView: self.view];
    NSLog(@"Tapped point: %f %f", point.x, point.y);
    [self setState: UIGestureRecognizerStateCancelled];
}
@end
