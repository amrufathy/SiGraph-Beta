function varargout = menu(varargin)
% MENU MATLAB code for menu.fig
%      MENU, by itself, creates a new MENU or raises the existing
%      singleton*.
%
%      H = MENU returns the handle to a new MENU or the handle to
%      the existing singleton*.
%
%      MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU.M with the given input arguments.
%
%      MENU('Property','Value',...) creates a new MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menu

% Last Modified by GUIDE v2.5 26-Mar-2015 22:43:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu_OpeningFcn, ...
                   'gui_OutputFcn',  @menu_OutputFcn, ...
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


% --- Executes just before menu is made visible.
function menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu (see VARARGIN)

% Choose default command line output for menu
handles.output = hObject;

global T;
T = [];
global X;
X = [];
set(handles.continuousbutton,'value',1);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menu wait for user response (see UIRESUME)
% uiwait(handles.menu);


% --- Executes on button press in addFunction.
function addFunction_Callback(hObject, eventdata, handles)
% hObject    handle to addFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %set(hObject,'Enable','off') %turn off the button
    
    global T;
    global X;
    
    if (~isempty(get(handles.initTime,'string')))
        initTime = str2num(get(handles.initTime,'string'));
    else
        warndlg('Please Enter Initial Time');
    end
    if (~isempty(get(handles.finTime,'string')))
        finTime = str2num(get(handles.finTime,'string'));
    else
        warndlg('Please Enter Final Time');
    end
    if (~isempty(get(handles.stepTime,'string')))
        tstep = str2num(get(handles.stepTime,'string'));
    else
        warndlg('Please Enter Time Step');
    end
    if( ~isempty(get(handles.initTime,'string')) && ...
        ~isempty(get(handles.stepTime,'string')) && ...
        ~isempty(get(handles.finTime,'string')))
            t = initTime:tstep:finTime;
            switch(get(handles.listbox1,'value'))
                case 1 %sin       
                    prompt = {'Amplitude:','Frequency:','Angle Shift'};
                    dlg_title = 'Sinusoidal Wave Parameters';
                    def = {'1','0.5','0'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotSine(t,input{1},input{2},input{3});
                case 2 %dc
                    prompt = {'Amplitude:'};
                    dlg_title = 'DC Wave Parameters';
                    def = {'1'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotDC(t,input{1});
                case 3 %ramp
                    prompt = {'Slope:','Shift:'};
                    dlg_title = 'Ramp Wave Parameters';
                    def = {'1','0'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotRamp(t,input{1},input{2});
                case 4 %expo
                    prompt = {'Amplitude:','Exponent:'};
                    dlg_title = 'Exponential Wave Parameters';
                    def = {'1','1'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotExp(t,input{1}, input{2});
                case 5 %impulse
                    prompt = {'Shift:'};
                    dlg_title = 'Impulse Wave Parameters';
                    def = {'0'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotImpulse(t,input{1});
                case 6 %unit
                    prompt = {'Amplitude:','Shift:'};
                    dlg_title = 'Unit Step Wave Parameters';
                    def = {'1','0'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotUnitStep(t,input{1},input{2});
                case 7 %rect
                    prompt = {'Amplitude:','Shift:','Width:'};
                    dlg_title = 'Rectangular Wave Parameters';
                    def = {'1','0','1'};
                    input = inputdlg(prompt,dlg_title,1,def);
                    for i=1:size(input)
                        input{i} = str2num(input{i});
                    end
                    [t,x] = plotRect(t,input{1},input{2},input{3});
            end    
            
            T = [T,t];
            X = [X,x];
            
            if(get(handles.continuousbutton,'value') == get(handles.continuousbutton,'max'))
                set(handles.discretebutton,'value',0);
                cla;
                plot(T,X,'LineWidth',3);
            elseif(get(handles.discretebutton,'value') == get(handles.discretebutton,'max'))
                set(handles.continuousbutton,'value',0);
                cla;
                stem(T,X,'LineWidth',3);
            end
            
     end

    
% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Are you sure you would like to quit ?', ...
	'Exit Dialogue', ...
	'Yes','No','');
    if strcmp(choice,'Yes')
        close(gcf);
    end


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
T = [];
global X;
X = [];
cla;


% --- Executes on button press in continuousbutton.
function continuousbutton_Callback(hObject, eventdata, handles)
% hObject    handle to continuousbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of continuousbutton
global T;
global X;
if(get(hObject,'value') == get(hObject,'max'))
    set(handles.discretebutton,'value',0);
    cla;
    plot(T,X,'LineWidth',3);
end


% --- Executes on button press in discretebutton.
function discretebutton_Callback(hObject, eventdata, handles)
% hObject    handle to discretebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of discretebutton
global T;
global X;
if(get(hObject,'value') == get(hObject,'max'))
    set(handles.continuousbutton,'value',0);
    cla;
    stem(T,X,'LineWidth',3);
end


% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% 				Don't mind the code below        فكك من الكود اللي تحت
% <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
% <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


% --- Outputs from this function are returned to the command line.
function varargout = menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function initTime_Callback(hObject, eventdata, handles)
% hObject    handle to initTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initTime as text
%        str2double(get(hObject,'String')) returns contents of initTime as a double

% --- Executes during object creation, after setting all properties.
function initTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function finTime_Callback(hObject, eventdata, handles)
% hObject    handle to finTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finTime as text
%        str2double(get(hObject,'String')) returns contents of finTime as a double

% --- Executes during object creation, after setting all properties.
function finTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on key press with focus on addFunction and none of its controls.
function addFunction_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to addFunction (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

function stepTime_Callback(hObject, eventdata, handles)
% hObject    handle to stepTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepTime as text
%        str2double(get(hObject,'String')) returns contents of stepTime as a double

% --- Executes during object creation, after setting all properties.
function stepTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when menu is resized.
function menu_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
