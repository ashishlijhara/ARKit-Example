//
//  PBRMaterial.h
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>

@interface PBRMaterial : NSObject
+ (SCNMaterial *)materialNamed:(NSString *)name;
@end
