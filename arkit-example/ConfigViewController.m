//
//  ConfigViewController.m
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import "ConfigViewController.h"

@implementation ConfigViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Set the initial values
  Config *config = self.config;
  self.featurePoints.on = config.showFeaturePoints;
  self.worldOrigin.on = config.showWorldOrigin;
  self.statistics.on = config.showStatistics;
  self.physicsBodies.on = config.showPhysicsBodies;
}

@end
