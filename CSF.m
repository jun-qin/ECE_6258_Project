function [out] = CSF(x,y)
%C Summary of this function goes here
%   Detailed explanation goes here
[N2,N1] = size(x);
scale = 5;
 f = scale*sqrt((2.*pi.*(x-(N1+1)/2)/N1).^2+(2.*pi.*(y-(N2+1)/2)/N2).^2);
% out = 2.6.*(0.0192+0.114.*f).*exp(-(0.114.*f).^1.1);

theta = atan2((y-(N2+1)/2),(x-(N1+1)/2));
ft  = f./(0.15.*cos(4.*theta)+0.85);
e = exp(-(0.228.*ft).^1.1);
y = (0.019+0.228.*ft);
res = (2.6.*y.*e);
mask = f<=4;
res(mask) = 0.981;
out = res;

end

