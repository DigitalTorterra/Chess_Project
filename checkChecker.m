function [isInCheck]=checkChecker(board,pawnDir)
%function [isInCheck]=checkChecker(board)
%
%checks if positive player is in check, returns 1 if so, or 0 if not
%input: board-8x8 board matrix
%output: isInCheck, boolean

king = find(board==6);

for irow = 1:8
    for icol = 1:8
        if board(irow, icol) == 6
            king = board(irow, icol);
        end
        switch board(irow, icol)
            case -1 % opponent pawn
                if board(irow+1, icol+pawnDir) == king || board(irow-1, icol+pawnDir) == king
                    isInCheck = 1;
                else
                    isInCheck = 0;
                end
                
            case -2 % opponent knight
                for iKnightRow = 1:4
                    rowMove = knightPossibilities(iKnightRow);
                    for iKnightCol = 1:2
                        if abs(rowMove) == 1
                            if iKnightCol == 1
                                colMove = 2;
                            else
                                colMove = -2;
                            end
                        else
                            if iKnightcol == 1
                                colMove = 1;
                            else
                                colMove = -1;
                            end
                        end
                        newRow = irow + rowMove;
                        newCol = icol + colMove;
                    end
                end
                if board(newRow, newCol) == king
                    isInCheck = 1;
                    return
                else
                    isInCheck = 0;
                end
                
            case -3 % opponent bishop
                genPossibilities = [-1, 1];
                for iRowIncr = 1:2
                    rowDir = genPossibilities(irowIncr);
                    for iRowIncr = 1:2
                        colDir = genPossibilities(icolIncr);
                        
                        newBishRow = irow + rowDir;
                        newBishCol = icol + colDir;
                    end
                end
                
                for bishRow = 1:length(newBishRow)
                    for bishCol = 1:length(newBishCol)
                        if board(bishRow, bishCol) == -3
                            isInCheck = 1;
                        else
                            isInCheck = 0;
                    end
                end
                
            case -4 % opponent rook
                genPossibilities = [-1,1];
                for irowIncr = 1:2
                    rowdir = genPossibilities(irowIncr);
                    
                    newRookRow = irow + rowdir;
                    newRookCol = icol;
                end
                for icolIncr = 1:2
                    coldir = genPossibilities(icolIncr);
                    
                    newRookrow = irow;
                    newRookcol = icol + coldir;
                end
            
            case -5 % opponent queen
                % call horizontal and diagonal move functions
                crossMoves = horizontalGen(board, irow, icol);
                diagMoves = diagonalGen(board, irow, icol);
           
            case -6 % opponent king
                for kRow = -1:1
                    for kCol = -1:1
                        if kRow ~= 0 && kCol ~= 0
                            currentKrow = irow + kRow;
                            currentKcol = icol + kCol;
                        end
                        if board(currentKrow, currentKcol) == king
                            isInCheck = 1;
                        else
                            isInCheck = 0;
                        end
                end
        end
    end
end


isInCheck=0;