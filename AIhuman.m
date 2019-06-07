function [nextBoard,nextHandles,cont] = AIhuman(board,gameInfo,turn,depth,pieces)
%function [nextBoard,nextHandles,cont] = AIhuman(board,gameInfo,turn,depth,pieces)
%This function allows a human player to make a move
cont = 1;

good = 0;
while ~good
    [nextBoard,good] = humanMove(board,gameInfo,pieces,turn);
    if ~good
        pieces = drawboard(board);
    end
end

%make sure the game ends if there are no more possible moves
nextHandles = updateHandles(board,nextBoard,gameInfo);
nextBoards = genNextBoards(nextBoard,~turn,gameInfo);
if sum(abs(nextBoards(:))) == 0
	cont = 0;
end
   