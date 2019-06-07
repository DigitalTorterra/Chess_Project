function [nextBoard,nextHandles,cont] = AIrandom(board,gameInfo,turn,depth,pieces)
%function nextBoard = AIrandom(board,gameInfo,turn)
%This function acts as a fully random AI. It takes a board as input
%and outputs a random possible next board. 
%Inputs: 
%board-the current board
%gameInfo-the current gameInfo
%turn-1 for white, 0 for black
%depth-this would normally be the depth of the game tree to generate, but
%is not really needed. Just included for consistency with all other AI
%functions

cont = 1;

%generates the next boards
nextBoards = genNextBoards(board,turn,gameInfo);

nbSize = size(nextBoards);
sizeSize = size(nbSize);

%if genNextBoards only generated one board, just return that board
if sizeSize(2) == 2
    nextBoard = nextBoards;
    if sum(abs(nextBoard(:))) == 0
        cont = 0;
        nextHandles = gameInfo;
    else
        nextHandles = updateHandles(board,nextBoard,gameInfo);
    end
    
%if not, randomly pick one
else
    nextSpot = randi(nbSize(3));
    nextBoard = nextBoards(:,:,nextSpot);
    nextHandles = updateHandles(board,nextBoard,gameInfo);
end
