Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testId [

self assert: MyPawn new id equals: 'P'.
]

{ #category : 'tests' }
MyPawnTests >> testInPassingMove [

|movingWhitePawn stillBlackPawn movingBlackPawn board squares|

board := MyChessBoard empty.
board at: 'a2' put: (movingWhitePawn:= MyPawn white).
board at: 'a5' put: (stillBlackPawn := MyPawn black).
board at: 'b4' put: (movingBlackPawn := MyPawn black).

movingWhitePawn moveTo: 'a2'.

self assert:
	movingWhitePawn square equals: 'a4'.

squares := movingBlackPawn targetSquares.

self assertCollection: squares
	includesAll: (#(a3 b3) collect: [ :name | board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testMoveWithOpponentObstacle [

|pawn board squares|

board := MyChessBoard empty.
board at: 'e6' put: (pawn := MyPawn white).
board at: 'e7' put: (MyPawn black).
squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#() collect: [ :name |
				 board at: name ])




]

{ #category : 'tests' }
MyPawnTests >> testNormalMove [
"test"
|pawn board squares|

board := MyChessBoard empty.
board at: 'e6' put: (pawn := MyPawn white).
squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e7 ) collect: [ :name |
				 board at: name ])




]

{ #category : 'tests' }
MyPawnTests >> testTwoTilesMove [

|pawn board squares|

board := MyChessBoard empty.
board at: 'f7' put: (pawn:= MyPawn black).

squares := pawn targetSquares.
	self 
		assertCollection: squares
		includesAll:
			( #(f8 f9) collect: [ :name | board at: name ]) 
]
