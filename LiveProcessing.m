modelfun = @(b,x)b(1)*(1/1-1./(2+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(val2',dmos_new',modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'}
Qo = co(1)*(1-1./(2+exp(co(2)*(val2-co(3))))) + ...
    co(4)*val2+co(5);
S = corr(Qo',ref_val','type', 'spearman')
S = corr(Qo',ref_val','type', 'kendall')
%%
modelfun = @(b,x)b(1)*(1/1-1./(2+exp(b(2)*(x-b(3)))))+b(4)*x+b(5);
beta0 = [0.0, 0.1, 0.0, 0.0, 0.0];
mdl = fitnlm(val2',ref_val2,modelfun,beta0);
co = mdl.Coefficients{:, 'Estimate'}
Qo = co(1)*(1-1./(2+exp(co(2)*(val2-co(3))))) + ...
    co(4)*val2+co(5);
S = corr(Qo',ref_val2','type', 'spearman')
K = corr(Qo',ref_val2','type', 'kendall')
P = corr(Qo',ref_val2','type', 'pearson')
RMSE = sqrt(mean((Qo-ref_val2).^2))
OR = sum((Qo(:)-mean(Qo))>=2*stdDev)/size(Qo,2)