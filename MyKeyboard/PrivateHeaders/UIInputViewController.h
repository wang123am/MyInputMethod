//
//  UIInputViewController.h
//  MyInputMethod
//
//  Created by luowei on 15/7/2.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIInputViewController(Private)

- (void)_didResetDocumentState;
- (void)_willResetDocumentState;

- (id)_textDocumentInterface;
- (id)_proxyInterface;
- (id)_compatibilityController;

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges;
- (struct CGSize)_systemLayoutSizeFittingSize:(struct CGSize)arg1 withHorizontalFittingPriority:(float)arg2 verticalFittingPriority:(float)arg3;
- (void)_setExtensionContext:(id)arg1;
- (id)_extensionContext;

- (void)_setTextDocumentProxy:(id)arg1;
- (void)_setupInputController;

@end
