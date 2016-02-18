
% Fit data with polynomial of your choice and return correlation coefficients.
%
%   USAGE
%       [R2,AR2,yfit] = benFit(x,y,degree)
%       x           vector of x values (independent variable)
%       y           vector of y values (dependent variable)
%       degree      degree of polynomial fit
%
%   OUTPUTS
%       R2          R squared
%       AR2         adjusted R squared
%       yfit        value of polynomial evaluated at x
%
% Written by BRK 2015

function [R2,AR2,yfit] = benFit(x,y,degree)

%% do the fit
p = polyfit(x,y,degree);
yfit = polyval(p, x);

%% get R vals
residY = y - yfit;
SSresid = sum(residY.^2);
SStotal = (length(y)-1) * var(y);
R2 = 1 - SSresid/SStotal;
AR2 = R2 * ((length(y)-1) / (length(y)-degree-1));

%% display results
% display(R2)
% display(AR2)
