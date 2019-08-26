#import <ZDCChat/ZDCChat.h>
#import <ZDCChat/ZDCPreChatFormView.h>

@interface ZDCPreChatFormView (GetChangeZDCPreChatFormView)

+ (void) load;
- (instancetype) ext_initWithFrame: (CGRect)frame withController:(id<ZDCVisitorActionDelegate>)controller;

@end
