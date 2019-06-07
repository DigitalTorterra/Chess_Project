function [value,child] = alphabeta(gameTree,a,b,maximizingPlayer,objectiveFunction)
%function [value,child] = alphabeta(gameTree,depth,a,b,maximizingPlayer,objectiveFunction)
%To initialize:
%[value,child]=alphabeta(gameTree, ?inf, +inf, player,@objectiveFunction)
%player=1 if white, 0 if black
%objectiveFunction-should take a board as input and output a score
%Outputs: value-the value of the board assuming both players make ideal
%moves, child-the array index of the ideal move

children = [];

% Base Case
if isa(gameTree.children,'double')
    if gameTree.gameOver
        if checkChecker3(gameTree.board,1)
            value = -10000;
        elseif checkChecker3(gameTree.board,-1)
            value = 10000;
        else
            value = 0;
        end
    else
        value = objectiveFunction(gameTree.board);
    end
    
    children = [1,children];

% Maximizing Case
elseif maximizingPlayer
    value = -inf;
    
    for i=1:length(gameTree.children)
        nextValue = alphabeta(gameTree.children(i),a,b,0,objectiveFunction);
        value = max([value,nextValue]);
        a = max(a,value);
        
        if value == nextValue
            children = [i,children];
        end
        
        if a >= b
            break
        end
    end
       
% Minimizing Case
else
    value = inf;
    
    for i=1:length(gameTree.children)
        nextValue = alphabeta(gameTree.children(i),a,b,1,objectiveFunction);
        value = min([value,nextValue]);
        b = min(b,value);
        
        if value == nextValue
            children = [i,children];
        end
        
        if a >= b
            break
        end
    end
end

child = children(randi(length(children)));
