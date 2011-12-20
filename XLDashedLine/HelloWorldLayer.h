//
//  HelloWorldLayer.h
//  XLDashedLine
//
//  Created by Richard Wei on 11-12-20.
//  Copyright Xinranmsn Labs 2011年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class XLDashedLine;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <CCTargetedTouchDelegate>
{
    XLDashedLine *line;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
