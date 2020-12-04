%%
fileID = fopen('mos.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
fclose(fileID);
% %%
% fileID = fopen('mos_with_names.txt','r');
% tline = fgetl(fileID);
% info = {};
% while ischar(tline)
%     info = [info split(tline)];
%     tline = fgetl(fileID);
% end
% mos = [];
% for i = 1:length(im_names)
%     for j = 1:length(im_names)
%         if strcmp(im_names{i}, info{2,j})
%             mos = [mos info(1,j)];
%         end
%     end
% end
% fclose(fileID);
%%
X = val';
y = A;
% modelfun = @(b,x)b(1)*(1-1./(2+exp(b(2)*(x(:,1)-b(3))))) + ...
%     b(4)*x(:,1)+b(5);
modelfun = @(b,x)b(1)*(1/2-1./(1+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(X,y,modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'}
Qo = co(1)*(1/2-1./(1+exp(co(2)*(val-co(3))))) + ...
    co(4)*val+co(5);
file = fopen('C:\Users\Jun Qin\Desktop\ECE_6258\Project\tid2013\metrics_values\sum.txt','w');
for k = 1 :  length(Qo)
    fprintf(file, '%f\n',Qo(k));
end
fclose(file);
% %%
% myFolder = 'tid2013\distorted_images';
% filePattern = fullfile(myFolder, '*.BMP'); % Change to whatever pattern you need.
% theFiles = dir(filePattern);
% for k = 1 : length(theFiles)
%     h = theFiles(k).name;
%     if h(1) ~= lower(h(1))
%         h
%         f = fullfile(myFolder, theFiles(k).name)
%         g = fullfile(myFolder+'2', lower(h))
%         movefile(g,f);
%     end
% end
%%
fileID = fopen('sum.txt','r');
formatSpec = '%f';
B = fscanf(fileID,formatSpec);
fclose(fileID);
RMSE = sqrt(mean((A-B).^2))
P = sum((A(:)-mean(A)).*(B(:)-mean(B)))/sqrt(sum((A(:)-mean(A)).^2)*sum((B(:)-mean(B)).^2));
S = corr(A,B,'type', 'spearman')
K = corr(A,B,'type', 'kendall')
P = corr(A,B,'type', 'pearson')
stdDev = std(B);
OR = sum((B(:)-mean(B))>=2*stdDev)/size(B,1)
