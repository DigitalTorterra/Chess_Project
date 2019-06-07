function score=pieceAddition(board,weights)
%function score=pieceAddition(board,weights)
%
%Inputs: board-8x8 board matrix, weights-1x6 weight vector with the score
%of each piece
%Output: score- white score-black score

%finds the number of each white piece
pieces = [sum(board(:)==1),sum(board(:)==2),sum(board(:)==3),sum(board(:)==4),sum(board(:)==5),sum(board(:)==6)];

%finds the values of each white piece
whiteScore = sum(pieces.*weights);

%finds the number of each black piece
board = board*-1;
pieces = [sum(board(:)==1),sum(board(:)==2),sum(board(:)==3),sum(board(:)==4),sum(board(:)==5),sum(board(:)==6)];

%finds the values of each black piece
blackScore = sum(pieces.*weights);

score = whiteScore-blackScore;