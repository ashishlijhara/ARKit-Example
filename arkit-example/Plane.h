//
//  Plane.h
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface Plane : SCNNode
- (instancetype)initWithAnchor:(ARPlaneAnchor *)anchor isHidden:(BOOL)hidden withMaterial:(SCNMaterial *)material;
- (void)update:(ARPlaneAnchor *)anchor;
- (void)setTextureScale;
- (void)hide;
- (void)changeMaterial;
- (void)remove;
+ (SCNMaterial *)currentMaterial;
@property (nonatomic,retain) ARPlaneAnchor *anchor;
@property (nonatomic, retain) SCNBox *planeGeometry;
@end
