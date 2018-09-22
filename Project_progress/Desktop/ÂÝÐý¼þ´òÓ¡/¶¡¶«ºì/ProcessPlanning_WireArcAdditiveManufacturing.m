function varargout = ProcessPlanning_WireArcAdditiveManufacturing(varargin)
% PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING MATLAB code for ProcessPlanning_WireArcAdditiveManufacturing.fig
%      PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING, by itself, creates a new PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING or raises the existing
%      singleton*.
%
%      H = PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING returns the handle to a new PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING or the handle to
%      the existing singleton*.
%
%      PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING.M with the given input arguments.
%
%      PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING('Property','Value',...) creates a new PROCESSPLANNING_WIREARCADDITIVEMANUFACTURING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProcessPlanning_WireArcAdditiveManufacturing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProcessPlanning_WireArcAdditiveManufacturing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProcessPlanning_WireArcAdditiveManufacturing

% Last Modified by GUIDE v2.5 18-May-2016 09:28:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProcessPlanning_WireArcAdditiveManufacturing_OpeningFcn, ...
                   'gui_OutputFcn',  @ProcessPlanning_WireArcAdditiveManufacturing_OutputFcn, ...
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


% --- Executes just before ProcessPlanning_WireArcAdditiveManufacturing is made visible.
function ProcessPlanning_WireArcAdditiveManufacturing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProcessPlanning_WireArcAdditiveManufacturing (see VARARGIN)

% Choose default command line output for ProcessPlanning_WireArcAdditiveManufacturing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow('Logo.gif')
% UIWAIT makes ProcessPlanning_WireArcAdditiveManufacturing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProcessPlanning_WireArcAdditiveManufacturing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in LoadSTLModel.
function LoadSTLModel_Callback(hObject, eventdata, handles)
% hObject    handle to LoadSTLModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
folderCurrent=pwd;
path=strcat(folderCurrent,'\STLFiles');
[fileName,pathName] = uigetfile({'*.stl'},'Select STL file','MultiSelect', 'on',path); % added UI
fid=fopen(strcat(pathName,fileName));
[fnum,vout, fv,fn] = ReadSTL(fid); % round off to 0.01
toc;
PlotSTLmodel( vout);% plot 3D STL model
handles.vout=vout;
handles.fnum=fnum;
handles.fv=fv;
handles.fn=fn;
guidata(hObject,handles);
disp 'LoadSTLmodel finished!';



function Layerthickness_Callback(hObject, eventdata, handles)
% hObject    handle to Layerthickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Layerthickness as text
%        str2double(get(hObject,'String')) returns contents of Layerthickness as a double


% --- Executes during object creation, after setting all properties.
function Layerthickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layerthickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TwoDslicing.
function TwoDslicing_Callback(hObject, eventdata, handles)
% hObject    handle to TwoDslicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
LayerThickness=str2num(get(handles.Layerthickness,'string'));
fnum=handles.fnum;
vout=handles.vout;
fv=[];
for i=1:fnum
    fv(i,:)=[vout(3*(i-1)+1,:) vout(3*(i-1)+2,:) vout(3*(i-1)+3,:)];
end
Layers={};
% compute the bottom and top of the model (vout)
bottom=min(vout(:,3));top=max(vout(:,3));
global REL_TOL;
global ABS_TOL;
global DEBUG;
DEBUG=false;
REL_TOL=1e-5;
ABS_TOL=REL_TOL*(top-bottom);
numberLayers=ceil((top-bottom)/LayerThickness);
SliceHeight=zeros;
scale=0.5;
for Layer=1:numberLayers
    SliceHeight(Layer)=bottom+(Layer-1)*LayerThickness;
    [segments]=GetIntersectingLines(fnum,fv,SliceHeight(Layer));% get the intersecting line segments with the slicing plane
    %disp(['Layer','=',num2str(Layer),' ','GetIntersectingLines']);
    %segments=segments*scale;
    [Contours] = FormContours( segments );% generate Contours from the interseting line segments
    %disp(['Layer','=',num2str(Layer),' ','FormContours']);
    [Contours]=SimplifyContours(Contours);% simplification: if connected lines have the same direction, emerge
    [Contours]=GradContours(Contours);% left domin rule
    %disp(['Layer','=',num2str(Layer),' ','GradContours']);
    [Layers]=LayerContour(Contours,Layer,Layers);
    disp(['Layer','=',num2str(Layer),' ','Finished!']);    
end
toc;
%[Layers]=ContourPath(Layers,SliceHeight,Layerthickness);
[Layers]=PlotLayers(Layers,SliceHeight);
%[Layers]=SaveLayer(Layers,Layerthickness);
handles.Layers=Layers;
handles.SliceHeight=SliceHeight;
guidata(hObject,handles);
disp 'Slicing finished!';



% --- Executes on button press in ThreeDslicing.
function ThreeDslicing_Callback(hObject, eventdata, handles)
% hObject    handle to ThreeDslicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function OffsetDi_Callback(hObject, eventdata, handles)
% hObject    handle to OffsetDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OffsetDistance as text
%        str2double(get(hObject,'String')) returns contents of OffsetDistance as a double


% --- Executes during object creation, after setting all properties.
function OffsetDi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OffsetDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RasterPath.
function RasterPath_Callback(hObject, eventdata, handles)
% hObject    handle to RasterPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OffsetD=str2num(get(handles.OffsetDi,'string'));
Layers=handles.Layers;
CurrentLayer=Layers{1,1};



% --- Executes on button press in ContourPath.
function ContourPath_Callback(hObject, eventdata, handles)
% hObject    handle to ContourPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Layers=handles.Layers;
SliceHeight=handles.SliceHeight;
LayerThickness=str2num(get(handles.Layerthickness,'string'));
[PathLength]=ContourPath(Layers,SliceHeight,LayerThickness)


