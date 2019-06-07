function dragvoid()


board=imread('chessboard2.png');
king=imread('king.png');



imshow(board, [], 'XData', [0 1024], 'YData', [0 1024]);
hold on
xlim([0 8])
ylim([0 8])

%

axis xy
axis equal
hax=gca;


%
hPimage=image('CData',king);
Hpimage.Parent=hax;

image(board,'Xdata',[10 -0.1],'Ydata',[10 -0.1]);
hold on
%set(f,'WindowButtonMotionFcn','set(gcf,''Pointer'',''arrow'')');
%axis equal; box on;
set(gca,'DataAspectRatio',[1 1 1],'XLim',[0 10],'YLim',[0 10],...
    'XTick',0:10,'YTick',0:10);
grid off;
hold on;
%% White Pieces
 knight1w = imread('knight_w.png'); 
        cross=image(knight1w,'Xdata',[1.3 2.3],'Ydata',[1 -.1]);

 rook1w=imread('rook_w.png');
 cross=image(rook1w,'Xdata',[0 1], 'Ydata', [1 0]);

       
 bishop1w=imread('bishop_w.png');
 cross=image(bishop1w,'Xdata',[2.5 3.5], 'Ydata', [1 0]);

       
 queenb=imread('queen_w.png');
 cross=image(queenb,'Xdata',[3.8 4.8], 'Ydata', [1 0]);
 
 
 kingw=imread('king_w.png');
 cross=image(kingw,'Xdata',[5.1 6.1], 'Ydata', [1 0]);

       
 bishop2w=imread('bishop_w.png');
 cross=image(bishop2w,'Xdata',[6.3 7.3], 'Ydata', [1 0]);
 
 
 
 knight2w=imread('knight_w.png');
 cross=image(knight2w,'Xdata',[7.6 8.6], 'Ydata', [1 0]);
 

rook2w=imread('rook_w.png');
cross=image(rook2w,'Xdata',[8.8 9.8], 'Ydata', [1 0]);


for i=1:8
    pawnw=imread('pawn_w.png');
    xc=(1.260*i)-1.236;
    cross(i)=image(pawnw, 'Xdata',[xc xc+1], 'Ydata', [2.3 1.3]);
    
end

%% Black pieces

 kingb=imread('king_b.png');
 cross=image(kingb,'Xdata',[5.1 6.1], 'Ydata', [10 9]);

 
 queenb=imread('queen_b.png');
 cross=image(queenb,'Xdata',[3.8 4.8], 'Ydata', [10 9]);

 
bishop1b=imread('bishop_b.png');
 cross=image(bishop1b,'Xdata',[2.5 3.5], 'Ydata', [10 9]);

 
  bishop2b=imread('bishop_b.png');
 cross=image(bishop2b,'Xdata',[6.3 7.3], 'Ydata', [10 9]);

 knight1b = imread('knight_b.png'); 
        cross=image(knight1b,'Xdata',[1.3 2.3],'Ydata',[10 9]);
      
        
  knight2b=imread('knight_b.png');
 cross=image(knight2b,'Xdata',[7.6 8.6], 'Ydata', [10 9]);

 
rook1b=imread('rook_b.png');
 cross=image(rook1b,'Xdata',[0 1], 'Ydata', [10 9]);


 rook2b=imread('rook_b.png');
cross=image(rook2b,'Xdata',[8.8 9.8], 'Ydata', [10 9]);


for i=1:8
    pawnb=imread('pawn_b.png');
    xc=(1.260*i)-1.236;
    cross1(i)=image(pawnb, 'Xdata',[xc xc+1], 'Ydata', [8.55 7.55]);
    
end



