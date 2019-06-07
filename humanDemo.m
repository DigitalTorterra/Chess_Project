function humanDemo()


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
        good = 0;
        
        while ~good
            pieces = drawboard(board);
            [nextBoard,good] = humanMove(board,gameInfo,pieces,turn);
        end
        
        %make sure the game ends if there are no more possible moves
        gameInfo = updateHandles(board,nextBoard,gameInfo);
        nextBoards = genNextBoards(nextBoard,~turn,gameInfo);
        if sum(abs(nextBoards(:))) == 0
            cont = 0;
            
        end
    else
        [nextBoard,gameInfo,cont] = AIhybrid(board,gameInfo,turn,depth);
    end
    
	move = move + 1;
	turn = ~turn;
	if sum(abs(nextBoard(:))) ~= 0
    	board = nextBoard;
        log = cat(3,log,board);
	end
end
    
disp(log)
    

%save('GameResults.mat')