%gameDemo.m
%
%Plays through a simulated game between two computers using the random
%strategy. Saves the board state at each turn for viewing after the fact.

clear
clc

%% Initialization

%contains the standard starting board "chessStartingBoard" and the list of
%data on movement "gameInfo"
load('chessStartingBoard.mat')
board = chessStartingBoard;

%1 if white's turn, 0 if black's-flip every turn
turn = 1;

%% Playing the Game

%keeps a log of the turns made
log = zeros(8,8,1);
log = cat(3,log,board); %initially store the first move

move = 0;

%continue until you receive a board of all 0's, signaling the end of the
%game
while (sum(sum(abs(board))) > 0) && (move < 1000)
    %generate the next boards
    nextBoards = genNextBoards(board,turn,gameInfo);
    
    %randomly select a board
    nbSize = size(nextBoards);
    subSize = size(nbSize);
    if subSize(2) == 2
        l = 1;
    else
        l = nbSize(3);
    end
    selection = randi(l,1);
    nextBoard = nextBoards(:,:,selection);
    
    %update the gameInfo
    gameInfo = updateHandles(board,nextBoard,gameInfo);
    
    %update and store the new board
    board = nextBoard;
    log = cat(3,log,board);
    
    %toggle turn
    turn = ~turn;
    move = move + 1;
end
    
disp(log)
    