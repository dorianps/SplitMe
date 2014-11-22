
global i filelist api0 api20 api40 api60 api80 api100 fototemp figcompare mainfig temp0 temp20 temp40 temp60 temp80 temp100 slider shift20 shift40 shift60 shift80 shift100 kot0 kot20 kot40 kot60 kot80 kot100 kotupdate fcn fcn100  label0size label20size label40size label60size label80size label100size fajresize jpgdir figbig savedir;
fajresize = [480 640];
jpgdir = [pwd '\source\'];
savedir = [pwd '\target\'];
iptsetpref('ImshowBorder','tight');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% start loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% set i if not set before
if (i >= 0) i = i + 1
else i = 1
end;

%% get file list if not present in workspace
if (isstruct(filelist) ~= 1) filelist = dir([jpgdir '*.jpg']); end;

%% if there is a already a splitted dir with that name terminate script
if isdir([savedir filelist(i).name])
	disp(['There is already a directory with name: "' filelist(i).name '"']);
	disp(['in: ---> ' savedir]);
	disp(' ');
	error('Script stopped automatically');
	return;
end;

%%% delete percent figure preview if left open
if ishandle(figbig) delete(figbig); end;


%%% read i-th file
fototemp = imread([jpgdir filelist(i).name ]);
%% convert to grey
fototemp = rgb2gray(fototemp);
%% adjust contrast automatically (can see range with stretchlim(fototemp) )
fototemp = imadjust(fototemp);
%% create mainfig
mainfig = figure('MenuBar','none', 'Name',['Select where to cut...     ---    ' filelist(i).name], 'Toolbar','none',...
	'NumberTitle','off', 'Renderer', 'painters', 'Position', [3 317 572 456]);, imshow(fototemp);
set(mainfig,'Color',[0,0,0]);
%% get properties of fototemp
tempinfo = whos('fototemp');

%% calculate rectangle width
rectwidth = tempinfo.size(2) / 2;
rectwidth = fix(rectwidth);

rectheight = (rectwidth * 3) / 4; %%% create format 4:3 of the rectangle

%%% if rectheight to high recalculate both for actual height
if (rectheight > tempinfo.size(1))
	rectheight = tempinfo.size(1);
	rectwidth = (rectheight * 4) / 3;
	rectwidth = fix(rectwidth);
end;

%% coordinates to place rectangles
ypos = (tempinfo.size(1) - rectheight) / 2; %% position y calculated from total height minus rectheight dividing 2
ypos = fix(ypos);  %% round it
xpos = 1;

shift20 = rectwidth / 5; % every shift is 1/5 of rectangle width
%shift20 = fix(shift20); %round the basic shift used by all others
shift40 = shift20 * 2; 
shift60 = shift20 * 3;
shift80 = shift20 * 4;
shift100 = shift20 * 5;


%%% draw rectangles with first at the end to have it visible
h20 = imrect(gca, [shift20 ypos rectwidth rectheight]); %%% create rectangles with calculated positions and dimensions
h40 = imrect(gca, [shift40 ypos rectwidth rectheight]);
h60 = imrect(gca, [shift60 ypos rectwidth rectheight]);
h80 = imrect(gca, [shift80 ypos rectwidth rectheight]);
h100 = imrect(gca, [shift100 ypos rectwidth rectheight]);
h = imrect(gca, [xpos ypos rectwidth rectheight]); %%% create rectangle to drag


api0 = iptgetapi(h); %%% get api from all rectangles
api20 = iptgetapi(h20);
api40 = iptgetapi(h40);
api60 = iptgetapi(h60);
api80 = iptgetapi(h80);
api100 = iptgetapi(h100);
api0.setColor([1 0 0]);
api20.setColor([.2 .2 .2]);
api40.setColor([.4 .4 .4]);
api60.setColor([.6 .6 .6]);
api80.setColor([.8 .8 .8]);
api100.setColor([1 1 0]);


%% calculate and set contrains for rectangles for not going out
xconstrain0 = [0.5 tempinfo.size(2)-rectwidth];
xconstrain100 = [rectwidth tempinfo.size(2)];
yconstrain = [0.5 tempinfo.size(1)];

fcn = makeConstrainToRectFcn('imrect',...
                 xconstrain0, yconstrain);
fcn100 = makeConstrainToRectFcn('imrect',...
                 xconstrain100, yconstrain);

api0.setDragConstraintFcn(fcn);
api100.setDragConstraintFcn(fcn100);


%% callbacks for moving rects together and update figcompare
kot20 = api0.addNewPositionCallback(@(p) api20.setPosition(api0.getPosition() + [shift20 0 0 0]));
kot40 = api20.addNewPositionCallback(@(p) api40.setPosition(api20.getPosition() + [shift20 0 0 0]));
kot60 = api40.addNewPositionCallback(@(p) api60.setPosition(api40.getPosition() + [shift20 0 0 0]));
kot80 = api60.addNewPositionCallback(@(p) api80.setPosition(api60.getPosition() + [shift20 0 0 0]));
kot100 = api80.addNewPositionCallback(@(p) api100.setPosition(api80.getPosition() + [shift20 0 0 0]));
kot0 = api100.addNewPositionCallback(@(p) api0.setPosition(api100.getPosition() - [shift100 0 0 0]));
kotupdate = api0.addNewPositionCallback(@(p) imcompare);




pos0 = api0.getPosition();
pos20 = api20.getPosition();
pos40 = api40.getPosition();
pos60 = api60.getPosition();
pos80 = api80.getPosition();
pos100 = api100.getPosition();

temp0 = imcrop(fototemp, pos0);
temp20 = imcrop(fototemp, pos20);
temp40 = imcrop(fototemp, pos40);
temp60 = imcrop(fototemp, pos60);
temp80 = imcrop(fototemp, pos80);
temp100 = imcrop(fototemp, pos100);

%% add accept button
set(mainfig, 'DefaultUicontrolFontSize', 20);
accept = uicontrol('Style', 'pushbutton', 'String', 'Accept',...
	'Position', [150 570 260 50], 'Callback', 'cutok');
%% add skip button
set(mainfig, 'DefaultUicontrolFontSize', 12);
skipbut = uicontrol('Style', 'pushbutton', 'String', 'Skip',...
	'Position', [500 575 80 40], 'Callback', 'skip');

%% add slider and text over it
slider = uicontrol('Style','slider','value',rectwidth,'Min',rectwidth/2,'Max',rectwidth, 'SliderStep',[0.01 0.1], 'Position', [110 7 360 20], 'callback','global shift20, updaterect');
set(mainfig, 'DefaultUicontrolBackgroundColor', [0 0 0]);
set(mainfig, 'DefaultUicontrolForegroundColor', [1 .7 .2]);
set(mainfig, 'DefaultUicontrolFontSize', 12);
set(mainfig, 'DefaultUicontrolFontWeight', 'normal');
uicontrol(mainfig, 'Style', 'text', 'String', 'Window Size:', 'Position', [110 25 360 26]);


%% add done and remaining labels
set(mainfig, 'DefaultUicontrolFontSize', 12);
set(mainfig, 'DefaultUicontrolFontWeight', 'bold');
temp = num2str(size(dir([savedir '*.jpg']),1) - 0);
total = uicontrol(mainfig, 'Style', 'text', 'String', ['Total Splitted: ' temp], 'Position', [90 55 160 26]);
temp = num2str(size(dir([jpgdir '*.jpg']),1)-1);
remain = uicontrol(mainfig, 'Style', 'text', 'String', ['Folder remain: ' temp], 'Position', [320 55 160 26]);





%% start creating the 6 figure comparison window
figcompare = figure('MenuBar','none', 'Name','Image Compare Tool by Dorian',...
	'Toolbar','none', 'NumberTitle','off', 'Renderer', 'painters','Position', [601 -15 736 868]);
set(gcf,'Color',[0,0,0]);

%% add yellow labels
set(figcompare, 'DefaultUicontrolBackgroundColor', [0 0 0]);
set(figcompare, 'DefaultUicontrolForegroundColor', [.8 .8 0]);
set(figcompare, 'DefaultUicontrolFontSize', 12);
set(figcompare, 'DefaultUicontrolFontWeight', 'bold');
label0 = uicontrol(figcompare, 'Style', 'text', 'String', '0%', 'Position', [40 680 45 40]);
label20 = uicontrol(figcompare, 'Style', 'text', 'String', '20%', 'Position', [365 680 45 40]);
label40 = uicontrol(figcompare, 'Style', 'text', 'String', '40%', 'Position', [40 420 45 40]);
label60 = uicontrol(figcompare, 'Style', 'text', 'String', '60%', 'Position', [365 420 45 40]);
label80 = uicontrol(figcompare, 'Style', 'text', 'String', '80%', 'Position', [40 150 45 40]);
label100 = uicontrol(figcompare, 'Style', 'text', 'String', '100%', 'Position', [365 150 45 40]);

%% add sizes labels
set(figcompare, 'DefaultUicontrolForegroundColor', [.7 .7 .7]);
set(figcompare, 'DefaultUicontrolFontSize', 11);
set(figcompare, 'DefaultUicontrolFontWeight', 'normal');

[m,n] = size(temp0);
label0size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(n) ' x ' num2str(m)], 'Position', [170 590 100 20]);
if (n < 1024) set(label0size, 'BackgroundColor', [.8,.2,0]); end;
[m,n] = size(temp20);
label20size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(n) ' x ' num2str(m)], 'Position', [500 590 100 20]);
if (n < 1024) set(label20size, 'BackgroundColor', [.8,.2,0]); end;
[m,n] = size(temp40);
label40size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(n) ' x ' num2str(m)], 'Position', [170 330 100 20]);
if (n < 1024) set(label40size, 'BackgroundColor', [.8,.2,0]); end;
[m,n] = size(temp60);
label60size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(n) ' x ' num2str(m)], 'Position', [500 330 100 20]);
if (n < 1024) set(label60size, 'BackgroundColor', [.8,.2,0]); end;
[m,n] = size(temp80);
label80size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(n) ' x ' num2str(m)], 'Position', [170 290 100 20]);
if (n < 1024) set(label80size, 'BackgroundColor', [.8,.2,0]); end;
[m,n] = size(temp100);
label100size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(n) ' x ' num2str(m)], 'Position', [500 290 100 20]);
if (n < 1024) set(label100size, 'BackgroundColor', [.8,.2,0]); end;


