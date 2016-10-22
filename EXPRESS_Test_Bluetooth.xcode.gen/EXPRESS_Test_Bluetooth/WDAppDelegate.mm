//
//  WDAppDelegate.mm
//
//  Created by EXPRESS on 22/10/2016.
//  Copyright none. All rights reserved.
//

#import "WDAppDelegate.h"

void InitAppLaunchOptions(NSDictionary *pclDic);
void InitInstance();
void InitModule(const struct _stMyModuleInfo* pstModule);
void LoadWDLFile(NSString*);
void InitExec();
void TermExec();
void InitInternalLanguage(int);
void ExecDidEnterBackground();
void ExecWillEnterForeground();
extern const struct _stMyModuleInfo gstMyModuleInfo1;
void OBJ_InitIOS(UIWindow *pclWindow, BOOL moveControls);
void OBJ_SendApplicationWillResignActive(void);
void OBJ_SendApplicationDidBecomeActive(void);
extern const struct _stMyModuleInfo gstMyModuleInfo3;
extern const struct _stMyModuleInfo gstMyModuleInfo4;
extern const struct _stMyModuleInfo gstMyModuleInfo8;
extern const struct _stMyModuleInfo gstMyModuleInfo10;
extern const struct _stMyModuleInfo gstMyModuleInfo61;
extern const struct _stMyModuleInfo gstMyModuleInfo68;
extern const struct _stMyModuleInfo gstMyModuleInfo70;


@implementation WDAppDelegate

@synthesize window; 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	bBackground = NO;
	[self RunApplication :launchOptions];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	OBJ_SendApplicationWillResignActive();

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	ExecDidEnterBackground();

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	ExecWillEnterForeground();

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	OBJ_SendApplicationDidBecomeActive();

}


- (void)applicationWillTerminate:(UIApplication *)application {
	[self TerminateApplication];
	bBackground = NO;
}
- (void)TerminateApplication {
	TermExec();
}

- (void)RunApplication:(NSDictionary *)launchOptions {
	if(bBackground)
	{
		[self TerminateApplication];
	}
	InitAppLaunchOptions(launchOptions);
	InitInstance();
	InitInternalLanguage(9);
	InitModule(&gstMyModuleInfo1);
	InitModule(&gstMyModuleInfo3);
	InitModule(&gstMyModuleInfo4);
	InitModule(&gstMyModuleInfo8);
	InitModule(&gstMyModuleInfo10);
	InitModule(&gstMyModuleInfo61);
	InitModule(&gstMyModuleInfo68);
	InitModule(&gstMyModuleInfo70);
	InitExec();
	LoadWDLFile(@"EXPRESS_Test_Bluetooth");

	CGRect screenBounds = [ [ UIScreen mainScreen ] bounds ];
	window = [ [ UIWindow alloc ] initWithFrame: screenBounds ];
#ifdef __IPHONE_7_0
	OBJ_InitIOS(window, YES);
#else
	OBJ_InitIOS(window, NO);
#endif //__IPHONE_7_0
	[window makeKeyAndVisible];
	bBackground = NO;

}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
