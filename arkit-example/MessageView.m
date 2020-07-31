//
//  MessageView.m
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView
- (void)queueMessage: (NSString *)message {
  // If we are currently showing a message, queue the next message. We will show
  // it once the previous message has disappeared. If multiple messages come in
  // we only care about showing the last one
  if (self.currentMessage) {
    self.nextMessage = message;
    return;
  }
  
  self.nextMessage = message;
  [self showNextMessage];
}

- (void)showNextMessage {
  self.currentMessage = self.nextMessage;
  self.nextMessage = nil;
  
  if (self.currentMessage == nil) {
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
      self.alpha = 0;
    } completion:^(BOOL finished) {
    }];
    return;
  }
  
  UILabel *label = self.contentView.subviews[0];
  label.text = self.currentMessage;
  
  [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    self.alpha = 1.0;
  } completion:^(BOOL finished) {
    // Wait 5 seconds
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 repeats:NO block:^(NSTimer * _Nonnull timer) {
      [self showNextMessage];
    }];
  }];
}
@end
