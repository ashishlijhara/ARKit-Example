//
//  Cube.h
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import <SceneKit/SceneKit.h>

@interface Cube : SCNNode

- (instancetype)initAtPosition:(SCNVector3)position withMaterial:(SCNMaterial *)material;
- (void)changeMaterial;
- (void)remove;
+ (SCNMaterial *)currentMaterial;

@end
