function varargout = GUI_TextCsc(varargin)
% GUI_TEXTCSC MATLAB code for GUI_TextCsc.fig
%      GUI_TEXTCSC, by itself, creates a new GUI_TEXTCSC or raises the existing
%      singleton*.
%
%      H = GUI_TEXTCSC returns the handle to a new GUI_TEXTCSC or the handle to
%      the existing singleton*.
%
%      GUI_TEXTCSC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEXTCSC.M with the given input arguments.
%
%      GUI_TEXTCSC('Property','Value',...) creates a new GUI_TEXTCSC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_TextCsc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_TextCsc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_TextCsc

% Last Modified by GUIDE v2.5 19-Mar-2015 02:38:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_TextCsc_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_TextCsc_OutputFcn, ...
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


% --- Executes just before GUI_TextCsc is made visible.
function GUI_TextCsc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_TextCsc (see VARARGIN)

% Choose default command line output for GUI_TextCsc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_TextCsc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_TextCsc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function beta_value_Callback(hObject, eventdata, handles)
% hObject    handle to beta_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of beta_value as text
%        str2double(get(hObject,'String')) returns contents of beta_value as a double


% --- Executes during object creation, after setting all properties.
function beta_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beta_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in accuracy_btn.
function accuracy_btn_Callback(hObject, eventdata, handles)
% hObject    handle to accuracy_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str=get(hObject,'beta_value');

accuracyCalculation(str);


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gui
