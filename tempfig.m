%%% this file to preview each figure

if ishandle(figbig) delete(figbig); end;

iptsetpref('ImshowBorder','tight');
figbig = figure('MenuBar','none', 'Color', [0,0,0], 'Name',['Preview... ' num2str(preview) '%'], 'Toolbar','none', 'NumberTitle','off', 'Renderer', 'painters');, imshow(temp, 'InitialMagnification', 100), truesize;

enable;