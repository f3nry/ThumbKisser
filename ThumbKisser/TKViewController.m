//
//  TKViewController.m
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import "TKViewController.h"

@interface TKViewController ()
@property(nonatomic, strong) IBOutlet UIImageView *thumb;
@end

@implementation TKViewController

@synthesize thumb;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction) handleDrag: (UIGestureRecognizer*) sender {
    NSLog(@"Handled single tap, %@", sender);
    
    CGPoint tappedPoint = [sender locationInView: sender.view];
    
    NSLog(@"Tapped point: %f %f", tappedPoint.x, tappedPoint.y);
    thumb.center = tappedPoint;
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    CGPoint tappedPoint = [[touches anyObject] locationInView:self.view];
    
    thumb.center = tappedPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
