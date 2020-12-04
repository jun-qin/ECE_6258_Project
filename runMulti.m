% clc, clear


% Specify the folder where the files live.
myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\To_Release\Part 1\blurjpeg';
load('Imagelists.mat')
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
val3 = [];
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
end

% Specify the folder where the files live.
myFolder = 'C:\Users\Jun Qin\Desktop\ECE_6258\Project\To_Release\Part 2\blurnoise';
load('Imagelists.mat')
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
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
end















% clc, clear
% val3 = [];
% 
% for z = 1:2
%     % Specify the folder where the files live.
%     if z == 1
%         myFolder = 'To_Release\Part 1\blurjpeg'
%         load('Imagelists.mat')
%     else
%         myFolder = 'To_Release\Part 2\blurnoise'
%         load('Imagelists2.mat')
%     end
%     
%     % Get a list of all files in the folder with the desired file name pattern.
%     filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
%     theFiles = dir(filePattern);
%     
%     for k = 1 : length(theFiles)
%         if mod(k,16) == 1
%             continue;
%         end
%         if mod(k,16) == 5||mod(k,16) == 9||mod(k,16) == 13
%             k = k-3;
%         elseif mod(k,16) == 2||mod(k,16) == 3||mod(k,16) == 4||mod(k,16) == 6||mod(k,16) == 7||...
%                 mod(k,16) == 8||mod(k,16) == 10||mod(k,16) == 11||mod(k,16) == 12
%             k = k+1;
%         end
%         baseFileName = theFiles(k).name;
%         fullFileName = fullfile(theFiles(k).folder, baseFileName);
%         %fprintf(1, 'Now reading %s\n', fullFileName);
%         % Now do whatever you want with this file name,
%         % such as reading it in as an image array with imread()
%         im1File = refimgs{ref4all(k)};
%         refIm = fullfile(myFolder, im1File);
%         im1 = imread(refIm);
%         im2 = imread(fullFileName);
%         out = SUMMER(im1,im2);
%         val3 = [val3 out];
%     end
% end
