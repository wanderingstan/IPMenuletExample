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
    __weak IBOutlet NSMenu *_menuletMenu;
}

- (void) awakeFromNib
{
	_statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[_statusItem setHighlightMode:YES];
	[_statusItem setEnabled:YES];
	[_statusItem setToolTip:@"IPMenulet"];
	[_statusItem setTarget:self];

    // Attach pull-down menu
    [_statusItem setMenu:_menuletMenu];

	/*
	// Title as string
	[_statusItem setTitle:[NSString stringWithString:@"0.0.0.0"]]; 
	 */
	
	/* 
	//Title as Unicode Glyph
	[_statusItem setTitle:[NSString stringWithFormat:@"%C",0x2295]];
	 */
		
	// Title as Image + String
    NSImage * menuIcon = [NSImage imageNamed:@"MenuletIcon"];
    [_statusItem setImage:menuIcon];
	[_statusItem setTitle:@"000"];
}

- (IBAction) updateIPAddress:(id)sender
{
    NSString *ipAddress = [NSString stringWithContentsOfURL:[NSURL URLWithString:
                                                             @"http://highearthorbit.com/service/myip.php"] encoding:NSASCIIStringEncoding error:nil];
    if (ipAddress != nil) {
		[_statusItem setTitle:ipAddress];
    }
}

- (IBAction)quitAction:(id)sender {
    [[NSApplication sharedApplication] terminate:nil];
}

@end
