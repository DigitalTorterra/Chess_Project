function [onboard]=isOnBoard(row,col)
%function [onboard]=isOnBoard(row,col)
%checks if the board index specified by row and col is a valid square
%on the chess board

if row>=1 && row<=8 && col >= 1 && col <= 8
    onboard =  1;
else
    onboard = 0;
end