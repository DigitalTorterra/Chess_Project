function score=PieceSquareScore(board)
% Piece Squared Table Function

%% White Tables

% Pawn
pawnTableW=[ 0,  0,  0,  0,  0,  0,  0,  0;
            50, 50, 50, 50, 50, 50, 50, 50;
            10, 10, 20, 30, 30, 20, 10, 10;
             5,  5, 10, 25, 25, 10,  5,  5;
             0,  0,  0, 20, 20,  0,  0,  0;
             5, -5,-10,  0,  0,-10, -5,  5;
             5, 10, 10,-20,-20, 10, 10,  5;
             0,  0,  0,  0,  0,  0,  0,  0];

% Knight

knightTableW=[-50,-40,-30,-30,-30,-30,-40,-50;
              -40,-20,  0,  0,  0,  0,-20,-40;
              -30,  0, 10, 15, 15, 10,  0,-30;
              -30,  5, 15, 20, 20, 15,  5,-30;
              -30,  0, 15, 20, 20, 15,  0,-30;
              -30,  5, 10, 15, 15, 10,  5,-30;
              -40,-20,  0,  5,  5,  0,-20,-40;
              -50,-40,-30,-30,-30,-30,-40,-50];
         
% Bishop

bishopTableW=[-20,-10,-10,-10,-10,-10,-10,-20;
              -10,  0,  0,  0,  0,  0,  0,-10;
              -10,  0,  5, 10, 10,  5,  0,-10;
              -10,  5,  5, 10, 10,  5,  5,-10;
              -10,  0, 10, 10, 10, 10,  0,-10;
              -10, 10, 10, 10, 10, 10, 10,-10;
              -10,  5,  0,  0,  0,  0,  5,-10;
              -20,-10,-10,-10,-10,-10,-10,-20];
         
% Rook 

rookTableW =[0,  0,  0,  0,  0,  0,  0,  0;
             5, 10, 10, 10, 10, 10, 10,  5;
            -5,  0,  0,  0,  0,  0,  0, -5;
            -5,  0,  0,  0,  0,  0,  0, -5;
            -5,  0,  0,  0,  0,  0,  0, -5;
            -5,  0,  0,  0,  0,  0,  0, -5;
            -5,  0,  0,  0,  0,  0,  0, -5;
             0,  0,  0,  5,  5,  0,  0,  0];
         
% Queen

queenTableW=[-20,-10,-10, -5, -5,-10,-10,-20;
             -10,  0,  0,  0,  0,  0,  0,-10;
             -10,  0,  5,  5,  5,  5,  0,-10;
              -5,  0,  5,  5,  5,  5,  0, -5;
               0,  0,  5,  5,  5,  5,  0, -5;
             -10,  5,  5,  5,  5,  5,  0,-10;
             -10,  0,  5,  0,  0,  0,  0,-10;
             -20,-10,-10, -5, -5,-10,-10,-20];
         
% King

kingTableW=[-30,-40,-40,-50,-50,-40,-40,-30;
            -30,-40,-40,-50,-50,-40,-40,-30;
            -30,-40,-40,-50,-50,-40,-40,-30;
            -30,-40,-40,-50,-50,-40,-40,-30;
            -20,-30,-30,-40,-40,-30,-30,-20;
            -10,-20,-20,-20,-20,-20,-20,-10;
             20, 20,  0,  0,  0,  0, 20, 20;
             20, 30, 10,  0,  0, 10, 30, 20];
         
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





