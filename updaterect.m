function [x shift20 shift40 shift60 shift80 shift100] = updaterect(varargin)
global api0 api20 api40 api60 api80 api100 slider h20 shift20 shift40 shift60 shift80 shift100 kot0 kot20 kot40 kot60 kot80 kot100 kotupdate fototemp;

rectwidth = get(slider, 'Value');
rectheight = (rectwidth * 3) / 4; %%% create format 4:3 of the rectangle

pos0 = api0.getPosition();
ypos = pos0(2);
xpos = pos0(1);


%%% recalculate global shifts
shift20 = rectwidth / 5; % every shift is 1/5 of rectangle width
shift40 = shift20 * 2; 
shift60 = shift20 * 3;
shift80 = shift20 * 4;
shift100 = shift20 * 5;


%%% remove old global callbacks
api0.removeNewPositionCallback(kot20);
api20.removeNewPositionCallback(kot40);
api40.removeNewPositionCallback(kot60);
api60.removeNewPositionCallback(kot80);
api80.removeNewPositionCallback(kot100);
api100.removeNewPositionCallback(kot0);
api0.removeNewPositionCallback(kotupdate);


%%% set positions again with new values rescaling around xpos of api0
set(h20, 'Position', [xpos+shift20 ypos rectwidth rectheight]);
api20.setPosition([xpos+shift20 ypos rectwidth rectheight]);
api40.setPosition([xpos+shift40 ypos rectwidth rectheight]);
api60.setPosition([xpos+shift60 ypos rectwidth rectheight]);
api80.setPosition([xpos+shift80 ypos rectwidth rectheight]);
api100.setPosition([xpos+shift100 ypos rectwidth rectheight]);
api0.setPosition([xpos ypos rectwidth rectheight]);

%%% add again position callbacks
kot20 = api0.addNewPositionCallback(@(p) api20.setPosition(api0.getPosition() + [shift20 0 0 0]));
kot40 = api20.addNewPositionCallback(@(p) api40.setPosition(api20.getPosition() + [shift20 0 0 0]));
kot60 = api40.addNewPositionCallback(@(p) api60.setPosition(api40.getPosition() + [shift20 0 0 0]));
kot80 = api60.addNewPositionCallback(@(p) api80.setPosition(api60.getPosition() + [shift20 0 0 0]));
kot100 = api80.addNewPositionCallback(@(p) api100.setPosition(api80.getPosition() + [shift20 0 0 0]));
kot0 = api100.addNewPositionCallback(@(p) api0.setPosition(api100.getPosition() - [shift100 0 0 0]));
kotupdate = api0.addNewPositionCallback(@(p) imcompare);


%%% update drag constrains for new sizes
tempinfo = whos('fototemp');
xconstrain0 = [0.5 tempinfo.size(2)-rectwidth];
xconstrain100 = [rectwidth tempinfo.size(2)];
yconstrain = [0.5 tempinfo.size(1)];

fcn = makeConstrainToRectFcn('imrect',...
                 xconstrain0, yconstrain);
fcn100 = makeConstrainToRectFcn('imrect',...
                 xconstrain100, yconstrain);

api0.setDragConstraintFcn(fcn);
api100.setDragConstraintFcn(fcn100);

imcompare;