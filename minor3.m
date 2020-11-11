function varargout = minor3(varargin)
% MINOR3 M-file for minor3.fig
%      MINOR3, by itself, creates a new MINOR3 or raises the existing
%      singleton*.
%
%      H = MINOR3 returns the handle to a new MINOR3 or the handle to
%      the existing singleton*.
%
%      MINOR3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINOR3.M with the given input arguments.
%
%      MINOR3('Property','Value',...) creates a new MINOR3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before minor3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to minor3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help minor3

% Last Modified by GUIDE v2.5 15-Nov-2017 12:05:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @minor3_OpeningFcn, ...
                   'gui_OutputFcn',  @minor3_OutputFcn, ...
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

% --- Executes just before minor3 is made visible.
function minor3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to minor3 (see VARARGIN)

% Choose default command line output for minor3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using minor3.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes minor3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = minor3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
ts=get(handles.slider1,'value');
global img;
if (ts==.05)
img=imread('img1.jpg');
end
if (ts== .1)
    img= imread('img2.jpg')
end
if (ts== .15)
    img= imread('img3.jpg')
end
if (ts== .2)
    img= imread('img4.jpg')
end
if (ts== .25)
    img= imread('img5.jpg')
end
if (ts== .3)
    img= imread('img6.jpg')
end
if (ts== .35)
    img= imread('img7.jpg')
end
if (ts== .4)
    img= imread('img8.jpg')
end
if (ts== .45)
    img= imread('img9.jpg')
end
if (ts== .5)
    img= imread('img10.jpg')
end
if (ts== .55)
    img= imread('img11.jpg')
end
if (ts== .6)
    img= imread('img12.jpg')
end
if (ts== .65)
    img= imread('img13.jpg')
end
if (ts== .7)
    img= imread('img14.jpg')
end
if (ts== .75)
    img= imread('img15.jpg')
end
axes(handles.axes2);
imshow(img);
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global img;
global bw;
global bw5;
global img_gray;
img_gray=rgb2gray(img);
axes(handles.axes3);
imshow(img_gray);
[r c]=size(img_gray);
b=zeros(r,c);
hp_fil=[-1 -1 -1;-1 8 -1;-1 -1 -1];
b=imfilter(img_gray,hp_fil);
axes(handles.axes5);
imshow(b);
c=b+img_gray+25;
medfilt2(c);
axes(handles.axes7);
imshow(c); 
T = graythresh(c);
bw = im2bw(c,T+0.3);
axes(handles.axes4);
imshow(bw);
bw6=watershed(bw);
axes(handles.axes6);
imshow(bw6);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global img;
global bw;
global bw5;
global img_gray;
global bw3;
fs = get(0,'ScreenSize');
figure('Position',[0 0 fs(3)/2 fs(4)])
SE = strel('disk',0);
bw1 = imerode(bw,SE);
subplot(3,2,1);
imshow(bw1);
SE = strel('disk',0);
bw1 = imdilate(bw1,SE);
subplot(3,2,2);
imshow(bw1);
SE2 = strel('disk',1);
bw2 = imerode(bw1,SE2);
subplot(3,2,3);
imshow(bw2)
SE2 = strel('disk',1);
bw2 = imdilate(bw2,SE2);
subplot(3,2,4);
imshow(bw2)
SE3 = strel('disk',6);
bw3 = imerode(bw2,SE3);
subplot(3,2,5);
imshow(bw3)
SE3 = strel('disk',6);
bw3 = imdilate(bw3,SE3);
subplot(3,2,6);
imshow(bw3)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global img;
global bw;
global bw5;
global img_gray;
global bw3;
fs = get(0,'ScreenSize');
figure('Position',[round(fs(3)/2) 0 fs(3)/2 fs(4)])
[r2 c2]=size(bw3);
for i=1:1:r2
    for j=1:1:c2
        if bw3(i,j)==1
            img_gray(i,j)=255;
        else
            img_gray(i,j)=img_gray(i,j)*0.5;
        end;
    end;
end;
subplot(2,1,1);
imshow(img);
subplot(2,1,2);
imshow(img_gray);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
