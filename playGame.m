function result=playGame(handles)
%Plays a game based on the information specified in the GUI

%% Reading Info From GUI

player1Strategy = handles.options1.Value;
player2Strategy = handles.options2.Value;

player1Depth = str2double(handles.Tree1.String);
player2Depth = str2double(handles.Tree2.String);

drawMoves = handles.display.Value;

%changing draw
%handles.wWin
%handles.bWin
%handles.draw

%change the moves made box-somehow?

%% Initialization

%contains the standard starting board "chessStartingBoard" and the list of
%data on movement "gameInfo"
load('chessStartingBoard.mat')
board = chessStartingBoard;

%1 if white's turn, 0 if black's-flip every turn
turn = 1;

%figuring out strategies for white and black
strategies = {@AIrandom,@AIaddition,@AIpiecesquare,@AIhybrid,@AIhuman};
whiteF = strategies{player1Strategy};
blackF = strategies{player2Strategy};

%% Playing the Game

wMoves = {};
bMoves = {};
move = 1;
cont = 1;
pieces = drawboard(board);
drawnow
%continue until you receive a board of all 0's, signaling the end of the
%game
while cont && (move < 1000)
    if turn
        [nextBoard,gameInfo,cont] = whiteF(board,gameInfo,turn,player1Depth,pieces);
    else
        [nextBoard,gameInfo,cont] = blackF(board,gameInfo,turn,player2Depth,pieces);
    end
    
    if handles.logcheckbox.Value==1 && sum(abs(nextBoard(:))) ~= 0
        moveText = annotateMove(board,nextBoard,turn,cont);
        
        if turn
            wMoves{ceil(move/2)} = moveText;
            bMoves{ceil(move/2)} = '-';
        else
            bMoves{ceil(move/2)} = moveText;
        end
        
        for i=1:ceil(move/2)
            cMoves{i} = strjoin({wMoves{i},bMoves{i}},'  ');
        end
        
        set(handles.moves,'String',cMoves);
    end
    move = move + 1;
    turn = ~turn;
    if sum(abs(nextBoard(:))) ~= 0
    	board = nextBoard;
        if drawMoves
            pieces = drawboard(board);
            drawnow
        end
    end
end

if checkChecker3(board,-1)
    result = -1;
elseif checkChecker3(-board,1)
    result=1;
else
    result=0;
end
