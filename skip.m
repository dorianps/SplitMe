%%% this file neccessary to skip pictures, move them in a folder and go to next

disable;

skipdir = [pwd '\skipped\'];
movefile([jpgdir filelist(i).name], [skipdir filelist(i).name]);

delete(mainfig);
delete(figcompare);

splitt;