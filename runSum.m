% % Specify the folder where the files live.
% myFolder = 'tid2013\distorted_images';
% 
 
% 
% 
% % Get a list of all files in the folder with the desired file name pattern.
% filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
% theFiles = dir(filePattern);
% val = [];
% for k = 1 : length(theFiles)
%     baseFileName = theFiles(k).name;
%     fullFileName = fullfile(theFiles(k).folder, baseFileName);
%     %fprintf(1, 'Now reading %s\n', fullFileName);
%     % Now do whatever you want with this file name,
%     % such as reading it in as an image array with imread()
%     refFolder = 'tid2013\reference_images';
%     im1File = baseFileName(1:3)+".BMP";
%     refIm = fullfile(refFolder, im1File);
%     im1 = imread(refIm);
%     im2 = imread(fullFileName);
%     out = SUMMER(im1,im2);
%     fprintf(fileID, '%f\n',out);
%     val = [val out];
% end
% 
% fclose(fileID);
clc, clear
% Specify the folder where the files live.
myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\tid2013\distorted_images';


if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end
fileID = fopen('exp.txt','w');
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
val = [];
im_names = {};
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    %fprintf(1, 'Now reading %s\n', fullFileName);
    refFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\tid2013\reference_images';
    im1File = baseFileName(1:3)+".BMP";
    refIm = fullfile(refFolder, im1File);
    im1 = imread(refIm);
    im2 = imread(fullFileName);
    out = modSum(im1,im2);
    fprintf(fileID, '%f\n',out);
    val = [val out];
    im_names = [im_names baseFileName];
end

fclose(fileID);