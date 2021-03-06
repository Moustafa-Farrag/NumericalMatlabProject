function varargout = ProjectGui2(varargin)
% PROJECTGUI2 MATLAB code for ProjectGui2.fig
%      PROJECTGUI2, by itself, creates a new PROJECTGUI2 or raises the existing
%      singleton*.
%
%      H = PROJECTGUI2 returns the handle to a new PROJECTGUI2 or the handle to
%      the existing singleton*.
%
%      PROJECTGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTGUI2.M with the given input arguments.
%
%      PROJECTGUI2('Property','Value',...) creates a new PROJECTGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectGui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectGui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectGui2

% Last Modified by GUIDE v2.5 14-May-2019 09:59:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectGui2_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectGui2_OutputFcn, ...
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
end


% --- Executes just before ProjectGui2 is made visible.
function ProjectGui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectGui2 (see VARARGIN)

% Choose default command line output for ProjectGui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectGui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = ProjectGui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

    contents = get(handles.popupmenu1,'String'); 
    popupmenu4value = contents{get(handles.popupmenu1,'Value')};
    
    switch popupmenu4value
    case 'Gaussian-elimination'
        set(handles.edit2,'visible', 'off');
        set(handles.text4,'visible', 'off');
        set(handles.edit3,'visible', 'off');
        set(handles.text5,'visible', 'off');
        state = false;
        handles.state = state;
        guidata(hObject,handles);
    case 'LU decomposition'
        set(handles.edit2,'visible', 'off');
        set(handles.text4,'visible', 'off');
        set(handles.edit3,'visible', 'off');
        set(handles.text5,'visible', 'off');
        state = false;
        handles.state = state;
        guidata(hObject,handles);
    case 'Gaussian-Jordan'
        set(handles.edit2,'visible', 'off');
        set(handles.text4,'visible', 'off');
        set(handles.edit3,'visible', 'off');
        set(handles.text5,'visible', 'off');
        state = false;
        handles.state = state;
        guidata(hObject,handles);
    case 'Gauss-Seidel'
        set(handles.edit2,'visible', 'on');
        set(handles.text4,'visible', 'on');
        set(handles.edit3,'visible', 'on');
        set(handles.text5,'visible', 'on');
        state = true;
        handles.state = state;
        guidata(hObject,handles);
    end

end

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

        state = false;
        handles.state = state;
        guidata(hObject,handles);


end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt'},'File Selector');
if ~ischar(filename)
    return;  % User aborted the file selection
end
file = fullfile(pathname, filename);
[fid, msg] = fopen(file, 'r');
if fid == -1
    error(msg);
end
allData = textscan(fid,'%s','Delimiter','\n');
fclose(fid);
len = size(allData{1});

if len(1) == 4 || len(1) == 3
    numOfEqu = allData{1}{1};
    method = allData{1}{2};
    e = allData{1}{3};
    max = 50;
    epsilon  =  0.00001;
    state = false;
    checker = 0;
    
    if  len(1) == 4
       i = allData{1}{4};
       state = true;
    end
    if all(ismember(numOfEqu, '0123456789'))
        num = str2num(numOfEqu);
        checker = checker + 1;
    else 
        warndlg('Check the format of the number of the equations again','Warning');
    end
    
    if checker == 1
    equChecker = true;
    funStr = strsplit(e,',');
    disp(numel(funStr));
    disp(num);
    if numel(funStr) == num
        equChecker = true;
    else 
        warndlg('Number of equations are not the same with equations','Warning');
        equChecker = false;
    end
    
    if equChecker == true
    parameters = e;
    parameters = parameters(isstrprop(e,'alpha'));
    parameter = unique(parameters,'stable');
    len = length(parameter);
    
    if len == num
        equChecker = true;
    else
       warndlg('Numbers of variables does not match number of the equations','Warning'); 
       equChecker = false;
    end
    
    if equChecker == true
        for j = 1:num
            equ(j) = sym(funStr{j});
        end
        checker = checker + 1;
    end
    end
    end
    
     if checker == 2
    if state == true
        disp(i);
    if isempty(i)
            warndlg('Field of intervals must be filled','Warning');
    else
              intervals = strsplit(i,' ');
              
              if numel(intervals) == num
                  for k = 1:num
                      if ~(isempty(intervals{k})) && all(ismember(intervals{k}, '0123456789+-.eEdD'))
                      interval(k) = str2num(intervals{k});
                      end
                  end
              else
                  warndlg('Initial guesses must be equal to number of equations','Warning');
              end
    end
     if numel(interval) == num
         checker = checker + 2;
     else 
         warndlg('Check the format of the intervals again','Warning');
     end
    end
    end
    
    if (checker == 4 && state == true) || (checker == 2 && state == false)
    
    switch method
    case 'Gaussian-elimination'
        
    case 'LU decomposition'
        warndlg('LU decomposition','Warning');
    case 'Gaussian-Jordan'
        warndlg('Gaussian-Jordan','Warning');
    case 'Gauss-Seidel'
        warndlg('Gauss-Seidel','Warning');
    end
    end
