SplitMe
=======


A matlab tool to simulate a moving window and create equidistant images to use for cognitive/memory experiments.
The code was written when I did not have a lot of Matlab knowledge, so may be primitive, but it works.

======================================================
Split pictures with the technique of the moving window.

Instructions:

1. Unzip the content of the ZIP file.
2. Put your high images in the "source" folder. There are already some test images you can split to tet the software.
3. Run Matlab and set the current directory to the directory you unzipped.
4. Write "splitt" on the command line. This will open the GUI with the first picture to split.


How it works:
The images to split are read from the "source" folder.
Six rectangles are drawn next to each other.
Move them with the mouse or resize with the sliding bar under the main picture.
On the right side six resulting images will be displayed from 0% to 100%, with their exact size underneath.
If the size of the rectangle is below 1024x768 the size label will become red to notice a low definition image.
You can inspect or view each percentage by clicking the "VIEW" button.
You can also refresh the right window if it hangs on.

At the end you have two options:

1. Skipping the picture: the image is simply transferred to "skipped" folder. You can do this for many reasons; the image has bad quality, the size is not enough, the pictures doesn't really change between 0% and 100%, etc.

2. Accepting the picture: the image will be processed slowly (it needs computational power). A directory with the image name will be created in "target" directory. Four other directories will be created for different resolutions with the resulting images in. Each slice will have the contrast adjusted before being resized and saved. This is important to avoid different contrasts for different steps.



Troubleshooting:
1. In case you need to restart the script close the GUI and write "clear all" on the command line. Then "splitt" again. The first command will clear all variables from Matlab and you will loose your work if you are using Matlab for something else.

2. The script has certain coordinates for positioning the user interface. Most probably they are in the wrong position on your computer. This is normal, you can try to change those yourself inside the splitt.m file.

3. If you want to change source, target and skipped directories you can do by changing variables 'jpegdir', 'savedir' (in splitt.m) and 'skipdir' (in skip.m).

4. The script is not a piece of art in today programming and may be innacurate in some aspects. It has been created by a beginner and only for the strict purpose of controlling and splitting ~500 pictures. Both processing and moving the rectangles are slow. This is normal because of the high computations needed for all rectangles to move together.


####################################################################
VERY IMPORTANT:

The script doesn't split the image in steps of 5%. It only splits in steps of 20%. That is, you have 6 images identical to the 6 rectangles you see. In case you need steps of 5%, feel free to add the core yourself. However, don't start to split images if you'll need the 5% steps later. The images you split will need to be splitted again and the job you do will be lost.
####################################################################
