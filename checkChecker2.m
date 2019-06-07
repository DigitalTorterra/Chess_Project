function [row, col, isInCheck]=checkChecker2(board, pawnDir)
%function [isInCheck]=checkChecker(board)
%
%checks if positive player is in check, returns 1 if so, or 0 if not
%input: board-8x8 board matrix
%output: isInCheck, boolean


%% value declaration
kingLocation = find(board == 6);
row = mod(kingLocation,8);
col = floor(kingLocation/8)+1;


%% Mapping

% pawn
if board(row+1, col+pawnDir) == -1 || board(irow-1, col+pawnDir) == -1
    isInCheck = 1;
    return
end

% knight
knightPossibilities = [-2,-1,1,2];

for knightRow = 1:4
    rowKnightmove = knightPossibilities(knightRow)
    for knightCol = 1:2
        if abs(rowKnightmove) == 1
            if knightCol == 1
                colKnightmove = 2;
            else
                colKnightmove = -2;
            end
        else
            if
                knightCol == 1
                colKnightmove = 1;
            else
                colKnightmove = -1;
            end
        end
        newKnightrow = rowKnightmove + row;
        newKnightcol = colKnightmove + col;
    end
end

if board(newKnightrow, newKnightcol) == -2
    isInCheck = 1;
    return
end

% bishop/queen
genPossibilities = [-1,1];

for iRowIncr = 1:2
    rowBishDir = genPossibilities(irowIncr);
    for iRowIncr = 1:2
        colBishDir = genPossibilities(icolIncr);
        
        newBishRow = row + rowBishDir;
        newBishCol = col + colBishDir;
    end
end

if board(newBishRow, newBishCol) == -3 || board(newRookRow, newRookCol == -5
    isInCheck = 1;
    return
end

% rook/queen
genPossibilities = [-1,1];

for irowIncr = 1:2
    rowRookdir = genPossibilities(irowIncr);
    
    newRookRow = row + rowRookdir;
    newRookCol = col;
    if board(newRookRow, newRookCol) == -4 || board(newRookRow, newRookCol == -5
        isInCheck = 1;
        return
    end
end

for icolIncr = 1:2
    colRookdir = genPossibilities(icolIncr);
    
    newRookrow = row;
    newRookcol = col + colRookdir;
    if board(newRookRow, newRookCol) == -4 || board(newRookRow, newRookCol == -5
        isInCheck = 1;
        return
    end
end

% king
for kRow = -1:1
    for kCol = -1:1
        if kRow ~= 0 && kCol ~= 0
            newKingrow = row + kRow;
            newKingcol = col + kCol;
        end
        if board(newKingrow, newKingcol) == -6
            isInCheck = 1;
            return
        end
    end
end

isInCheck = 0;
