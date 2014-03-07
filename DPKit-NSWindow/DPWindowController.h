//
// Created by Dani Postigo on 2/3/14.
//

#import <Foundation/Foundation.h>

@interface DPWindowController : NSWindowController {
    NSViewController *currentController;
    NSView *contentView;
}

@property(nonatomic, strong) NSViewController *currentController;
@property(nonatomic, strong) NSView *contentView;

- (void) setup;
@end