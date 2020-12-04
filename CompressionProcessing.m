X = val';
y = MOS';
% modelfun = @(b,x)b(1)*(1-1./(2+exp(b(2)*(x(:,1)-b(3))))) + ...
%     b(4)*x(:,1)+b(5);
modelfun = @(b,x)b(1)*(1/1-1./(2+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(X,y,modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'}
Qo = co(1)*(1-1./(2+exp(co(2)*(val-co(3))))) + ...
    co(4)*val+co(5);
S1 = corr(Qo',MOS','type', 'spearman')
K1 = corr(Qo',MOS','type', 'kendall')
P1 = corr(Qo',MOS','type', 'pearson')
RMSE1 = sqrt(mean((Qo-MOS).^2));
%% For LIVE
X = val2';
y = MOS2';
% modelfun = @(b,x)b(1)*(1-1./(2+exp(b(2)*(x(:,1)-b(3))))) + ...
%     b(4)*x(:,1)+b(5);
modelfun = @(b,x)b(1)*(1/1-1./(2+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(X,y,modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'}
Qo = co(1)*(1-1./(2+exp(co(2)*(val2-co(3))))) + ...
    co(4)*val2+co(5);
S2 = corr(Qo',MOS2','type', 'spearman')
K2 = corr(Qo',MOS2','type', 'kendall')
P2 = corr(Qo',MOS2','type', 'pearson')
RMSE2 = sqrt(mean((Qo-MOS2).^2));
%% For MULTI
X = val3';
MOS3 = DMOS;
y = MOS3';
% modelfun = @(b,x)b(1)*(1-1./(2+exp(b(2)*(x(:,1)-b(3))))) + ...
%     b(4)*x(:,1)+b(5);
modelfun = @(b,x)b(1)*(1/1-1./(2+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(X,y,modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'}
Qo = co(1)*(1-1./(2+exp(co(2)*(val3-co(3))))) + ...
    co(4)*val3+co(5);
S3 = corr(Qo',MOS3','type', 'spearman')
K3 = corr(Qo',MOS3','type', 'kendall')
P3 = corr(Qo',MOS3','type', 'pearson')
RMSE3 = sqrt(mean((Qo-MOS3).^2));
%%
S = (S1*size(val)+S2*size(val2))/(size(val)+size(val2))
K = (K1*size(val)+K2*size(val2)+K3*size(val3))/(size(val)+size(val2)+size(val3))
P = (P1*size(val)+P2*size(val2)+P3*size(val3))/(size(val)+size(val2)+size(val3))