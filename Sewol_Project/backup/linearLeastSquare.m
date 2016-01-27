function [b m] = linearLeastSquare(x, y)
    % get Length
    n = max(size(x));   
    
    % calc (common) denominator
    denom = n * sum(x.^2) - sum(x).^2 ;
    
    % calc
    b = ( sum(x.^2) * sum(y) - sum(x.*y) * sum(x)) / denom;
    m = ( n * sum(x.*y) - sum(x) * sum(y) ) / denom;
end