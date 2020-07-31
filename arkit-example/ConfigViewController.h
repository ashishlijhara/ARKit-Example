//
//  ConfigViewController.h
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Config.h"

@interface ConfigViewController : UITableViewController
@property (weak) IBOutlet UISwitch *featurePoints;
@property (weak) IBOutlet UISwitch *worldOrigin;
@property (weak) IBOutlet UISwitch *physicsBodies;
@property (weak) IBOutlet UISwitch *statistics;
@property (nonatomic, retain) Config *config;
@end
