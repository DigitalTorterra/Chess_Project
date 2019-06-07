function [gameInfo]=updateHandles(currentBoard,nextBoard,gameInfo)
%function [handles]=updateHandles(currentBoard,nextBoard,handles)
%updates handles after a given move is made
gameInfo.wKing = 0; %0 if king has not yet moved, 1 otherwise
gameInfo.bKing = 0; 
gameInfo.wRook = [0,0]; %0 if rook has not yet moved-1st element A1, second H1
gameInfo.bRook = [0,0]; %1st element A8, second H8
gameInfo.wPawn = [0,0,0,0,0,0,0,0]; %1 if pawn has just moved
gameInfo.bPawn = [0,0,0,0,0,0,0,0];

%check if the kings have moved yet
if nextBoard(5,1) ~= 6
    gameInfo.wKing = 1;
end
if nextBoard(5,8) ~= -6
    gameInfo.bKing = 1;
end

%check if the rooks have moved yet
if nextBoard(1,1) ~= 4
    gameInfo.wRook(1) = 1;
end
if nextBoard(8,1) ~= 4
    gameInfo.wRook(2) = 1;
end
if nextBoard(1,8) ~= -4
    gameInfo.bRook(1) = 1;
end
if nextBoard(8,8) ~= -4
    gameInfo.bRook(2) = 1;
end

%set bPawn and wPawn back to 0, then check if any pawn has just moved two
%spaces
gameInfo.wPawn = [0,0,0,0,0,0,0,0];
gameInfo.bPawn = [0,0,0,0,0,0,0,0];

for color = [1,0]
    if color
        pawnStartingCol = 2;
        pawnForwardDir = 1;
    else
        pawnStartingCol = 7;
        pawnForwardDir = -1;
    end
    
    for irow = 1:8
        if (abs(currentBoard(irow,pawnStartingCol)) == 1) && ...
                (sum(abs(nextBoard(irow,pawnStartingCol:pawnStartingCol+pawnForwardDir))) == 0) && ...
                (abs(nextBoard(irow,pawnStartingCol+2*pawnForwardDir)) == 1)
            if color
                gameInfo.wPawn(irow) = 1;
            else
                gameInfo.bPawn(irow) = 1;
            end
        end
    end
end