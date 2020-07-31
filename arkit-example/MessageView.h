//
//  MessageView.h
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MessageView : UIVisualEffectView
- (void)queueMessage: (NSString *)message;
@property (nonatomic, retain) NSString *currentMessage;
@property (nonatomic, retain) NSString *nextMessage;
@property (nonatomic, retain) NSTimer *timer;
@end

