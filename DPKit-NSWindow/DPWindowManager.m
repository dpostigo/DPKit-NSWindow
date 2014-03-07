//
// Created by Dani Postigo on 2/20/14.
//

#import "DPWindowManager.h"

@implementation DPWindowManager

@synthesize windowControllers;

@synthesize windowController;

+ (DPWindowManager *) manager {
    static DPWindowManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}




#pragma mark Methods

+ (void) launchWindowWithClass: (Class) class {
    [[[self class] manager] launchWindowOfClass: class];
}


+ (void) closeWindowOfClass: (Class) class {
    [[[self class] manager] launchWindowOfClass: class];
}

+ (void) toggleWindowOfClass: (Class) class {
    [[[self class] manager] toggleWindowOfClass: class];
}


- (void) launchWindowOfClass: (Class) class {
    [self launchWindowWithClass: class unique: YES];
}


- (void) closeWindowOfClass: (Class) class {
    NSWindowController *controller = [self windowControllerOfClass: class];
    if (controller) {
        [controller.window orderOut: nil];
        [self.windowControllers removeObject: controller];
    }
}


- (void) toggleWindowOfClass: (Class) class {
    NSWindowController *controller = [self windowControllerOfClass: class];

    if (controller == nil) {
        [self launchWindowOfClass: class];
    } else {
        if (controller.window.isVisible) {
            [self closeWindowOfClass: class];
        } else {
            [self launchWindowOfClass: class];
        }
    }

}

- (void) launchWindowWithClass: (Class) class unique: (BOOL) unique {
    NSWindowController *controller = unique ? [self windowControllerOfClass: class] : nil;

    if (controller == nil) {
        controller = [[class alloc] init];
        [self.windowControllers addObject: controller];
    }

    [controller showWindow: nil];
    [controller.window makeKeyAndOrderFront: nil];
}


- (NSWindowController *) windowControllerOfClass: (Class) class {
    NSWindowController *ret = nil;
    for (NSWindowController *controller in self.windowControllers) {
        if ([controller isKindOfClass: class]) {
            ret = controller;
        }
    }
    return ret;
}


#pragma mark Getters Setters


- (void) setWindowController: (NSWindowController *) windowController1 {
    if (windowController) {
        [windowController.window orderOut: nil];
        [self.windowControllers removeObject: windowController];
    }
    windowController = windowController1;
    if (windowController) {
        [windowController showWindow: nil];
        [self.windowControllers addObject: windowController];
    }
}


- (NSMutableArray *) windowControllers {
    if (windowControllers == nil) {
        windowControllers = [[NSMutableArray alloc] init];
    }
    return windowControllers;
}


@end