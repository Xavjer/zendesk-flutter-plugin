#import "GetChange+ZDCPreChatFormView.h"
#import <objc/runtime.h>

@implementation ZDCPreChatFormView (GetChangeZDCPreChatFormView)

+ (void) load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    Class class = [self class];
    
    SEL originalSelector = @selector(initWithFrame:withController:);
    SEL swizzledSelector = @selector(ext_initWithFrame:withController:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
      class_replaceMethod(class,
                          swizzledSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod));
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
  });
}

#pragma mark - Method Swizzled

- (instancetype) ext_initWithFrame: (CGRect)frame withController:(id<ZDCVisitorActionDelegate>)controller {
  id preChatForm = [self ext_initWithFrame:frame withController:controller];
  // TODO: add the TextView as first child for preChatForm with appropriate greeting
  return preChatForm;
}

@end