else 
    warndlg('Missing data','Warning');
end

end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

numOfEqu = get(handles.edit4,'String');
e = get(handles.edit1,'String');
max = get(handles.edit3,'String');
i = get(handles.edit2,'String');
disp(i);
state = handles.state;
checker = 0;

if isempty(numOfEqu) || isempty(e)
    warndlg('All fields must be filled','Warning');
else
    if all(ismember(numOfEqu, '0123456789'))
        num = str2num(numOfEqu);
        checker = checker + 1;
    else 
        warndlg('Check the format of the number of the equations again','Warning');
    end
    
    if checker == 1
    equChecker = true;
    funStr = strsplit(e,',');
    disp(numel(funStr));
    disp(num);
    if numel(funStr) == num
        equChecker = true;
    else 
        warndlg('Number of equations are not the same with equations','Warning');
        equChecker = false;
    end
    
    if equChecker == true
    parameters = e;
    parameters = parameters(isstrprop(e,'alpha'));
    parameter = unique(parameters,'stable');
    len = length(parameter);
    
    if len == num
        equChecker = true;
    else
       warndlg('Numbers of variables does not match number of the equations','Warning'); 
       equChecker = false;
    end
    
    if equChecker == true
        for j = 1:num
            equ(j) = sym(funStr{j});
        end
        [A, b] = equationsToMatrix(equ);
        checker = checker + 1;
    end
    end
    end
    
    if state == true
    if isempty(max)
        checker = checker + 1;
        req = 50;
        epsilon  =  0.00001; 
    else
    if checker == 2
    if all(ismember(max, '0123456789+-.eEdD'))
        req = str2num(max);
        if floor(req)==req
            epsilon = 0.00001;
        else 
             req = 50;
        end
        checker = checker + 1;
    else 
        warndlg('Enter Max number of iterations or Epsilon in correct format','Warning');
    end   
    end
    end
    end
    
    if checker == 3
    if state == true
        disp(i);
    if isempty(i)
            warndlg('Field of intervals must be filled','Warning');
    else
              intervals = strsplit(i,' ');
              
              if numel(intervals) == num
                  for k = 1:num
                      if ~(isempty(intervals{k})) && all(ismember(intervals{k}, '0123456789+-.eEdD'))
                      interval(k) = str2num(intervals{k});
                      end
                  end
              else
                  warndlg('Initial guesses must be equal to number of equations','Warning');
              end
    end
     if numel(interval) == num
         checker = checker + 2;
     else 
         warndlg('Check the format of the intervals again','Warning');
     end
    end
    end
    
    if (checker == 5 && state == true) || (checker == 2 && state == false) 
    contents = get(handles.popupmenu1,'String'); 
    popupmenu4value = contents{get(handles.popupmenu1,'Value')};
    
    switch popupmenu4value
    case 'Gaussian-elimination'
        
        set(handles.uitable1, 'Data', {}, 'RowName', {});
        set(handles.uitable1,'visible', 'off');
        
        set(handles.text8,'visible', 'off');
        
        [c, Result] = Gauss(A , b);
        
        C = cell(1);
        counter = 1;
        
        len = size(c);
        
        for i = 1 : len(1)
            if mod(i,num) == 1
                C{i} = num2str(counter);
                counter = counter + 1;
            else
                C{i} = '    ';
            end
        end
        
        k = num2cell(parameter);
        set(handles.uitable1,'visible', 'on');
        set(handles.uitable1,'Data', c, 'RowName', C, 'ColumnName', k);
        
        text_to_display = cellstr(num2str(Result));
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', text_to_display, 'Max', 2, 'FontName', 'courier');
        
    case 'LU decomposition'
        warndlg('LU decomposition','Warning');
    case 'Gaussian-Jordan'
        
        set(handles.uitable1, 'Data', {}, 'RowName', {});
        set(handles.uitable1,'visible', 'off');
        
        set(handles.text8,'visible', 'off');
        
        [ c , Result ] = GaussJordan(A , b );
        
        C = cell(1);
        counter = 1;
        
        len = size(c);
        
        for i = 1 : len(1)
            if mod(i,num) == 1
                disp(i);
                C{i} = num2str(counter);
                counter = counter + 1;
            else
                C{i} = '    ';
            end
        end
        k = num2cell(parameter);
        set(handles.uitable1,'visible', 'on');
        set(handles.uitable1,'Data', c, 'RowName', C, 'ColumnName', k);
        
        text_to_display = cellstr(num2str(Result));
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', text_to_display, 'Max', 2, 'FontName', 'courier');
        
    case 'Gauss-Seidel'
        
        set(handles.uitable1, 'Data', {}, 'RowName', {});
        set(handles.uitable1,'visible', 'off');
        
        set(handles.text8,'visible', 'off');
        
        [result,error,iter] = GaussSeidel(A,b,epsilon,req,interval);
        
        f = num2cell(result); 
        m = num2cell(error);
        
        j = [f ; m];
        
        len = size(result);
        
        c = cell(1);
        
        for i = 1 : len(1) * 2
            if i == 1
               c{i} = 'Values'; 
            elseif i == 51
               c{i} = 'Errors'; 
            else
                c{i} = '  ';
            end
         end
        
        k = num2cell(parameter);
        set(handles.uitable1,'visible', 'on');
        set(handles.uitable1,'Data', j, 'ColumnName', k, 'RowName', c); 
    end
    end
    
    
