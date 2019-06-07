%strategyTesting.m
%
%This program is designed to test the effectiveness of each strategy
%relative to each other strategy. 

clear
clc


%% Initialization

%contains the standard starting board "chessStartingBoard" and the list of
%data on movement "gameInfo"
load('chessStartingBoard.mat')
initialBoard = chessStartingBoard;
initialgameInfo = gameInfo;

%game data
depth = 2;
maxTurns = 1000;
numGames = 200;

%% Strategy Declaration

% Strategies to Test:
% 1. Random
% 2. Simple Piece Addition
% 3. Piece-Square Tables
% 4. Hybrid Strategy

%creates a cell array with all the AI functions
strategies = {@AIrandom,@AIaddition,@AIpiecesquare,@AIhybrid};

%% Strategy Testing

%We will store our results in this 4x4x3 matrix. The first layer (:,:,1)
%represents games won by white, second layer (:,:,2) games won by black,
%and third layer (:,:,3) draws.
resultStorage = zeros(4,4,3);


%use for loops to iterate through all combinations
for whiteNum = 1:4
    for blackNum = 1:4
        disp([num2str(whiteNum),' vs ',num2str(blackNum)])
        
        whiteF = strategies{whiteNum};
        blackF = strategies{blackNum};
        
        for game = 1:numGames
            %initial game information
            turn = 1;
            turnNum = 1;
            cont = 1;
            board = initialBoard;
            gameInfo = initialgameInfo;
        
            disp(game)
            
            %play the game
            while cont && turnNum < maxTurns
                if turn
                    [nextBoard,nextHandles,cont] = whiteF(board,gameInfo,turn,depth);
                else
                    [nextBoard,nextHandles,cont] = blackF(board,gameInfo,turn,depth);
                end
            
                turnNum = turnNum + 1;
                turn = ~turn;
                gameInfo = nextHandles;
                if sum(abs(nextBoard(:))) ~= 0
                    board = nextBoard;
                end
            end
            
            %figuring out the outcome of the game
            if ~cont
                %if white is in checkmate
                if checkChecker3(board,-1)
                    resultStorage(whiteNum,blackNum,2) = resultStorage(whiteNum,blackNum,2) + 1;
                %if black is in checkmate
                elseif checkChecker3(-board,1)
                    resultStorage(whiteNum,blackNum,1) = resultStorage(whiteNum,blackNum,1) + 1;
                 else
                    resultStorage(whiteNum,blackNum,3) = resultStorage(whiteNum,blackNum,3) + 1;
                end
            else
                resultStorage(whiteNum,blackNum,3) = resultStorage(whiteNum,blackNum,3) + 1;
            end
        end
          
    end
end
%save the results!
save('results.mat','resultStorage');