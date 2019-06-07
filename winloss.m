function winloss(handles)




player1str=' ,';
player2str='.';
player3str='Draw';
c = categorical({player1str, player2str, player3str});

a=str2double(handles.whiteWins.String);
b=str2double(handles.blackWins.String);
c=str2double(handles.draws.String);
x=[a,b,c];




% player1wins=str2double(handles.whiteWins.String);
% player2wins=str2double(handles.draw.String);
% player3wins=str2double(handles.blackWins.String);

%wins=[player1wins, player2wins, player3wins];
bar(x);
