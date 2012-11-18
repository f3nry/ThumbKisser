//
//  TKViewController.m
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import "TKViewController.h"

@interface TKViewController ()
@property(nonatomic, strong) IBOutlet UIImageView *mainThumb;
@property(nonatomic, strong) TKSocketClient* socketClient;
@end

@implementation TKViewController

@synthesize mainThumb;
@synthesize socketClient;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    socketClient = [[TKSocketClient alloc] initWithDelegate:self];
    [socketClient connect];
}

- (void) touchesHappened:(NSSet *)touches withEvent:(UIEvent*)event {
    CGPoint tappedPoint = [[touches anyObject] locationInView:self.view];
    mainThumb.center = tappedPoint;
    
    [socketClient movedAtPoint:tappedPoint];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    [self touchesHappened:touches withEvent:event];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    [self touchesHappened:touches withEvent:event];
}

- (void) thumbAdded:(TKThumb *)thumb {
    [self.view addSubview:thumb.imageView];
}

- (void) thumbRemoved:(TKThumb *)thumb {
    [thumb.imageView removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
