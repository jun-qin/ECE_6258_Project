% Specify the folder where the files live.

load('refnames_all.mat')
load('dmos_realigned.mat')
load('dmos.mat')
% Get a list of all files in the folder with the desired file name pattern.

val2 = [];
ref_val = [];
ref_val2 = [];
for s = 1 : 5
    
    switch s
        case 5
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\fastfading';
            ind = 227+233+174+174;
        case 4
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\gblur';
            ind = 227+233+174;
        case 1
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\jp2k';
            ind = 0;
        case 2
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\jpeg';
            ind = 227;
        case 3
            myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\databaserelease2\wn';
            ind = 227+233;
    end
    filePattern = fullfile(myFolder, '*.bmp'); % Change to whatever pattern you need.
    theFiles = dir(filePattern);
    a = struct2cell(theFiles);
    [newFiles, ndx] = natsortfiles(a(1,:));
    for k = 1 : length(theFiles)
        baseFileName = theFiles(ndx(k)).name;
        fullFileName = fullfile(theFiles(ndx(k)).folder, baseFileName);
        fprintf(1, 'Now reading %s\n', fullFileName);
        % Now do whatever you want with this file name,
        % such as reading it in as an image array with imread()
        im_ind = ind+k;
        %if ~orgs(im_ind)
            refIm = refnames_all{im_ind};
            im1 = imread(refIm);
            im2 = imread(fullFileName);
            out = modSum(im1,im2);
            ref_val = [ref_val dmos_new(im_ind)];
            ref_val2 = [ref_val2 dmos(im_ind)];
            val2 = [val2 out];
        %end
    end
end