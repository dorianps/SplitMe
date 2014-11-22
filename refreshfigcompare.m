
delete(figcompare);
figcompare = figure('MenuBar','none', 'Name','Image Compare Tool by Dorian',...
	'Toolbar','none', 'NumberTitle','off', 'Renderer', 'painters','Position', [601 -15 736 868]);
set(gcf,'Color',[0,0,0]);

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

set(figcompare, 'DefaultUicontrolForegroundColor', [.7 .7 .7]);
set(figcompare, 'DefaultUicontrolFontSize', 11);
set(figcompare, 'DefaultUicontrolFontWeight', 'normal');

label0size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(pos0(3)) ' x ' num2str(pos0(4))], 'Position', [170 590 100 20]);
label20size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(pos20(3)) ' x ' num2str(pos20(4))], 'Position', [500 590 100 20]);
label40size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(pos40(3)) ' x ' num2str(pos40(4))], 'Position', [170 330 100 20]);
label60size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(pos60(3)) ' x ' num2str(pos60(4))], 'Position', [500 330 100 20]);
label80size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(pos80(3)) ' x ' num2str(pos80(4))], 'Position', [170 290 100 20]);
label100size = uicontrol(figcompare, 'Style', 'text', 'String', [num2str(pos100(3)) ' x ' num2str(pos100(4))], 'Position', [500 290 100 20]);


iptsetpref('ImshowInitialMagnification', 100);

tempfun = @(x) imresize(x,[480 640], 'bicubic', 30);

uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [170 570 100 20], 'Callback', 'global temp0, temp = tempfun(temp0);, figbig = figure;, imshow(temp);, truesize(figbig)' );
uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [500 570 100 20], 'Callback', 'global temp20, temp = tempfun(temp20);, figbig = figure;, imshow(temp);, truesize(figbig)' );
uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [80 330 80 20], 'Callback', 'global temp40, temp = tempfun(temp40);, figbig = figure;, imshow(temp);, truesize(figbig)' );
uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [420 330 80 20], 'Callback', 'global temp60, temp = tempfun(temp60);, figbig = figure;, imshow(temp);, truesize(figbig)' );
uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [80 290 80 20], 'Callback', 'global temp80, temp = tempfun(temp80);, figbig = figure;, imshow(temp);, truesize(figbig)');
uicontrol('Style', 'pushbutton', 'String', 'view',...
	'Position', [420 290 80 20], 'Callback', 'global temp100, temp = tempfun(temp100);, figbig = figure;, imshow(temp);, truesize(figbig)' );

iptsetpref('ImshowInitialMagnification', 'fit');


subplot(3,2,1), imshow(temp0);
subplot(3,2,2), imshow(temp20);
subplot(3,2,3), imshow(temp40);
subplot(3,2,4), imshow(temp60);
subplot(3,2,5), imshow(temp80);
subplot(3,2,6), imshow(temp100);

%%% refersh when positions are wrong
set(mainfig, 'DefaultUicontrolFontSize', 16);
uicontrol('Style', 'pushbutton', 'String', 'REFRESH',...
	'Position', [300 0 260 50], 'Callback', 'refreshfigcompare');


set(figcompare, 'Position', [601 -15 736 868]);
set(mainfig, 'Position', [3 117 592 656]);
figure(mainfig);
set(figcompare, 'Position', [601 -15 736 868]);

imcompare;