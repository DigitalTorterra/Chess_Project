function n=treeTotalValues(gameTree)
%function n=treeTotalValues(gameTree)
%
%Counts the number of boards in gameTree
n = 0;

if ~isa(gameTree.children,'double')
    for i=1:length(gameTree.children)
        n = n + treeTotalValues(gameTree.children(i));
    end
else
    n = 1;
end