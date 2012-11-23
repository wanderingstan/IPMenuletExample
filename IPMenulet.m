//
//  IPMenulet.m
//  IPMenuletExample
//
//  Created by Stan on 11/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IPMenulet.h"


@implementation IPMenulet


-(void)dealloc
{
    [statusItem release];
	[menuIcon release];
	[super dealloc];
}
- (void)awakeFromNib
{
	statusItem = [[[NSStatusBar systemStatusBar] 
				   statusItemWithLength:NSVariableStatusItemLength]
				  retain];
	[statusItem setHighlightMode:YES];
	[statusItem setEnabled:YES];
	[statusItem setToolTip:@"IPMenulet"];
	
	[statusItem setAction:@selector(updateIPAddress:)];
	[statusItem setTarget:self];

	/*
	// Title as string
	[statusItem setTitle:[NSString stringWithString:@"0.0.0.0"]]; 
	 */
	
	/* 
	//Title as Unicode Glyph
	[statusItem setTitle:[NSString 
	stringWithFormat:@"%C",0x2295]]; 
	 */
		
	// Title as Image
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSString *path = [bundle pathForResource:@"IPMenuIcon" ofType:@"tif"];
	menuIcon= [[NSImage alloc] initWithContentsOfFile:path];
	[statusItem setTitle:[NSString stringWithString:@""]]; 
	[statusItem setImage:menuIcon];

	
}

-(IBAction)updateIPAddress:(id)sender
{
	NSString *ipAddr = [NSString stringWithContentsOfURL:
						[NSURL URLWithString:
						 @"http://highearthorbit.com/service/myip.php"]];
	if(ipAddr != NULL)
		[statusItem setTitle:
		 [NSString stringWithString:ipAddr]]; 
}


@end
