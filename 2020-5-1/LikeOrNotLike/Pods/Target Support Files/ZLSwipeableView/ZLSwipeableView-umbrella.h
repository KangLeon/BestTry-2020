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

#import "DefaultDirectionInterpretor.h"
#import "DefaultShouldSwipeDeterminator.h"
#import "DefaultViewAnimator.h"
#import "PanGestureRecognizer.h"
#import "Scheduler.h"
#import "Utils.h"
#import "ViewManager.h"
#import "ZLSwipeableView.h"
#import "ZLSwipeableViewMovement.h"
#import "ZLSwipeableViewSwipeOptions.h"

FOUNDATION_EXPORT double ZLSwipeableViewVersionNumber;
FOUNDATION_EXPORT const unsigned char ZLSwipeableViewVersionString[];

