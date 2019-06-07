function [nextBoard,nextHandles,cont] = AIaddition(board,gameInfo,turn,depth,pieces)
%function nextBoard = AIaddition(board,gameInfo,turn)
%This function handles the standard piece addition AI. It takes a 
%board as input and outputs a the next best board according to its
%objective function.
%board-the current board
%gameInfo-the current gameInfo
%turn-1 for white, 0 for black
%depth-how large of a game tree to use

cont = 1;

gameTree = genGameTree(board,depth,turn,gameInfo);

[value,child] = alphabeta(gameTree,-inf,inf,turn,@standardPieceAddition);
    
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