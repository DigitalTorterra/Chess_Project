function newDepth=findIdealDepth(gameTree, oldDepth)
%function depth=findIdealDepth(gameTree)
%takes a game tree as input, calculates an ideal depth for the next game
%tree

%the size of the last generated tree
treeSize = treeTotalValues(gameTree);

%the geometric mean
gMean = treeSize^(1/oldDepth);

if gMean > 15
    newDepth = 2;
elseif gMean > 10
    newDepth = 3;
elseif gMean > 3.5
    newDepth = 4;
elseif gMean > 3
    newDepth = 4;
elseif gMean > 2
    newDepth = 4;
else
    newDepth = 4;
end