% --- Executes on button press in MATPath.
function MATPath_Callback(hObject, eventdata, handles)
% hObject    handle to MATPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OffsetDistance=str2num(get(handles.OffsetDistance,'string'));
Layers=handles.Layers;
ic=0;
for i=1:size(Layers,2)
    if isempty(Layers{1,i})==0
        ic=ic+1;
        CurrentContours{ic,1}=Layers{1,i};
    end
end
% line segments [2 startx starty endx endy 1(left domin) 0 0 0]
[Contours]=RegularContours(CurrentContours);
[medialCurves]=MAT(Contours);% generate medialCurves 
% Modified medialCurves: 1)Bezier Curves -----> line segments
                       % 2) eliminate marginal curves
[medialLines]=BezierToLine(medialCurves,Contours);
[medialLines]=PlotmedialLines(medialLines,Contours);
% classification of mediaLines Types: simple (one branch) 
% or complex(multi-branches and possible holes)
[branches]=ClassifyMedialLines(medialLines,Contours);
% construct topological information between contours and branches
[branches Contours]=TopologyBranchesContours(branches,Contours);
%[branches]=PlotBranches(branches);    %plot branches
%for VariedD=4:12
CurrentOffset=OffsetDistance;%*VariedD;
%CurrentOffset=VariedD;
% get UntrimmedPath{}
[ UntrimmedPath UntrimmedPathBoundaries ] = GetUntrimmedPaths( Contours,branches,CurrentOffset );
%[ Path ]=PlotPath(UntrimmedPath,Contours,medialLines);
%[ Path ]=PlotPathBoundary(UntrimmedPathBoundaries)
% trim UntrimmedPath & UntrimmedPathBoundaries
[TrimmedPaths]=TrimPathandBoundaries(UntrimmedPath,UntrimmedPathBoundaries,Contours,CurrentOffset,medialLines);
[ Path ]=PlotPath(TrimmedPaths,Contours,[]);
matPaths={};
for i=1:3
    for j=1:size(TrimmedPaths{1,i},1)
        matPaths{1,i}(j,:)=[TrimmedPaths{1,i}(j,2:5) norm([TrimmedPaths{1,i}(j,2)-TrimmedPaths{1,i}(j,4) TrimmedPaths{1,i}(j,3)-TrimmedPaths{1,i}(j,5)])];
    end
end
[matPaths]=SaveLayer(matPaths,CurrentOffset);
[MaterialEfficiency]=ComputeMaterialEfficiency(TrimmedPaths,Contours,CurrentOffset);
%MaterEff(VariedD,:)=[MaterialEfficiency]
%end

disp 'MATPath finished!'


function OffsetDistance_Callback(hObject, eventdata, handles)
% hObject    handle to OffsetDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OffsetDistance as text
%        str2double(get(hObject,'String')) returns contents of OffsetDistance as a double


% --- Executes during object creation, after setting all properties.
function OffsetDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OffsetDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Robot_Code_Transformation.
function Robot_Code_Transformation_Callback(hObject, eventdata, handles)
% hObject    handle to Robot_Code_Transformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Layers=handles.Layers;
SliceHeight=handles.SliceHeight;
PathZ=SliceHeight;
[Layers]=DepositionDirectionChange(Layers);
[Layers]=EndPortionComplement(Layers);
[ Layers StartSegments] = StartPortionComplement( Layers );
[RobotT]=RobotCodeTransformation(Layers,PathZ,StartSegments);


% --- Executes on button press in RotateX.
function RotateX_Callback(hObject, eventdata, handles)
% hObject    handle to RotateX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
vout=handles.vout;
fn=handles.fn;
Degree=str2num(get(handles.RotateDegree,'string'));
RoX=[1 0                   0;
     0 cos(Degree*pi/180)  sin(Degree*pi/180);
     0 -sin(Degree*pi/180) cos(Degree*pi/180)];
vout=vout*RoX;
PlotSTLmodel( vout);
handles.vout=vout;
guidata(hObject,handles);
disp 'Rotation finished!';toc; 

% --- Executes on button press in RotateY.
function RotateY_Callback(hObject, eventdata, handles)
% hObject    handle to RotateY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
vout=handles.vout;
fn=handles.fn;
Degree=str2num(get(handles.RotateDegree,'string'));
RoY=[cos(Degree*pi/180) 0  -sin(Degree*pi/180);
     0                  1  0;
     sin(Degree*pi/180) 0  cos(Degree*pi/180)];
vout=vout*RoY;
%PlotSTLmodel( vout);
handles.vout=vout;
guidata(hObject,handles);
disp 'Rotation finished!';toc; 

% --- Executes on button press in RotateZ.
function RotateZ_Callback(hObject, eventdata, handles)
% hObject    handle to RotateZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
vout=handles.vout;
fn=handles.fn;
Degree=str2num(get(handles.RotateDegree,'string'));
RoZ=[cos(Degree*pi/180)  sin(Degree*pi/180)   0;
     -sin(Degree*pi/180) cos(Degree*pi/180)   0;
     0                   0                    1];
vout=vout*RoZ;
PlotSTLmodel( vout);
handles.vout=vout;
guidata(hObject,handles);
disp 'Rotation finished!';toc; 

% --- Executes on button press in AutoOrentation.
function AutoOrentation_Callback(hObject, eventdata, handles)
% hObject    handle to AutoOrentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function RotateDegree_Callback(hObject, eventdata, handles)
% hObject    handle to RotateDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RotateDegree as text
%        str2double(get(hObject,'String')) returns contents of RotateDegree as a double


% --- Executes during object creation, after setting all properties.
function RotateDegree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RotateDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
