%%% this file is run after you push ACCEPT, resizes the images, create dirs and saves

disable;


fun540 = @(x) imresize(x,[405 540], 'bicubic', 30);
fun640 = @(x) imresize(x,[480 640], 'bicubic', 30);
fun800 = @(x) imresize(x,[600 800], 'bicubic', 30);
fun1024 = @(x) imresize(x,[768 1024], 'bicubic', 30);


process = uicontrol(mainfig, 'Style', 'text', 'String', 'Processing 0%', 'Position', [150 620 260 30]);
drawnow;

if (~isdir([savedir filelist(i).name])) mkdir([savedir filelist(i).name]); end;
if (~isdir([savedir filelist(i).name '\540x405'])) mkdir([savedir filelist(i).name '\540x405']); end;
if (~isdir([savedir filelist(i).name '\640x480'])) mkdir([savedir filelist(i).name '\640x480']); end;
if (~isdir([savedir filelist(i).name '\800x600'])) mkdir([savedir filelist(i).name '\800x600']); end;
if (~isdir([savedir filelist(i).name '\1024x768'])) mkdir([savedir filelist(i).name '\1024x768']); end;

temp0 = imadjust(temp0); %%% adjust contrast
temp = fun540(temp0);
imwrite(temp, [savedir filelist(i).name '\540x405\0-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 3%'); drawnow;
temp = fun640(temp0);
imwrite(temp, [savedir filelist(i).name '\640x480\0-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 8%'); drawnow;
temp = fun800(temp0);
imwrite(temp, [savedir filelist(i).name '\800x600\0-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 12%'); drawnow;
temp = fun1024(temp0);
imwrite(temp, [savedir filelist(i).name '\1024x768\0-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 17%'); drawnow;

temp20 = imadjust(temp20); %%% adjust contrast
temp = fun540(temp20);
imwrite(temp, [savedir filelist(i).name '\540x405\20-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 21%'); drawnow;
temp = fun640(temp20);
imwrite(temp, [savedir filelist(i).name '\640x480\20-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 25%'); drawnow;
temp = fun800(temp20);
imwrite(temp, [savedir filelist(i).name '\800x600\20-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 29%'); drawnow;
temp = fun1024(temp20);
imwrite(temp, [savedir filelist(i).name '\1024x768\20-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 34%'); drawnow;

temp40 = imadjust(temp40); %%% adjust contrast
temp = fun540(temp40);
imwrite(temp, [savedir filelist(i).name '\540x405\40-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 39%'); drawnow;
temp = fun640(temp40);
imwrite(temp, [savedir filelist(i).name '\640x480\40-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 43%'); drawnow;
temp = fun800(temp40);
imwrite(temp, [savedir filelist(i).name '\800x600\40-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 47%'); drawnow;
temp = fun1024(temp40);
imwrite(temp, [savedir filelist(i).name '\1024x768\40-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 50%'); drawnow;

temp60 = imadjust(temp60); %%% adjust contrast
temp = fun540(temp60);
imwrite(temp, [savedir filelist(i).name '\540x405\60-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 54%'); drawnow;
temp = fun640(temp60);
imwrite(temp, [savedir filelist(i).name '\640x480\60-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 58%'); drawnow;
temp = fun800(temp60);
imwrite(temp, [savedir filelist(i).name '\800x600\60-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 62%'); drawnow;
temp = fun1024(temp60);
imwrite(temp, [savedir filelist(i).name '\1024x768\60-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 66%'); drawnow;

temp80 = imadjust(temp80); %%% adjust contrast
temp = fun540(temp80);
imwrite(temp, [savedir filelist(i).name '\540x405\80-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 70%'); drawnow;
temp = fun640(temp80);
imwrite(temp, [savedir filelist(i).name '\640x480\80-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 75%'); drawnow;
temp = fun800(temp80);
imwrite(temp, [savedir filelist(i).name '\800x600\80-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 79%'); drawnow;
temp = fun1024(temp80);
imwrite(temp, [savedir filelist(i).name '\1024x768\80-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 83%'); drawnow;

temp100 = imadjust(temp100); %%% adjust contrast
temp = fun540(temp100);
imwrite(temp, [savedir filelist(i).name '\540x405\100-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 87%'); drawnow;
temp = fun640(temp100);
imwrite(temp, [savedir filelist(i).name '\640x480\100-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 92%'); drawnow;
temp = fun800(temp100);
imwrite(temp, [savedir filelist(i).name '\800x600\100-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 97%'); drawnow;
temp = fun1024(temp100);
imwrite(temp, [savedir filelist(i).name '\1024x768\100-' filelist(i).name], 'Quality', 99);
set(process, 'String', 'Processing 100%'); drawnow;

movefile([jpgdir filelist(i).name], [savedir filelist(i).name '\' filelist(i).name]);



delete(mainfig);
delete(figcompare);

splitt;

