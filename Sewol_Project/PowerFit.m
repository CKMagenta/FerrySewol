function [b m] = PowerFit(x, y)
    % x, y : vectors with the coordinates of the data points.
    % b m are the values of the coefficients
    % y = bx^m
    
    % ln(y) = ln(b) + m*ln(x);
    % Y = B + m*X;
    
    X = log(x);
    Y = log(y);
    
    [B M] = linearLeastSquare(X, Y);
    
    b = exp(B);
    m = M;
    
end