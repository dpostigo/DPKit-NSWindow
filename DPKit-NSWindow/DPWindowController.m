//
// Created by Dani Postigo on 2/3/14.
//

#import "DPWindowController.h"

@implementation DPWindowController

@synthesize currentController;
@synthesize contentView;

- (id) init {
    NSString *windowNibName = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString: @"Controller" withString: @""];
    return [self initWithWindowNibName: windowNibName];
}


- (id) initWithWindowNibName: (NSString *) windowNibName {
    self = [super initWithWindowNibName: windowNibName];
    if (self) {
        [self setup];
    }

    return self;
}

- (void) setup {

}

@end