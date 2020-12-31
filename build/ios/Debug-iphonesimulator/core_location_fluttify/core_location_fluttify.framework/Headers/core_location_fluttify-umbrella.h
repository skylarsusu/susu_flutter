#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CLFloorHandler.h"
#import "CLHeadingHandler.h"
#import "CLLocationCoordinate2DHandler.h"
#import "CLLocationHandler.h"
#import "CLLocationManagerHandler.h"
#import "CoreLocationFluttifyPlugin.h"

FOUNDATION_EXPORT double core_location_fluttifyVersionNumber;
FOUNDATION_EXPORT const unsigned char core_location_fluttifyVersionString[];

