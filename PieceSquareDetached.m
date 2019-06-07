function score=PieceSquareDetached(board,tables)
% Piece Squared Table Function

%% White Tables

pawnTableW = tables.pawnTableW;
knightTableW = tables.knightTableW;
bishopTableW = tables.bishopTableW;
rookTableW = tables.rookTableW;
queenTableW = tables.queenTableW;
kingTableW = tables.kingTableW;

%% Black Tables 

% Pawn
pawnTableB=fliplr(pawnTableW);

% Knight
knightTableB=fliplr(knightTableW);

% Bishop
bishopTableB=fliplr(bishopTableW);

% Rook
rookTableB=fliplr(rookTableW);

% Queen
queenTableB=fliplr(queenTableW);

% King
kingTableB=fliplr(kingTableW);

%% Score

% Creates a board-matrix for each type of piece with piece square
% values in place of the pieces at their specific location

pawnW=(board==1).*pawnTableW;
pawnB=(board==-1).*pawnTableB;

knightW=(board==2).*knightTableW;
knightB=(board==-2).*knightTableB;

bishopW=(board==3).*bishopTableW;
bishopB=(board==-3).*bishopTableB;

rookW=(board==4).*rookTableW;
rookB=(board==-4).*rookTableB;

queenW=(board==5).*queenTableW;
queenB=(board==-5).*queenTableB;

kingW=(board==6).*kingTableW;
kingB=(board==-6).*kingTableB;
        
% Adds the values from each piece

pawnScoreW=sum(pawnW(:));
pawnScoreB=sum(pawnB(:));

knightScoreW=sum(knightW(:));
knightScoreB=sum(knightB(:));

bishopScoreW=sum(bishopW(:));
bishopScoreB=sum(bishopB(:));

rookScoreW=sum(rookW(:));
rookScoreB=sum(rookB(:));

queenScoreW=sum(queenW(:));
queenScoreB=sum(queenB(:));

kingScoreW=sum(kingW(:));
kingScoreB=sum(kingB(:));

% Find final score

white=pawnScoreW+knightScoreW+bishopScoreW+rookScoreW+queenScoreW+kingScoreW;
black=pawnScoreB+knightScoreB+bishopScoreB+rookScoreB+queenScoreB+kingScoreB;

score=white-black;





