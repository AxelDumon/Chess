Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isOnStartingRank [

^ self isWhite
	ifTrue: [ square name second = $2 ]
	ifFalse: [ square name second = $7 ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

" ^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
"
    | targetSquares |
    
    "Définir les cibles de base (1 case)"
    targetSquares := self isWhite
        ifTrue: [ { square up } ]
        ifFalse: [ { square down } ].
   
"
    (self isOnStartingRank) ifTrue: [
        ""Vérifier si la case intermédiaire est libre""
        (square upAndUp notNil and: [ square upAndUp hasPiece not ]) ifTrue: [
            targetSquares := targetSquares , { square upAndUp }.
        ].
    ].
"
    (self isOnStartingRank) ifTrue: [
        self isWhite
				ifTrue: [(square up hasPiece not) ifTrue: [
            targetSquares := targetSquares , { square up up}.
				]]
				ifFalse: [(square down hasPiece not) ifTrue: [
            targetSquares := targetSquares , { square down down}.
				]].
        ].
    
    ^ targetSquares select: [ :s |
        s notNil and: [
            s hasPiece not or: [ s contents color ~= color ] ] ]
]