%% create tempfun and add 'view' buttons
iptsetpref('ImshowInitialMagnification', 100);

tempfun = @(x) imresize(x,fajresize, 'bicubic', 30);

view0 = uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [170 570 100 20], 'Callback', 'disable, global temp0, temp=imadjust(temp0); temp = tempfun(temp0);, preview = 0;, tempfig;' );
view20 = uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [500 570 100 20], 'Callback', 'disable, global temp20, temp=imadjust(temp20); temp = tempfun(temp20);, preview = 20;, tempfig;' );
view40 = uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [80 330 80 20], 'Callback', 'disable, global temp40, temp=imadjust(temp40); temp = tempfun(temp40);, preview = 40;, tempfig;' );
view60 = uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [420 330 80 20], 'Callback', 'disable, global temp60, temp=imadjust(temp60); temp = tempfun(temp60);, preview = 60;, tempfig;' );
view80 = uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [80 290 80 20], 'Callback', 'disable, global temp80, temp=imadjust(temp80); temp = tempfun(temp80);, preview = 80;, tempfig;');
view100 = uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [420 290 80 20], 'Callback', 'disable, global temp100, temp=imadjust(temp100); temp = tempfun(temp100);, preview = 100;, tempfig;' );


%% subplot the 6 images
iptsetpref('ImshowInitialMagnification', 'fit');
subplot(3,2,1), imshow(temp0);
subplot(3,2,2), imshow(temp20);
subplot(3,2,3), imshow(temp40);
subplot(3,2,4), imshow(temp60);
subplot(3,2,5), imshow(temp80);
subplot(3,2,6), imshow(temp100);

%%% refesh button (when positions are wrong)
set(mainfig, 'DefaultUicontrolFontSize', 16);
uicontrol('Style', 'pushbutton', 'String', 'REFRESH',...
	'Position', [300 0 260 50], 'Callback', 'refreshfigcompare');


%% update all positions at the end
set(figcompare, 'Position', [601 -15 736 868]);
set(mainfig, 'Position', [3 117 592 656]);
figure(mainfig);
set(figcompare, 'Position', [601 -15 736 868]);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%