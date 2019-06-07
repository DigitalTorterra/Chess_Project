%newDemo.m
%
%Plays through a simulated game between two computers using the random
%strategy. Saves the board state at each turn for viewing after the fact.

%clear
%clc

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
cont = 1;
depth = 2;
%continue until you receive a board of all 0's, signaling the end of the
%game
while cont && (move < 1000)
    %generate the next boards and make the decision
    if turn
        objectiveFunction = @(board) PieceSquareModular(board,1) + 100*standardPieceAddition(board);
    else
        objectiveFunction = @(board) standardPieceAddition(board);
    end
    gameTree = genGameTree(board,depth ,turn,gameInfo);
    [value,child] = alphabeta(gameTree,-inf,inf,turn,objectiveFunction);
    
    if ~isa(gameTree.children,'double')
    
        %update the gameInfo
        gameInfo = gameTree.children(child).gameInfo;
    
        %update and store the new board
        board = gameTree.children(child).board;
        log = cat(3,log,board);
    
        %toggle turn
        turn = ~turn;
        move = move + 1;
        
        %depth = findIdealDepth(gameTree,depth);
        %disp(depth)
    else
        cont = 0;
    end
end
    
disp(log)
    

%save('GameResults.mat')