//
//  IPMenulet.m
//  IPMenuletExample
//
// Maintained and updated by Stan James
// https://github.com/wanderingstan/IPMenuletExample
//
// Originally  an implementation of the excellent menulet tutorial
// by Andrew Turner, published here:
// http://www.mactech.com/articles/mactech/Vol.22/22.02/Menulet/index.html

#import "IPMenulet.h"

@implementation IPMenulet {
    __weak IBOutlet NSMenu *menuletMenu;
}

- (void) awakeFromNib
{
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[statusItem setHighlightMode:YES];
	[statusItem setEnabled:YES];
	[statusItem setToolTip:@"IPMenulet"];
	
	[statusItem setAction:@selector(updateIPAddress:)];
	[statusItem setTarget:self];

    // Attache menu
    [statusItem setMenu:menuletMenu];

	/*
	// Title as string
	[statusItem setTitle:[NSString stringWithString:@"0.0.0.0"]]; 
	 */
	
	/* 
	//Title as Unicode Glyph
	[statusItem setTitle:[NSString 
	stringWithFormat:@"%C",0x2295]]; 
	 */
		
	// Title as Image + Title
    NSImage * menuIcon = [NSImage imageNamed:@"MenuletIcon"];
    [statusItem setImage:menuIcon];
	[statusItem setTitle:@"000.000.000.000"];
}

- (IBAction) updateIPAddress:(id)sender
{
    NSString *ipAddr = [NSString stringWithContentsOfURL:[NSURL URLWithString:
                                                          @"http://highearthorbit.com/service/myip.php"] encoding:NSASCIIStringEncoding error:nil];
    if (ipAddr != nil) {
		[statusItem setTitle:ipAddr];
    }
}


@end