end
    
end




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

numOfEqu = get(handles.edit4,'String');
e = get(handles.edit1,'String');
max = get(handles.edit3,'String');
i = get(handles.edit2,'String');
disp(i);
state = handles.state;
checker = 0;

if isempty(numOfEqu) || isempty(e)
    warndlg('All fields must be filled','Warning');
else
    if all(ismember(numOfEqu, '0123456789'))
        num = str2num(numOfEqu);
        checker = checker + 1;
    else 
        warndlg('Check the format of the number of the equations again','Warning');
    end
    
    if checker == 1
    equChecker = true;
    funStr = strsplit(e,',');
    disp(numel(funStr));
    disp(num);
    if numel(funStr) == num
        equChecker = true;
    else 
        warndlg('Number of equations are not the same with equations','Warning');
        equChecker = false;
    end
    
    if equChecker == true
    parameters = e;
    parameters = parameters(isstrprop(e,'alpha'));
    parameter = unique(parameters,'stable');
    len = length(parameter);
    
    if len == num
        equChecker = true;
    else
       warndlg('Numbers of variables does not match number of the equations','Warning'); 
       equChecker = false;
    end
    
    if equChecker == true
        for j = 1:num
            equ(j) = sym(funStr{j});
        end
        [A, b] = equationsToMatrix(equ);
        checker = checker + 1;
    end
    end
    end
    
    if state == true
    if isempty(max)
        checker = checker + 1;
        req = 50;
        epsilon  =  0.00001; 
    else
    if checker == 2
    if all(ismember(max, '0123456789+-.eEdD'))
        req = str2num(max);
        if floor(req)==req
            epsilon = 0.00001;
        else 
             req = 50;
        end
        checker = checker + 1;
    else 
        warndlg('Enter Max number of iterations or Epsilon in correct format','Warning');
    end   
    end
    end
    end
    
    if checker == 3
    if state == true
    if isempty(i)
            warndlg('Field of intervals must be filled','Warning');
    else
              intervals = strsplit(i,' ');
              
              if numel(intervals) == num
                  for k = 1:num
                      if ~(isempty(intervals{k})) && all(ismember(intervals{k}, '0123456789+-.eEdD'))
                      interval(k) = str2num(intervals{k});
                      end
                  end
              else
                  warndlg('Initial guesses must be equal to number of equations','Warning');
              end
    end
     if numel(interval) == num
         checker = checker + 2;
     else 
         warndlg('Check the format of the intervals again','Warning');
     end
    end
    end
    
    if (checker == 5 && state == true) || (checker == 2 && state == false) 
        % Gaussian-elimination
        
        set(handles.uitable1, 'Data', {}, 'RowName', {});
        set(handles.uitable1,'visible', 'off');
        
        [c1, Result] = Gauss(A , b);
        
        C = cell(1);
        counter = 1;
        
        len1 = size(c1);
        
        for i = 1 : len1(1)
            if mod(i,num) == 1
                C{i} = strcat(num2str(counter), ' (Gaussian-elimination)');
                counter = counter + 1;
            else
                C{i} = '    ';
            end
        end
        
        % LU decomposition
        % Gaussian-Jordan
        
        [ c2 , Result ] = GaussJordan(A , b );
        
        counter = 1;
        
        len2 = size(c2);
        
        for i = len1(1) : len1(1) + len2(1)
            if mod(i,num) == 1
                disp(i);
                C{i} = strcat(num2str(counter), ' (Gaussian-Jordan)');
                counter = counter + 1;
            else
                C{i} = '    ';
            end
        end
        
        % Gauss-Seidel
        
        [result,error,iter] = GaussSeidel(A,b,epsilon,req,interval);
        
        f = num2cell(result); 
        m = num2cell(error);
        
        j = [f ; m];
        
        length1 = size(j);
        len4 = size(result);
        h = zeros();
        for i=1:length1(1)
            h(i,1) = 0;
        end
        j = [j , num2cell(h)];
        
        for i = len1(1) + len2(1) : (len1(1) + len2(1) + len4(1)) * 2
            if i == len1(1) + len2(1) + 1
               C{i} = 'Values (Gauss-Seidel)'; 
            elseif i == len1(1) + len2(1) + len4(1) + 1
               C{i} = 'Errors (Gauss-Seidel)'; 
            else
               C{i} = '  ';
            end
        end
        
        l = [c1 ; c2 ; j];
        
        k = num2cell(parameter);
        set(handles.uitable1,'visible', 'on');
        set(handles.uitable1,'Data', l, 'ColumnName', k, 'RowName', C); 
    end
    
    
end

end
