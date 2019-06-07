function pieces=drawboard(board)
%% Load in board
%make sure to do pieces.color.piecename example: pieces.black.pawn(1)
chessboard=imread('chessboard2.png');
king=imread('king_w.png');
timesthrough=zeros(2,6);
%
[ny,nx,nz]=size(king);
kingWidth=128;
kingHeight=128;
imshow(chessboard, [], 'XData', [0 1024], 'YData', [0 1024]);
hold on
xlim([0 8])
ylim([0 8])
axis xy
axis equal
hax=gca;
image(chessboard,'Xdata',[10 -0.1],'Ydata',[10 -0.1]);
hold on
%set(f,'WindowButtonMotionFcn','set(gcf,''Pointer'',''arrow'')');
%axis equal; box on;
set(gca,'DataAspectRatio',[1 1 1],'XLim',[0 10],'YLim',[0 10],...
    'XTick',0:10,'YTick',0:10);
grid off;
hold on;
%% Draw board based off of boardgenerator function
for irow=1:8
    for icol=1:8
        xc=(1.260*irow)-1.236;
        yr=(1.260*icol)-.3;
        
        switch board(irow,icol)
            case 1
                timesthrough(1,1)=timesthrough(1,1)+1;
                pawnw=imread('pawn_w.png');
                pieces.white.pawn(timesthrough(1,1))=image(pawnw, 'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
               
            case 2
                timesthrough(1,2)=timesthrough(1,2)+1;
                knight1w = imread('knight_w.png');
                pieces.white.knight(timesthrough(1,2))=image(knight1w,'Xdata',[xc xc+1],'Ydata',[yr yr-1]);
            case 3
                timesthrough(1,3)=timesthrough(1,3)+1;
                bishop1w=imread('bishop_w.png');
                pieces.white.bishop(timesthrough(1,3))=image(bishop1w,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
            case 4
                timesthrough(1,4)=timesthrough(1,4)+1;
                rook1w=imread('rook_w.png');
                pieces.white.rook(timesthrough(1,4))=image(rook1w,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
            case 5
                timesthrough(1,5)=timesthrough(1,5)+1;
                queenw=imread('queen_w.png');
                pieces.white.queen(timesthrough(1,5))=image(queenw,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
                
            case 6 
                timesthrough(1,6)=timesthrough(1,6)+1;
                kingw=imread('king_w.png');
                pieces.white.king(timesthrough(1,6))=image(kingw,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]); 
                
           case -1
                timesthrough(2,1)=timesthrough(2,1)+1;
                pawnb=imread('pawn_b.png');
                pieces.black.pawn(timesthrough(2,1))=image(pawnb, 'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
               
            case -2
                timesthrough(2,2)=timesthrough(2,2)+1;
                knight1b = imread('knight_b.png');
                pieces.black.knight(timesthrough(2,2))=image(knight1b,'Xdata',[xc xc+1],'Ydata',[yr yr-1]);
            case -3
                timesthrough(2,3)=timesthrough(2,3)+1;
                bishop1b=imread('bishop_b.png');
                pieces.black.bishop(timesthrough(2,3))=image(bishop1b,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
            case -4
                timesthrough(2,4)=timesthrough(2,4)+1;
                rook1b=imread('rook_b.png');
                pieces.black.rook(timesthrough(2,4))=image(rook1b,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
            case -5
                timesthrough(2,5)=timesthrough(2,5)+1;
                queenb=imread('queen_b.png');
                pieces.black.queen(timesthrough(2,5))=image(queenb,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]);
                
            case -6 
                timesthrough(2,6)=timesthrough(2,6)+1;
                kingb=imread('king_b.png');
                pieces.black.king(timesthrough(2,6))=image(kingb,'Xdata',[xc xc+1], 'Ydata', [yr yr-1]); 
                
                
        end
    end
end

