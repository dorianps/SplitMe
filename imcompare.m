function x = imcompare(varargin)
global api0 api20 api40 api60 api80 api100 fototemp figcompare label0size label20size label40size label60size label80size label100size temp0 temp20 temp40 temp60 temp80 temp100;
%disp('testttt')

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

figure(figcompare); % set the focus on the compare tool to draw following subplots
subplot(3,2,1), imshow(temp0);
subplot(3,2,2), imshow(temp20);
subplot(3,2,3), imshow(temp40);
subplot(3,2,4), imshow(temp60);
subplot(3,2,5), imshow(temp80);
subplot(3,2,6), imshow(temp100);


%%% update size labels
[m,n] = size(temp0);
set(label0size, 'String', [num2str(n) ' x ' num2str(m)]);
if (n < 1024) set(label0size, 'BackgroundColor', [.8,.2,0]); end;
if (n >= 1024) set(label0size, 'BackgroundColor', [0,0,0]); end;
[m,n] = size(temp20);
set(label20size, 'String', [num2str(n) ' x ' num2str(m)]);
if (n < 1024) set(label20size, 'BackgroundColor', [.8,.2,0]); end;
if (n >= 1024) set(label20size, 'BackgroundColor', [0,0,0]); end;
[m,n] = size(temp40);
set(label40size, 'String', [num2str(n) ' x ' num2str(m)]);
if (n < 1024) set(label40size, 'BackgroundColor', [.8,.2,0]); end;
if (n >= 1024) set(label40size, 'BackgroundColor', [0,0,0]); end;
[m,n] = size(temp60);
set(label60size, 'String', [num2str(n) ' x ' num2str(m)]);
if (n < 1024) set(label60size, 'BackgroundColor', [.8,.2,0]); end;
if (n >= 1024) set(label60size, 'BackgroundColor', [0,0,0]); end;
[m,n] = size(temp80);
set(label80size, 'String', [num2str(n) ' x ' num2str(m)]);
if (n < 1024) set(label80size, 'BackgroundColor', [.8,.2,0]); end;
if (n >= 1024) set(label80size, 'BackgroundColor', [0,0,0]); end;
[m,n] = size(temp100);
set(label100size, 'String', [num2str(n) ' x ' num2str(m)]);
if (n < 1024) set(label100size, 'BackgroundColor', [.8,.2,0]); end;
if (n >= 1024) set(label100size, 'BackgroundColor', [0,0,0]); end;


%set(label0, 'Position', [40 680 45 40]);
%set(label20, 'Position', [365 680 45 40]);
%set(label40, 'Position', [40 420 45 40]);
%set(label60, 'Position', [365 420 45 40]);
%set(label80, 'Position', [40 150 45 40]);
%set(label100, 'Position', [365 150 45 40]);


%set(figcompare, 'Position', [601    -15   736   868]);
%set(mainfig, 'Position', [3   317   572   456]);