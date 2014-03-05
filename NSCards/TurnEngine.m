//
//  TurnEngine.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "TurnEngine.h"

@implementation TurnEngine

-(void)setUpBoard
{
	self.devicePlayer = [[NSPlayer alloc] initWithColor:TRUE];
	self.opponent = [[NSPlayer alloc] initWithColor:FALSE];
	self.board = [[NSBoard alloc] init];
	
	self.devicePlayer.isWhitePlayer = TRUE;
	self.opponent.isWhitePlayer = FALSE;
	self.devicePlayer.displayName = @"Player";
	self.opponent.displayName = @"Opponent";
	
	for (int i = 0; i < 2; i++)
	{
		[self.board addThreadToPlayerThreadArray:self.board.p1Threads];
		[self.board addThreadToPlayerThreadArray:self.board.p2Threads];
	}
	
	self.devicePlayer.threads = self.board.p1Threads;
	self.opponent.threads = self.board.p2Threads;
	self.devicePlayer.gameEngine = self;
	self.opponent.gameEngine = self;
	self.board.gameEngine = self;
	
	for (int i = 0; i < 5; i++)
	{
		[self.devicePlayer drawCard];
	}
}

+(TurnEngine *)sharedEngine
{
	static dispatch_once_t pred;
	static TurnEngine *shared = nil;
	dispatch_once(&pred, ^{
		shared = [[TurnEngine alloc] init];
	});
	return shared;
}

@end
