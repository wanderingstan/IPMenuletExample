//
//  IPMenulet.h
//  IPMenuletExample
//
// Maintained and updated by Stan James
// https://github.com/wanderingstan/IPMenuletExample
//
// Originally  an implementation of the excellent menulet tutorial
// by Andrew Turner, published here:
// http://www.mactech.com/articles/mactech/Vol.22/22.02/Menulet/index.html

#import <Foundation/Foundation.h>


@interface IPMenulet : NSObject {
    NSStatusItem *statusItem;
}

- (IBAction)updateIPAddress:(id)sender;


@end
