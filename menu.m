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

% Last Modified by GUIDE v2.5 05-May-2015 17:21:45

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

clear();
set(handles.continuousbutton,'value',1);
set(handles.timedomainbutton,'value',1);
set ( gcf, 'Color', [0.70,0.70,0.70] )
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

global T1; global T2;
global X1; global X2;
global F;
global Y;

if( ~isempty(get(handles.initTime,'string')))
    initTime = str2num(get(handles.initTime,'string'));
else
    warndlg('Please Enter Initial Time');
    return;
end
if( ~isempty(get(handles.finTime,'string')))
    finTime = str2num(get(handles.finTime,'string'));
else
    warndlg('Please Enter Final Time');
    return;
end
if( ~isempty(get(handles.stepTime,'string')))
    tstep = str2num(get(handles.stepTime,'string'));
else
    warndlg('Please Enter Time Step');
    return;
end
if(finTime==initTime)
    warndlg('Initial Time cannot be equal to Final Time');
    return;
end
if(tstep==0)
    warndlg('Time Step Must Be Larger Than Zero');
    return;
end

%Real Work
t = initTime:tstep:finTime;
switch(get(handles.listbox1,'value'))
    case 1 %sin
        prompt = {'Amplitude:','Frequency:','Angle Shift'};
        dlg_title = 'Sinusoidal Wave Parameters';
        def = {'1','0.5','0'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotSine(t,input{1},input{2},input{3});
    case 2 %dc
        prompt = {'Amplitude:'};
        dlg_title = 'DC Wave Parameters';
        def = {'1'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotDC(t,input{1});
    case 3 %ramp
        prompt = {'Slope:','Shift:'};
        dlg_title = 'Ramp Wave Parameters';
        def = {'1','0'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotRamp(t,input{1},input{2});
    case 4 %expo
        prompt = {'Amplitude:','Exponent:'};
        dlg_title = 'Exponential Wave Parameters';
        def = {'1','1'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotExp(t,input{1}, input{2});
    case 5 %impulse
        prompt = {'Shift:'};
        dlg_title = 'Impulse Wave Parameters';
        def = {'0'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotImpulse(t,input{1});
    case 6 %unit
        prompt = {'Amplitude:','Shift:'};
        dlg_title = 'Unit Step Wave Parameters';
        def = {'1','0'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotUnitStep(t,input{1},input{2});
    case 7 %rect
        prompt = {'Amplitude:','Shift:','Width:'};
        dlg_title = 'Rectangular Wave Parameters';
        def = {'1','0','1'};
        input = inputdlg(prompt,dlg_title,1,def);
        if(isempty(input))
            return;
        end
        for i=1:size(input)
            input{i} = str2num(input{i});
        end
        [t,x] = plotRect(t,input{1},input{2},input{3});
end

if(get(handles.opmenu,'value')==1)
                T1 = [T1,t];
X1 = [X1,x];
[F,Y] = timetofreq(T1,X1);
        else
                T2 = [T2,t];
X2 = [X2,x];
[F,Y] = timetofreq(T2,X2);
end
global BreakPoints;
BreakPoints=BreakPoints-1;
if(BreakPoints <= 0)
    switch(get(handles.opmenu,'value'))
            case 2
                [T1 X1]=add(T1,X1,T2,X2,tstep);
            case 3
                [T1 X1]=add(T1,X1,T2,-X2,tstep);
            case 4
                [T1 X1]=multiply(T1,X1,T2,X2,tstep);
            case 5
                [T1 X1]=convolve(T1,X1,T2,X2);
    end
        T2=[];X2=[];
    set(handles.setbutton,'Enable','on');
    set(handles.brkpn,'Enable','on');
    set(handles.addFunction,'Enable','off');
    set(handles.opmenu,'Enable','on');
end

if(get(handles.continuousbutton,'value') == get(handles.continuousbutton,'max'))
    set(handles.discretebutton,'value',0);
    if(get(handles.timedomainbutton,'value') == get(handles.timedomainbutton,'max'))
        set(handles.freqdomainbutton,'value',0);
        cla;
        if(get(handles.opmenu,'value')==1 || BreakPoints <= 0)
                plot(T1,X1,'LineWidth',3);
        else
                plot(T2,X2,'LineWidth',3);
        end
    elseif(get(handles.freqdomainbutton,'value') == get(handles.freqdomainbutton,'max'))
        set(handles.timedomainbutton,'value',0);
        cla;
        plot(F,Y,'LineWidth',3);
    end
elseif(get(handles.discretebutton,'value') == get(handles.discretebutton,'max'))
    set(handles.continuousbutton,'value',0);
    if(get(handles.timedomainbutton,'value') == get(handles.timedomainbutton,'max'))
        set(handles.freqdomainbutton,'value',0);
        cla;
        if(get(handles.opmenu,'value')==1 || BreakPoints <= 0)
                stem(T1,X1,'LineWidth',3);
        else
                stem(T2,X2,'LineWidth',3);
        end
    elseif(get(handles.freqdomainbutton,'value') == get(handles.freqdomainbutton,'max'))
        set(handles.timedomainbutton,'value',0);
        cla;
        stem(F,Y,'LineWidth',3);
    end
end
set(handles.initTime,'string',get(handles.finTime,'string'));


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


% --- Executes on button press in continuousbutton.
function continuousbutton_Callback(hObject, eventdata, handles)
% hObject    handle to continuousbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of continuousbutton
global T1;
global X1;
global F;
global Y;
if(get(hObject,'value') == get(hObject,'max'))
    set(handles.discretebutton,'value',0);
    if(get(handles.timedomainbutton,'value') == get(handles.timedomainbutton,'max'))
        set(handles.freqdomainbutton,'value',0);
        cla;
        if(get(handles.opmenu,'value')==1 || BreakPoints <= 0)
                plot(T1,X1,'LineWidth',3);
        else
                plot(T2,X2,'LineWidth',3);
        end
    elseif(get(handles.freqdomainbutton,'value') == get(handles.freqdomainbutton,'max'))
        set(handles.timedomainbutton,'value',0);
        cla;
        plot(F,Y,'LineWidth',3);
    end
else
    set(hObject,'value',1);
end


% --- Executes on button press in discretebutton.
function discretebutton_Callback(hObject, eventdata, handles)
% hObject    handle to discretebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of discretebutton
global T1; global T2;
global X1; global X2;
global F;
global Y;
if(get(hObject,'value') == get(hObject,'max'))
    set(handles.continuousbutton,'value',0);
    if(get(handles.timedomainbutton,'value') == get(handles.timedomainbutton,'max'))
        set(handles.freqdomainbutton,'value',0);
        cla;
        if(get(handles.opmenu,'value')==1 || BreakPoints <= 0)
                stem(T1,X1,'LineWidth',3);
        else
                stem(T2,X2,'LineWidth',3);
        end
    elseif(get(handles.freqdomainbutton,'value') == get(handles.freqdomainbutton,'max'))
        set(handles.timedomainbutton,'value',0);
        cla;
        stem(F,Y,'LineWidth',3);
    end
else
    set(hObject,'value',1);
end


% --- Executes on button press in timedomainbutton.
function timedomainbutton_Callback(hObject, eventdata, handles)
% hObject    handle to timedomainbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of timedomainbutton
global T1; %global T2; global T3; global T4; global T5;
global X1; %global X2; global X3; global X4; global X5;
if(get(hObject,'value') == get(hObject,'max'))
    set(handles.freqdomainbutton,'value',0);
    if(get(handles.continuousbutton,'value') == get(handles.continuousbutton,'max'))
        set(handles.discretebutton,'value',0);
        cla;
        plot(T1,X1,'LineWidth',3);
    elseif(get(handles.discretebutton,'value') == get(handles.discretebutton,'max'))
        set(handles.continuousbutton,'value',0);
        cla;
        stem(T1,X1,'LineWidth',3);
    end
else
    set(hObject,'value',1);
end


% --- Executes on button press in freqdomainbutton.
function freqdomainbutton_Callback(hObject, eventdata, handles)
% hObject    handle to freqdomainbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of freqdomainbutton
global F;
global Y;
if(get(hObject,'value') == get(hObject,'max'))
    set(handles.timedomainbutton,'value',0);
    if(get(handles.continuousbutton,'value') == get(handles.continuousbutton,'max'))
        set(handles.discretebutton,'value',0);
        cla;
        plot(F,Y,'LineWidth',3);
    elseif(get(handles.discretebutton,'value') == get(handles.discretebutton,'max'))
        set(handles.continuousbutton,'value',0);
        cla;
        stem(F,Y,'LineWidth',3);
    end
else
    set(hObject,'value',1);
end

function clear()
global T1; global T2;
global X1; global X2;
T1 = []; T2 = [];
X1 = []; X2 = [];
global F;
F = [];
global Y;
Y = [];
cla;

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear();
set(handles.setbutton,'Enable','on');
set(handles.brkpn,'Enable','on');
set(handles.opmenu,'Enable','on');
set(handles.addFunction,'Enable','off');

% --- Executes on button press in setbutton.
function setbutton_Callback(hObject, eventdata, handles)
% hObject    handle to setbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.opmenu,'value')==1)
clear();
else
    global T1;
    if(isempty(T1))
        warndlg('Cannot perform operation. Please provide a base function.');
        return;
    end
end
global BreakPoints;
BreakPoints = str2num(get(handles.brkpn,'string'));
set(handles.setbutton,'Enable','off');
set(handles.brkpn,'Enable','off');
set(handles.addFunction,'Enable','on');
set(handles.opmenu,'Enable','off');
set(handles.initTime,'string',0);

% --- Executes on selection change in opmenu.
function opmenu_Callback(hObject, eventdata, handles)
% hObject    handle to opmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns opmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from opmenu


% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%                                                    Auto generated Code
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

function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function initTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function finTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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


function brkpn_Callback(hObject, eventdata, handles)
% hObject    handle to brkpn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of brkpn as text
%        str2double(get(hObject,'String')) returns contents of brkpn as a double


% --- Executes during object creation, after setting all properties.
function brkpn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brkpn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function opmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to opmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
