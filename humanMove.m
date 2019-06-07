function [newBoard,cont] = humanMove(board,gameInfo,pieces,turn)
% function newBoard = humanMove(board,pieces)
% Inputs:
% board-8x8 array following the same conventions as the rest of the code
% pieces-struct containing all of the piece information
% format: pieces.color.piecename(n)
% turn-1 if white, 0 if black
% Output: newBoard-same format as board, with the move registerred
% cont-1 if should continue, 0 if not

%create a sub-struct based on whichever color is currently moving-
%white can only move their own pieces
if turn
    movable = pieces.white;
else
    movable = pieces.black;
end

if exist('moveInfo.mat','file')
    delete('moveInfo.mat')
end


fields = fieldnames(movable);
for i = 1: numel(fields)
    items = movable.(fields{i});
    
    for j = 1:numel(items)
        draggable(items(j),[inf,inf,inf,inf],@pieceMoved,'endfcn',@finalMove)
    end
end

%pause until a piece is dragged
uiwait

%bit of error handling
if ~exist('moveInfo.mat','file')
    newBoard = board;
    cont = 0;
    return
end

%load in and parse the move information
load('moveInfo.mat','firstSpot','currentSpot')
starting_col = round((firstSpot(1,1)+1.236)/1.26);
starting_row = round((firstSpot(2,1)+.3)/1.26);
final_col = round((currentSpot(1,1)+1.236)/1.26);
final_row = round((currentSpot(2,1)+.3)/1.26);

%figure out what move was made, then determine if it was valid
nextBoards = genNextBoards(board,turn,gameInfo);

nSize = size(nextBoards);
sSize = size(nSize);

if sSize(2) == 2
    maxN = 1;
else
    maxN = nSize(3);
end

cont = 0;
newBoard = board;

%Runs through each possible next board to see if it matches
for iBoard = 1:maxN
    nextBoard = nextBoards(:,:,iBoard);
    
    %makes sure the next board's starting spot is empty and final spot is
    %equal to the right board
    if nextBoard(starting_col,starting_row)==0 &&... 
            nextBoard(final_col,final_row)==board(starting_col,starting_row)
        if ~cont
            newBoard = nextBoard;
            cont = 1;
        else
            if ~(nextBoard(5,8-7*turn) == -6 + 12*turn)
                newBoard = nextBoard;
            end  
        end
    end
    
    %pawn promotion
    if nextBoard(starting_col,starting_row)==0 &&... 
            abs(board(starting_col,starting_row)) == 1 &&...
            abs(nextBoard(final_col,final_row)) == 5
        newBoard = nextBoard;
        cont = 1;
    end
end

function pieceMoved(h)
%function pieceMoved(h)
%Runs whenever draggable is run
if exist('moveInfo.mat','file')
    load('moveInfo.mat','firstSpot','currentSpot')
    currentSpot = [h.XData;h.YData];
    save('moveInfo.mat','firstSpot','currentSpot')
else
    firstSpot = [h.XData;h.YData];
    currentSpot = [h.XData;h.YData];
    save('moveInfo.mat','firstSpot','currentSpot')
end

function finalMove(h)
%function finalMove(h)
%Runs at the end of the piece being dragged
uiresume