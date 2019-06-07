%BoardGenerator.m
%
%Generates chessStartingBoard.mat, which contains a single
%8x8 matrix which represents the starting chess board.

clear;

chessStartingBoard = [[4,1,0,0,0,0,-1,-4],
                      [2,1,0,0,0,0,-1,-2],
                      [3,1,0,0,0,0,-1,-3],
                      [5,1,0,0,0,0,-1,-5],
                      [6,1,0,0,0,0,-1,-6],
                      [3,1,0,0,0,0,-1,-3],
                      [2,1,0,0,0,0,-1,-2],
                      [4,1,0,0,0,0,-1,-4]];
     
%handles contains metadata necessary to determine whether moves like
%castling and en passant are possible
gameInfo.wKing = 0; %0 if king has not yet moved, 1 otherwise
gameInfo.bKing = 0; 
gameInfo.wRook = [0,0]; %0 if rook has not yet moved-1st element A1, second H1
gameInfo.bRook = [0,0]; %1st element A8, second H8
gameInfo.wPawn = [0,0,0,0,0,0,0,0]; %1 if pawn has just moved
gameInfo.bPawn = [0,0,0,0,0,0,0,0];
                  
save('chessStartingBoard.mat')