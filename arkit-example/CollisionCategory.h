//
//  CollisionCategory.h
//  arkit-example
//
//  Created by Lijhara Ashish on 3/4/20.
//  Copyright © 2019 Hyper Reality Studio Pvt. Ltd. All rights reserved.
//

#ifndef CollisionCategory_h
#define CollisionCategory_h

typedef NS_OPTIONS(NSUInteger, CollisionCategory) {
  CollisionCategoryBottom  = 1 << 0,
  CollisionCategoryCube    = 1 << 1,
};

#endif /* CollisionCategory_h */
