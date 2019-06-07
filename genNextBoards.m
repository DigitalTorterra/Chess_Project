function [nextBoards]=genNextBoards(board,turn,gameInfo)
%function [nextBoards]=genNextBoards(board)
%
%input: board-8x8 matrix following our standard convention
%turn-1 if white, 0 if black
%handles: contains information about the state of board-pretty much whether
%the rooks, kings, and pawns have moved yet
%output: nextBoards-8x8xn matrices with each possible next board state

%if it's black's move, invert the colors
if ~turn
    board = board * -1;
end

%initializing nextBoards
nextBoards = zeros(8,8,1);

%value declaration
if turn
    pawnStartingCol = 2;
    pawnForwardDir = 1;
else
    pawnStartingCol = 7;
    pawnForwardDir = -1;
end

knightPossibilities = [-2,-1,1,2];
                                                                                                                                   
for irow=1:8
    for icol=1:8
        %find the white pieces
        if board(irow,icol) > 0
            %generate the possible next board states
            switch board(irow,icol)
                case 1 %pawn
                    %standard movement
                    if board(irow,icol+pawnForwardDir) == 0
                        board_clone = board;
                        board_clone(irow,icol) = 0;
                        board_clone(irow,icol+pawnForwardDir) = 1;
                        
                        %check if pawn is being promoted, add boards
                        %accordingly
                        if (icol+pawnForwardDir == 1) || (icol+pawnForwardDir == 8)
                            possibleBoards = pawnPromote(board_clone,irow,icol+pawnForwardDir);
                            nextBoards = cat(3,nextBoards,possibleBoards);
                        else
                            nextBoards = cat(3,nextBoards,board_clone);
                        end
                        
                        %moving twice on your first move
                        if icol==pawnStartingCol && board(irow, icol+2*pawnForwardDir)==0
                            board_clone = board;
                            board_clone(irow,icol) = 0;
                            board_clone(irow,icol+pawnForwardDir*2) = 1;
                            nextBoards = cat(3,nextBoards,board_clone);
                        end
                    end
                    
                    %diagonal capturing
                    if irow ~= 1 && board(irow-1,icol+pawnForwardDir) < 0
                        board_clone = board;
                        board_clone(irow,icol) = 0;
                        board_clone(irow-1,icol+pawnForwardDir) = 1;
                        
                        %check if pawn is being promoted, add boards
                        %accordingly
                        if (icol+pawnForwardDir==1) || (icol+pawnForwardDir == 8)
                            possibleBoards = pawnPromote(board_clone,irow-1,icol+pawnForwardDir);
                            nextBoards = cat(3,nextBoards,possibleBoards);
                        else
                            nextBoards = cat(3,nextBoards,board_clone);
                        end
                    end
                    if irow ~= 8 && board(irow+1,icol+pawnForwardDir) < 0
                        board_clone = board;
                        board_clone(irow,icol) = 0;
                        board_clone(irow+1,icol+pawnForwardDir) = 1;
                        
                        %check if pawn is being promoted, add boards
                        %accordingly
                        if (icol+pawnForwardDir==1) || (icol+pawnForwardDir == 8)
                            possibleBoards = pawnPromote(board_clone,irow+1,icol+pawnForwardDir);
                            nextBoards = cat(3,nextBoards,possibleBoards);
                        else
                            nextBoards = cat(3,nextBoards,board_clone);
                        end
                    end
                    
                    %en passant
                    if (icol == pawnStartingCol + 3) || (icol == pawnStartingCol - 3)
                        if irow ~= 8 && isOnBoard(irow+1,icol) && board(irow+1,icol) == -1 && board(irow+1,icol+pawnForwardDir) == 0
                            if (turn && gameInfo.bPawn(irow+1)) || (~turn && gameInfo.wPawn(irow+1))
                                board_clone = board;
                                board_clone(irow,icol) = 0;
                                board_clone(irow+1,icol) = 0;
                                board_clone(irow+1,icol+pawnForwardDir) = 1;
                                nextBoards = cat(3,nextBoards,board_clone);
                            end
                        end
                        if irow ~= 1 && isOnBoard(irow-1,icol) && board(irow-1,icol) == -1 && board(irow-1,icol+pawnForwardDir) == 0
                            if (turn && gameInfo.bPawn(irow-1)) || (~turn && gameInfo.wPawn(irow-1))
                                board_clone = board;
                                board_clone(irow,icol) = 0;
                                board_clone(irow-1,icol) = 0;
                                board_clone(irow-1,icol+pawnForwardDir) = 1;
                                nextBoards = cat(3,nextBoards,board_clone);
                            end
                        end
                    end   
                
                case 2 %knight
                    for iKnightRow =1:4
                        rowMove = knightPossibilities(iKnightRow);
                        for iKnightCol = 1:2
                            if abs(rowMove) == 1
                                if iKnightCol == 1
                                    colMove = 2;
                                else
                                    colMove = -2;
                                end
                            else
                                if iKnightCol == 1
                                    colMove = 1;
                                else
                                    colMove = -1;
                                end
                            end
                            
                            newRow = irow+rowMove;
                            newCol = icol+colMove;
                            
                            if isOnBoard(newRow, newCol) && board(newRow,newCol) <= 0
                                board_clone = board;
                                board_clone(irow,icol) = 0;
                                board_clone(newRow,newCol) = 2;
                                nextBoards = cat(3,nextBoards,board_clone);
                            end
                        end
                    end
                
                case 3 %bishop
                    %calls diagonalGen, lets same code be reused for queen
                    bishopMoves = diagonalGen(board,irow,icol);
                    
                    if sum(abs(bishopMoves(:))) > 0
                        nextBoards = cat(3,nextBoards,bishopMoves);
                    end
                
                case 4 %rook
                    %calls horizontalGen
                    rookMoves = horizontalGen(board,irow,icol);
                    
                    if sum(abs(rookMoves(:))) > 0
                        nextBoards = cat(3,nextBoards,rookMoves);
                    end
                
                case 5 %queen
                    %call horizontalGen and diagonalGen
                    crossMoves = horizontalGen(board,irow,icol);
                    diagMoves = diagonalGen(board,irow,icol);
                    
                    if sum(abs(crossMoves(:))) > 0
                        nextBoards = cat(3,nextBoards,crossMoves);
                    end
                    
                    if sum(abs(diagMoves(:))) > 0
                        nextBoards = cat(3,nextBoards,diagMoves);
                    end
                
                case 6 %king
                    for krow = -1:1
                        for kcol = -1:1
                            if krow ~= 0 || kcol ~= 0
                                currentRow = irow+krow;
                                currentCol = icol+kcol;
                                
                                if isOnBoard(currentRow,currentCol) && board(currentRow,currentCol) <= 0
                                    board_clone = board;
                                    board_clone(irow,icol) = 0;
                                    board_clone(currentRow,currentCol) = 6;
                                    nextBoards = cat(3,nextBoards,board_clone);
                                end
                            end
                        end
                    end
                    
                    %castling
                    if (turn && ~gameInfo.wKing && ~gameInfo.wRook(1) && board(1,1)==4) || (~turn && ~gameInfo.bKing && ~gameInfo.bRook(1) && board(1,8)==-4)
                        %can't castle while in check, must have an open
                        %path to move through
                        isInCheck = checkChecker3(board,-1*pawnForwardDir);
                        if ~isInCheck && sum(abs(board(2:4,icol))) == 0
                            %can't castle through check
                            tempBoard = board;
                            tempBoard(irow,icol) = 0;
                            tempBoard(4,icol) = 6;
                            isInCheck = checkChecker3(tempBoard,-1*pawnForwardDir);
                            if ~isInCheck
                                board_clone = board;
                                board_clone(1,icol) = 0;
                                board_clone(5,icol) = 0;
                                board_clone(3,icol) = 6;
                                board_clone(4,icol) = 4;
                                nextBoards = cat(3,nextBoards,board_clone);
                            end
                        end
                    end
                    if (turn && ~gameInfo.wKing && ~gameInfo.wRook(2)&& board(8,1)==4) || (~turn && ~gameInfo.bKing && ~gameInfo.bRook(2) && board(8,8)==-4)
                        %can't castle while in check, must have an open
                        %path to move through
                        isInCheck = checkChecker3(board,-1*pawnForwardDir);
                        if ~isInCheck && sum(abs(board(6:7,icol))) == 0
                            %can't castle through check
                            tempBoard = board;
                            tempBoard(irow,icol) = 0;
                            tempBoard(6,icol) = 6;
                            isInCheck = checkChecker3(tempBoard,-1*pawnForwardDir);
                            if ~isInCheck
                                board_clone = board;
                                board_clone(8,icol) = 0;
                                board_clone(5,icol) = 0;
                                board_clone(7,icol) = 6;
                                board_clone(6,icol) = 4;
                                nextBoards = cat(3,nextBoards,board_clone);
                            end
                        end
                    end
            end
        end
    end
end

%makes sure that boards were actually generated before continuing
boardsGenerated = size(nextBoards);
bgSize = size(boardsGenerated);
if bgSize(2) ~= 3
    isInCheck = checkChecker3(nextBoards,-1*pawnForwardDir);
    if isInCheck
        nextBoards = nextBoards*0;
    end
    return
end

%filter out any next boards that place the king in check
finalBoards = zeros(8,8,1);

for i = 2:boardsGenerated(3)
    isInCheck = checkChecker3(nextBoards(:,:,i),-1*pawnForwardDir);
    if ~isInCheck
        finalBoards = cat(3,finalBoards,nextBoards(:,:,i));
    end
end

%makes sure there are still possibilities before continung
boardsGenerated = size(finalBoards);
bgSize = size(boardsGenerated);
if bgSize(2) ~= 3
    nextBoards = finalBoards;
    return
end

%reassign nextBoards to the trimmed boards
nextBoards = finalBoards(:,:,2:boardsGenerated(3));

%invert colors back to account for processing
if ~turn
    nextBoards = nextBoards * -1;
end