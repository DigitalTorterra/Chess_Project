function [nextBoards]=diagonalGen(board,irow,icol)
%function [nextBoards]=diagonalGen(board,row,col)
%generates all possible diagnal moves for a piece-used by bishop+queen

genPossibilities = [-1,1];
nextBoards = zeros(8,8,1);

pieceValue = board(irow,icol);

for irowIncr = 1:2
	rowDir = genPossibilities(irowIncr);
    for icolIncr = 1:2
    	colDir = genPossibilities(icolIncr);
                            
        currentRow = rowDir+irow;  
        currentCol = colDir+icol;
                            
        while isOnBoard(currentRow,currentCol) && board(currentRow,currentCol) == 0
        	board_clone = board;
            board_clone(irow,icol) = 0;
            board_clone(currentRow,currentCol) = pieceValue;
            nextBoards = cat(3,nextBoards,board_clone);
                                
            currentRow = currentRow+rowDir; 
            currentCol = currentCol+colDir;
        end
                            
        if isOnBoard(currentRow,currentCol) && board(currentRow,currentCol) < 0
        	board_clone = board;
            board_clone(irow,icol) = 0;
            board_clone(currentRow,currentCol) = pieceValue;
            nextBoards = cat(3,nextBoards,board_clone);
        end
    end
end

boardsGenerated = size(nextBoards);
genSize = size(boardsGenerated);
if genSize(2) > 2
    nextBoards = nextBoards(:,:,2:boardsGenerated(3));
end