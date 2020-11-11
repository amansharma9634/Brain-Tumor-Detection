
function varargout = PROJECT(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PROJECT_OpeningFcn, ...
                   'gui_OutputFcn',  @PROJECT_OutputFcn, ...
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
function PROJECT_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = PROJECT_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function pushbutton1_Callback(hObject, eventdata, handles)
global img;
global bw;
global bw5;
global img_gray;
img_gray=rgb2gray(img);
axes(handles.axes3);
imshow(img_gray);
 No = imnoise(img_gray,'gaussian',0,0.025);
 Wiener = wiener2(No,[6 6]);
axes(handles.axes5);
imshow(Wiener);

function slider1_Callback(hObject, eventdata, handles)
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function pushbutton2_Callback(hObject, eventdata, handles)
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
function pushbutton3_Callback(hObject, eventdata, handles)
global img;
global bw;
global bw5;
global img_gray;
global bw3;
fs = get(0,'ScreenSize');
figure('Position',[fs(3)/2 0 fs(3)/2 fs(4)])
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
function slider3_Callback(hObject, eventdata, handles)
ts=get(handles.slider3,'value');
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
axes(handles.axes1);
imshow(img);
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function pushbutton3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
