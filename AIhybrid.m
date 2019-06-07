function [nextBoard,nextHandles,cont] = AIhybrid(board,gameInfo,turn,depth,pieces)
%function nextBoard = AIpiecesquare(board,gameInfo,turn)
%This function handles the hybrid AI. It takes a 
%board as input and outputs the next best board according to its
%objective function.
%board-the current board
%gameInfo-the current gameInfo
%turn-1 for white, 0 for black
%depth-how large of a game tree to use

cont = 1;

gameTree = genGameTree(board,depth,turn,gameInfo);

objectiveFunction = @(board) PieceSquareModular(board,1) + 100*standardPieceAddition(board);

[value,child] = alphabeta(gameTree,-inf,inf,turn,objectiveFunction);
    
if ~isa(gameTree.children,'double')
    %update the gameInfo
	nextHandles = gameTree.children(child).gameInfo;
    
	%update and store the new board
	nextBoard = gameTree.children(child).board;

else
	cont = 0;
    nextBoard = 0;
    nextHandles = gameInfo;
end