function [gameTree]=genGameTree(board,depth,turn,gameInfo)
%function [gameTree]=genGameTree(board,depth)
%
%Recursively generates a game tree based on 8x8 array board with depth
%depth, based on the specified turn.
%Outputs gameTree, a nested system of structs. At each layer, item.board
%contains the board and item.children contains an array of structs

%initially set the board attribute
gameTree.board = board;
gameTree.gameInfo = gameInfo;
gameTree.gameOver = 0;

%base case
if depth == 0
    gameTree.children = 0;
    return

%recursive case
else
    nextBoards = genNextBoards(board,turn,gameInfo);
    
    nbSize = size(nextBoards);
    subSize = size(nbSize);

    if subSize(2) == 2
        if sum(sum(abs(nextBoards))) == 0
            gameTree.children = 0;
            gameTree.gameOver = 1;
            return
        else
            l = 1;
        end
    else
        l = nbSize(3);
    end
end

%make the recursive call
for i=1:l
    newBoard = nextBoards(:,:,i);
    newGameInfo = updateHandles(board,newBoard,gameInfo);
    
    gameTree.children(i) = genGameTree(newBoard,depth-1,~turn,newGameInfo);
end
    