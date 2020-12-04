clc, clear
%% Open MOS Scores
fileID = fopen('mos.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
fclose(fileID);
%% TID13
myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\tid2013\distorted_images';
fileID = fopen('exp.txt','w');
filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
val = [];
MOS = [];
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    if (strcmp(baseFileName(5:6),'10')||strcmp(baseFileName(5:6),'11')||strcmp(baseFileName(5:6),'21'))
        fullFileName = fullfile(theFiles(k).folder, baseFileName);
        %fprintf(1, 'Now reading %s\n', fullFileName);
        refFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\tid2013\reference_images';
        im1File = baseFileName(1:3)+".BMP";
        refIm = fullfile(refFolder, im1File);
        im1 = imread(refIm);
        im2 = imread(fullFileName);
        out = SUMMER(im1,im2);
        fprintf(fileID, '%f\n',out);
        val = [val out];
        MOS = [MOS A(k)];
    end
end
%% LIVE
load('refnames_all.mat')
load('dmos_realigned.mat')
load('dmos.mat')
val2 = [];
MOS2 = [];
for s = 1 : 2
    switch s
        case 1
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\jp2k';
            ind = 0;
        case 2
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\jpeg';
            ind = 227;
    end
    filePattern = fullfile(myFolder, '*.bmp'); % Change to whatever pattern you need.
    theFiles = dir(filePattern);
    a = struct2cell(theFiles);
    [newFiles, ndx] = natsortfiles(a(1,:));
    for k = 1 : length(theFiles)
        baseFileName = theFiles(ndx(k)).name;
        fullFileName = fullfile(theFiles(ndx(k)).folder, baseFileName);
        %fprintf(1, 'Now reading %s\n', fullFileName);
        % Now do whatever you want with this file name,
        % such as reading it in as an image array with imread()
        im_ind = ind+k;
        %if ~orgs(im_ind)
            refIm = refnames_all{im_ind};
            im1 = imread(refIm);
            im2 = imread(fullFileName);
            out = SUMMER(im1,im2);
            MOS2 = [MOS2 dmos(im_ind)];
            val2 = [val2 out];
        %end
    end
end
%%

% Specify the folder where the files live.
myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\To_Release\Part 1\blurjpeg';
load('Imagelists.mat')
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
load('Scores.mat')
DMOS = [DMOSscores];
val3 = [];
MOS3 = [];
ind = [];
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    %fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
    
    im1File = refimgs(ref4all(k));
    if strcmp(im1File{1},baseFileName)
        continue
    end
    refIm = fullfile(myFolder, im1File{1});
    im1 = imread(refIm);
    im2 = imread(fullFileName);
    out = modSum(im1,im2);
    val3 = [val3 out];
    ind = [ind k];
end
