//
//  IPMenulet.h
//  IPMenuletExample
//
//  Created by Stan on 11/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IPMenulet : NSObject {
    NSStatusItem *statusItem;
}

-(IBAction)updateIPAddress:(id)sender;

NSImage *menuIcon;

@end
