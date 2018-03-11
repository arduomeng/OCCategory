//
//  NSLayoutConstraint+Multiplier.m
//  VideoShow
//
//  Created by user on 2017/12/21.
//  Copyright © 2017年 energy. All rights reserved.
//

#import "NSLayoutConstraint+Multiplier.h"

@implementation NSLayoutConstraint (Multiplier)
-(instancetype)updateMultiplier:(CGFloat)multiplier {
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.firstItem attribute:self.firstAttribute relatedBy:self.relation toItem:self.secondItem attribute:self.secondAttribute multiplier:multiplier constant:self.constant];
    [newConstraint setPriority:self.priority];
    newConstraint.shouldBeArchived = self.shouldBeArchived;
    newConstraint.identifier = self.identifier;
    newConstraint.active = true;
    
    [NSLayoutConstraint deactivateConstraints:[NSArray arrayWithObjects:self, nil]];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:newConstraint, nil]];
    //NSLayoutConstraint.activateConstraints([newConstraint])
    return newConstraint;
}
@end
