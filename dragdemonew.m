function dragdemo(demotitle)

if nargin == 0
    demotitle = 'snapgrid';
end
switch lower(demotitle)
    

    case 'snapgrid'
end
        
        f = figure;
board=imread('chessboard2.png');
king=imread('king.png');
hold on 

%
[ny,nx,nz]=size(king);
kingWidth=128;
kingHeight=128;

        set(f,'WindowButtonMotionFcn','set(gcf,''Pointer'',''arrow'')');
        axis equal; box on;
        set(gca,'DataAspectRatio',[1 1 1],'XLim',[0 10],'YLim',[0 10],...
            'XTick',0:10,'YTick',0:10);
        grid on;
        title('SNAPGRID demo for draggable.m');
        
        %   Now we create a cross which will snap on a grid with 1-unit
        %   spacing. This is done by giving the handle to the move_cross
        %   function (see below) as the 'movefcn' argument of draggable.m.
        
        hold on;
        a = imread('knight_w.png'); 
        cross=image(a,'Xdata',[4 5],'Ydata',[1 -.1]);
        %isize=imresize(cross,[3,3]);
       % c=cross('Position',[0.7 0.1 0.1 0.2]);
        draggable(cross,[inf inf inf inf]);
        
        %   Now we create a cross which will snap on a grid with 1-unit
        %   spacing. This is done by giving the handle to the move_cross
        %   function (see below) as the 'movefcn' argument of draggable.m.
        
        hold on;
        a2 = imread('paun.jpg'); 
        cross2=image(a2,'Xdata',[4 5],'Ydata',[4 5]);
        %isize=imresize(cross,[3,3]);
       % c=cross('Position',[0.7 0.1 0.1 0.2]);
        draggable(cross2,[inf inf inf inf]);
    
