function score=PieceSquareModular(board,setNum)
%function score=PieceSquareModular(board,setNum)
%Takes a board position and Piece-Square Table set number as input and
%outputs a Piece-Square Score

tables = boardLookup(setNum);

score = PieceSquareDetached(board,tables);









