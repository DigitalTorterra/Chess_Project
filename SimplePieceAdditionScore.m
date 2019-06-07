function score=SimplePieceAdditionScore(matrix)
% Inputs an 8x8 matrix of pieces and outputs the score of the game 

white=0;
black=0;

for icount=1:8
    for icnt=1:8
        if matrix(icount,icnt)>0
            white=matrix(icount,icnt)+white;
        elseif matrix(icount,icnt)<0
            black=matrix(icount,icnt)+black;
        end
    end
end

black=abs(black);
score=abs(white-black);
