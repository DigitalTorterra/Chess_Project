function moveText=annotateMove(board,nextBoard,turn,cont)
%function moveText=annotateMove(board,nextBoard)
%Takes in a board and a next board as input and outputs a standard chess
%move text to display

% How to Notate:
% Standard-the first letter is the name of the piece, and is blank if a pawn 
% moved.
% ' '-pawn
% 'N'-knight
% 'B'-bishop
% 'R'-rook
% 'Q'-queen
% 'K'-king
% 
% If the move involves a capture, an 'x' is placed next.
% 
% After this, the square that the piece moved to is recorded.
% ex: e4,h5,etc.
% rows are a-h, columns are 1-8
% 
% If the move places the enemy king in check, a '+' is placed at the end.
% If checkmate, end with '#'
% 
% Castling is 0-0 if king side and 0-0-0 if queen side

if ~turn
    board = board * -1;
    nextBoard = nextBoard * -1;
end

%% Castling

kingLocation = find(board == 6);
row1 = mod(kingLocation,8);
if row1 == 0
    row1 = 8;
end
kingLocation = find(nextBoard == 6);
row2 = mod(kingLocation,8);
if row2 == 0
    row2 = 8;
end

if row1 == 5
    if row2 == 7
        moveText = '0-0';
        return
    elseif row2 == 3
        moveText = '0-0-0';
        return
    end
end
        
%% Determining the Piece that Moved and Where it Moved

%finds all the positions of the current pieces
prePositions = board > 0;
postPositions = nextBoard > 0;
difference = postPositions - prePositions;

initialPosition = find(difference==-1);
finalPosition = find(difference==1);

%this is the code of the piece which was taken
pieceVal = board(initialPosition);
switch pieceVal
    case 1
        piece = '';
    case 2
        piece = 'N';
    case 3
        piece = 'B';
    case 4
        piece = 'R';
    case 5
        piece = 'Q';
    case 6
        piece = 'K';
end

row = mod(finalPosition,8);
if row == 0
    row = 8;
end
col = ceil(finalPosition/8);
letters = 'abcdefgh';
pos = [letters(row),num2str(col)];

%relevant variables: piece, pos

%% Determining if captured

enemyVal1 = board<0;
enemyVal2 = nextBoard<0;

if sum(enemyVal1(:)) ~= sum(enemyVal2(:))
    captured = 1;
else
    captured = 0;
end

%captured-binary, 1 if has been captured, 0 if not

%% Determining Check

isInCheck = checkChecker3(nextBoard*-1,1-2*turn);

%% Final Compilation

moveText = piece;
if captured
    moveText = [moveText,'x'];
end
moveText = [moveText,pos];
if cont && isInCheck
    moveText = [moveText,'+'];
elseif ~cont && isInCheck
    moveText = [moveText,'#'];
end

