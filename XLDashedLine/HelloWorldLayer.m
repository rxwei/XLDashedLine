//
//  HelloWorldLayer.m
//  XLDashedLine
//
//  Created by Richard Wei on 11-12-20.
//  Copyright Xinranmsn Labs 2011年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "XLDashedLine.h"

static ccColor4F ccc4F(float _r, float _g, float _b, float _a) {
    ccColor4F retColor = {_r, _g, _b, _a};
    return retColor;
}

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)onEnterTransitionDidFinish {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1 swallowsTouches:YES];
    [super onEnterTransitionDidFinish];
}

- (void)onExit {
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}

// on "init" you need to initialize your instance
- (id)init {
	if ((self = [super init])) {
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Touch and Drag" fontName:@"Marker Felt" fontSize:32];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width /2 , size.height/2 );
		[self addChild: label];
        
        line = [XLDashedLine lineWithStartPoint:ccp(0.0, 0.0) endPoint:ccp(0.0, 0.0) width:4.0 color:ccc4F(1.0, 1.0, 1.0, 1.0) dashLength:8.0];
        line.visible = NO;
        [self addChild:line];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
    line.startPoint = location;
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
    line.endPoint = location;
    line.visible = YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    line.visible = NO;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
