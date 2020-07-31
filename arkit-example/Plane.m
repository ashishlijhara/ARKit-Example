//
//  Plane.m
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#import "Plane.h"
#import "PBRMaterial.h"

static int currentMaterialIndex = 0;

@implementation Plane

- (instancetype)initWithAnchor:(ARPlaneAnchor *)anchor isHidden:(BOOL)hidden withMaterial:(SCNMaterial *)material {
  self = [super init];
  
  self.anchor = anchor;
  float width = anchor.extent.x;
  float length = anchor.extent.z;
  
  float planeHeight = 0.01;
  
  self.planeGeometry = [SCNBox boxWithWidth:width height:planeHeight length:length chamferRadius:0];
  
  SCNMaterial *transparentMaterial = [SCNMaterial new];
  transparentMaterial.diffuse.contents = [UIColor colorWithWhite:1.0 alpha:0.0];
  
  if (hidden) {
    self.planeGeometry.materials = @[transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial];
  } else {
    self.planeGeometry.materials = @[transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, material, transparentMaterial];
  }
  
  SCNNode *planeNode = [SCNNode nodeWithGeometry:self.planeGeometry];
  
  planeNode.position = SCNVector3Make(0, -planeHeight / 2, 0);
  
  planeNode.physicsBody = [SCNPhysicsBody
                           bodyWithType:SCNPhysicsBodyTypeKinematic
                           shape: [SCNPhysicsShape shapeWithGeometry:self.planeGeometry options:nil]];
  
  [self setTextureScale];
  [self addChildNode:planeNode];
  return self;
}

- (void) remove {
  [self removeFromParentNode];
}

- (void)changeMaterial {
  currentMaterialIndex = (currentMaterialIndex + 1) % 5;
  
  SCNMaterial *material = [Plane currentMaterial];
  SCNMaterial *transparentMaterial = [SCNMaterial new];
  transparentMaterial.diffuse.contents = [UIColor colorWithWhite:1.0 alpha:0.0];
  if (material == nil) {
    material = transparentMaterial;
  }
  SCNMatrix4 transform = self.planeGeometry.materials[4].diffuse.contentsTransform;
  material.diffuse.contentsTransform = transform;
  material.roughness.contentsTransform = transform;
  material.metalness.contentsTransform = transform;
  material.normal.contentsTransform = transform;
  self.planeGeometry.materials = @[transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, material, transparentMaterial];
}

+ (SCNMaterial *)currentMaterial {
  NSString *materialName;
  switch(currentMaterialIndex) {
    case 0:
      materialName = @"tron";
      break;
    case 1:
      materialName = @"oakfloor2";
      break;
    case 2:
      materialName = @"sculptedfloorboards";
      break;
    case 3:
      materialName = @"granitesmooth";
      break;
    case 4:
      // planes will be transparent
      return nil;
      break;
  }
  return [[PBRMaterial materialNamed:materialName] copy];
}

- (void)update:(ARPlaneAnchor *)anchor {

  self.planeGeometry.width = anchor.extent.x;
  self.planeGeometry.length = anchor.extent.z;

  self.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z);
  
  SCNNode *node = [self.childNodes firstObject];
  node.physicsBody = [SCNPhysicsBody
                      bodyWithType:SCNPhysicsBodyTypeKinematic
                      shape: [SCNPhysicsShape shapeWithGeometry:self.planeGeometry options:nil]];
  [self setTextureScale];
}

- (void)setTextureScale {
  CGFloat width = self.planeGeometry.width;
  CGFloat height = self.planeGeometry.length;
  
  SCNMaterial *material = self.planeGeometry.materials[4];
  //NSLog(@"width: %f, height: %f", width, height);
  float scaleFactor = 1;
  SCNMatrix4 m = SCNMatrix4MakeScale(width * scaleFactor, height * scaleFactor, 1);
  material.diffuse.contentsTransform = m;
  material.roughness.contentsTransform = m;
  material.metalness.contentsTransform = m;
  material.normal.contentsTransform = m;
}

- (void)hide {
  SCNMaterial *transparentMaterial = [SCNMaterial new];
  transparentMaterial.diffuse.contents = [UIColor colorWithWhite:1.0 alpha:0.0];
  self.planeGeometry.materials = @[transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial];
}

@end
