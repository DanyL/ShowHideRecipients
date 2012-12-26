#import <UIKit/UIKit.h>
#import <ChatKit/ChatKit.h>

static BOOL isRecipientListView;

%hook CKTranscriptController

-(void)loadView {
	%orig;
	
	UITapGestureRecognizer *tapGestureRecognizer =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleRecipientListView)];
	[tapGestureRecognizer setNumberOfTapsRequired:2];
	[tapGestureRecognizer setNumberOfTouchesRequired:1];
	[self.view addGestureRecognizer:tapGestureRecognizer];
	[tapGestureRecognizer release];
	tapGestureRecognizer = nil;
}

%new
- (void)toggleRecipientListView {
	if (isRecipientListView)
		[self _hideRecipientListView];
	else
		[self _showRecipientListView];
}

- (void)_showRecipientListView {
	%orig;
	isRecipientListView = YES;
}

- (void)_hideRecipientListView {
	%orig;
	isRecipientListView = NO;
}

%end
