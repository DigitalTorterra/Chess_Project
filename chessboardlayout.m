function varargout = chessboardlayout(varargin)
% CHESSBOARDLAYOUT MATLAB code for chessboardlayout.fig
%      CHESSBOARDLAYOUT, by itself, creates a new CHESSBOARDLAYOUT or raises the existing
%      singleton*.
%
%      H = CHESSBOARDLAYOUT returns the handle to a new CHESSBOARDLAYOUT or the handle to
%      the existing singleton*.
%
%      CHESSBOARDLAYOUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHESSBOARDLAYOUT.M with the given input arguments.
%
%      CHESSBOARDLAYOUT('Property','Value',...) creates a new CHESSBOARDLAYOUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chessboardlayout_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chessboardlayout_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chessboardlayout

% Last Modified by GUIDE v2.5 24-Apr-2019 21:44:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chessboardlayout_OpeningFcn, ...
                   'gui_OutputFcn',  @chessboardlayout_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before chessboardlayout is made visible.
function chessboardlayout_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chessboardlayout (see VARARGIN)

% Choose default command line output for chessboardlayout
handles.output = hObject;
handles.wWin = 0;
handles.bWin = 0;
handles.draw = 0;
% Update handles structure
% guidata(hObject, handles);
% axes(handles.chessboard)
% matlabImage = imread('C:\Users\Matthew Peine\Documents\Spring 2019\Intro to engineering\Chess project\New folder\chessboard2.png');
% image(matlabImage)
% axis off
% axis image
% axes(handles.chessboard);
% chessboard();

axes(handles.chessboard);   %
dragvoid();                 % Loads a static chessboard into the main axes

axes(handles.graphs)        % loads a blank graph into the secondary
winloss(handles);           % axes. 

% result=playGame(handles);

axes(handles.graphs);
winlossopen();
% myImage = imread('chessboard2.png');
% axes(handles.chessboard);
% imshow(myImage);



% UIWAIT makes chessboardlayout wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chessboardlayout_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output; 
% ^ HAD TO COMMENT OUT TO GET THE GUI TO WORK WITH READING IN THE FUNCTION




% --- Executes on selection change in options1.
function options1_Callback(hObject, eventdata, handles)
% hObject    handle to options1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns options1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from options1

% player1(1).bar=' ';
% player1(2).bar='Wins by Player 1';
% player1(3).bar='Wins by Random';
% player1(4).bar='Wins piece addition';
% player1(5).bar='Wins by piece square';
% a=handles.options1.Value;
% b=handles.options2.Value;
% 
% handles.graphText1.String=player1(a).bar;
% player2str=player(b).bar;
if handles.options1.Value==5 
    handles.display.Value=1;
end



% --- Executes during object creation, after setting all properties.
function options1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to options1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in options2.
function options2_Callback(hObject, eventdata, handles)
% hObject    handle to options2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns options2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from options2

% player2(1).bar=' ';
% player2(2).bar='Wins by Player 2';
% player2(3).bar='Wins by Random';
% player2(4).bar='Wins piece addition';
% player2(5).bar='Wins by piece square';
% a=handles.options1.Value;
% b=handles.options2.Value;
% 
% handles.graphText2.String=player2(a).bar;

if handles.options2.Value==5 
    handles.display.Value=1;
end

% --- Executes during object creation, after setting all properties.
function options2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to options2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in display.
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of display
if handles.options1.Value==5 ||handles.options2.Value==5 
    handles.display.Value=1;
end

if handles.display.Value==0;
    axes(handles.chessboard);
    dragvoid();
end


% --- Executes on selection change in pastmoves.
function pastmoves_Callback(hObject, eventdata, handles)
% hObject    handle to pastmoves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pastmoves contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pastmoves


% --- Executes during object creation, after setting all properties.
function pastmoves_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pastmoves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pauseButton.
function pauseButton_Callback(hObject, eventdata, handles)
% hObject    handle to pauseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Tree1_Callback(hObject, eventdata, handles)
% hObject    handle to Tree1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tree1 as text
%        str2double(get(hObject,'String')) returns contents of Tree1 as a double


% --- Executes during object creation, after setting all properties.
function Tree1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tree1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tree2_Callback(hObject, eventdata, handles)
% hObject    handle to Tree2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tree2 as text
%        str2double(get(hObject,'String')) returns contents of Tree2 as a double


% --- Executes during object creation, after setting all properties.
function Tree2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tree2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetbutton.
function resetbutton_Callback(hObject, eventdata, handles)
% hObject    handle to resetbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



if handles.resetbutton.Value==1 
handles.whiteWins.String=num2str(0);
handles.blackWins.String=num2str(0);
handles.draws.String=num2str(0);

axes(handles.graphs)
winloss(handles);

end 
if handles.resetbutton.Value==1
    result=0;
    axes(handles.chessboard); 
end 

% --- Executes on button press in newgamebutton.
function newgamebutton_Callback(hObject, eventdata, handles)
% hObject    handle to newgamebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playgame.
function playgame_Callback(hObject, eventdata, handles)
% hObject    handle to playgame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.chessboard);
result = playGame(handles);

whiteWins = str2double(handles.whiteWins.String);
blackWins = str2double(handles.blackWins.String);
draws = str2double(handles.draws.String);
if result==1
    whiteWins = whiteWins + 1;
    handles.whiteWins.String = num2str(whiteWins);
elseif result==-1
    blackWins = blackWins + 1;
    handles.blackWins.String = num2str(blackWins);
else
    draws = draws + 1;
    handles.draws.String = num2str(draws);
end

axes(handles.graphs);
winloss(handles);



% --- Executes on selection change in moves.
function moves_Callback(hObject, eventdata, handles)
% hObject    handle to moves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns moves contents as cell array
%        contents{get(hObject,'Value')} returns selected item from moves


% --- Executes during object creation, after setting all properties.
function moves_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in logcheckbox.
function logcheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to logcheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of logcheckbox


% --- Executes on button press in endgame.
function endgame_Callback(hObject, eventdata, handles)
% hObject    handle to endgame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.endgame.Value==1
    handles.options1.Value=5;
    handles.options2.Value=1;
    axes(handles.chessboard);
    playGame(handles);
end

