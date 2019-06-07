function [newBoards] = pawnPromote(board,row,col)
%function [newBoards] = pawnPromote(board,row,col)
%generates all possible promotions for a pawn-substituting it for a 
%rook,bishop,knight, or queen

rookBoard = board;
rookBoard(row,col) = 4;

bishopBoard = board;
bishopBoard(row,col) = 3;

knightBoard = board;
knightBoard(row,col) = 2;

queenBoard = board;
queenBoard(row,col) = 5;

newBoards = cat(3,rookBoard,bishopBoard,knightBoard,queenBoard);