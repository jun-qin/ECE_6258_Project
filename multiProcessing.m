
load('Scores.mat')
DMOS = [DMOSscores];
load('Scores2.mat')
DMOS = [DMOS DMOSscores];

modelfun = @(b,x)b(1)*(1/2-1./(1+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(val3',DMOS',modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'};
Qo = co(1)*(1/2-1./(1+exp(co(2)*(val3-co(3))))) + ...
    co(4)*val3+co(5);
S = corr(Qo',DMOS','type', 'spearman')
K = corr(Qo',DMOS','type', 'kendall')
P = corr(Qo',DMOS','type', 'pearson')
RMSE = sqrt(mean((Qo-DMOS).^2))
stdDev = std(DMOS);
OR = sum((Qo(:)-mean(Qo))>=2*stdDev)/size(Qo,1)