//
//  TKViewController.h
//  ThumbKisser
//
//  Created by Paul Henry on 11/17/12.
//  Copyright (c) 2012 Paul Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKSocketClient.h"

@interface TKViewController : UIViewController <TKSocketClientDelegate>
- (void) thumbAdded:(TKThumb *)thumb;
@end
