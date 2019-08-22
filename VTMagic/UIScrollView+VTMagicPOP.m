//
//  UIScrollView+VTMagicPOP.m
//  VTMagic
//
//  Created by rsf on 2019/8/22.
//

#import "UIScrollView+VTMagicPOP.h"

@implementation UIScrollView (VTMagicPOP)

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
	if ([self panBack:gestureRecognizer]) {
		return NO;
	}
	return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
	if ([self panBack:gestureRecognizer]) {
		return YES;
	}
	
	return NO;
}
- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer == self.panGestureRecognizer) {
		CGPoint point = [self.panGestureRecognizer translationInView:self];
		UIGestureRecognizerState state = gestureRecognizer.state;
		
		CGFloat locationDistance = [UIScreen mainScreen].bounds.size.width;
		
		if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStatePossible) {
			CGPoint location = [gestureRecognizer locationInView:self];
			if (point.x > 0 && location.x < locationDistance && self.contentOffset.x <= 0) {
				return YES;
			}
		}
	}
	return NO;
}

@end
