//
//  WDAppDelegate.h
//
//  Created by EXPRESS on 22/10/2016.
//  Copyright none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	BOOL bBackground;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

