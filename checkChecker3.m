function [isInCheck,row, col]=checkChecker3(board, pawnDir) %changed order so we can just get isInCheck
%function [isInCheck]=checkChecker(board)
%
%checks if positive player is in check, returns 1 if so, or 0 if not
%input: board-8x8 board matrix
%output: isInCheck, boolean


%% value declaration
kingLocation = find(board == 6);
row = mod(kingLocation,8);
if row == 0
    row = 8;
end
col = ceil(kingLocation/8);


%% Mapping

% pawn
%added a check to see if the spaces are actually on the board
%also changed it to subtract pawnDir just to maintain convention
if (isOnBoard(row+1, col-pawnDir)&&board(row+1, col-pawnDir) == -1) || (isOnBoard(row-1, col-pawnDir)&&board(row-1, col-pawnDir) == -1)
    isInCheck = 1;
    return
end

% knight
for rowKnightmove = [-2,-1,1,2] %simplified this to just iterate through the possible moves
    for knightCol = 1:2
        if abs(rowKnightmove) == 1
            if knightCol == 1
                colKnightmove = 2;
            else
                colKnightmove = -2;
            end
        else
            if knightCol == 1 %just fixed your if syntax here
                colKnightmove = 1;
            else
                colKnightmove = -1;
            end
        end
        
        newKnightrow = rowKnightmove + row;
        newKnightcol = colKnightmove + col;
        
        %added your if statement into the for loop and added a condition
        %checking to see if the generated row and column is actually on
        %the board
        if isOnBoard(newKnightrow,newKnightcol) && board(newKnightrow, newKnightcol) == -2
            isInCheck = 1;
            return
        end 
    end
end

% bishop
for rowBishDir=[-1,1]
    for colBishDir=[-1,1]        
        newBishRow = row + rowBishDir;
        newBishCol = col + colBishDir;
        while isOnBoard(newBishRow,newBishCol) && board(newBishRow,newBishCol) == 0
            newBishRow = newBishRow+rowBishDir; 
            newBishCol = newBishCol+colBishDir;
        end
        if isOnBoard(newBishRow, newBishCol) && (board(newBishRow, newBishCol) == -3 || board(newBishRow, newBishCol) == -5)
            isInCheck = 1;
            return
        end
    end
end



% rook
genPossibilities = [-1,1];

for irowIncr = 1:2
    rowRookdir = genPossibilities(irowIncr);
    
    newRookRow = row + rowRookdir;
    newRookCol = col;
    while isOnBoard(newRookRow,newRookCol) && board(newRookRow,newRookCol) == 0                        
        newRookRow = newRookRow+rowRookdir;
    end
    if isOnBoard(newRookRow,newRookCol) && (board(newRookRow, newRookCol) == -4 || board(newRookRow, newRookCol) == -5)
        isInCheck = 1;
        return
    end
end

for icolIncr = 1:2
    colRookdir = genPossibilities(icolIncr);
    
    newRookRow = row;
    newRookCol = col + colRookdir;
    while isOnBoard(newRookRow,newRookCol) && board(newRookRow,newRookCol) == 0
       newRookCol = newRookCol+colRookdir;
    end
    if isOnBoard(newRookRow,newRookCol) && (board(newRookRow, newRookCol) == -4 || board(newRookRow, newRookCol) == -5)
        isInCheck = 1;
        return
    end
end

% king
%just changed around the structure of this a bit and added a check to make
%sure a given square is on the board
for kRow = -1:1
    for kCol = -1:1
        if kRow ~= 0 || kCol ~= 0
            newKingrow = row + kRow;
            newKingcol = col + kCol;
            
            if isOnBoard(newKingrow, newKingcol) && board(newKingrow, newKingcol) == -6
                isInCheck = 1;
                return
            end
        end
    end
end

isInCheck = 0;
