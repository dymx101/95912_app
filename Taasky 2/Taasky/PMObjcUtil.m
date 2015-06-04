//
//  PMObjcUtil.m
//  Taasky
//
//  Created by D. D. on 6/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import "PMObjcUtil.h"


@implementation PMObjcUtil

+(UIImage *)imageFromALAsset:(ALAsset *)asset {
    return [UIImage imageWithCGImage:asset.defaultRepresentation.fullResolutionImage scale:asset.defaultRepresentation.scale orientation:(UIImageOrientation)asset.defaultRepresentation.orientation];
}

@end
