//
// Created by Dani Postigo on 2/20/14.
//

#import <Foundation/Foundation.h>

@interface DPWindowManager : NSObject {
    NSWindowController *windowController;
    NSMutableArray *windowControllers;
}

@property(nonatomic, strong) NSMutableArray *windowControllers;
@property(nonatomic, strong) NSWindowController *windowController;
+ (DPWindowManager *) manager;

+ (void) launchWindowWithClass: (Class) class;
+ (void) closeWindowOfClass: (Class) class;
+ (void) toggleWindowOfClass: (Class) class;
- (NSWindowController *) windowControllerOfClass: (Class) class;
@end