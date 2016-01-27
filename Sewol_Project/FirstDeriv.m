function yd = FirstDeriv(x,y)

    % get length of vector x (or y)
    n = length(x);

    % Fisrt, take derivative at first point by 3 points forward formula
    yd(1) = ( -3*y(1) + 4*y(2) - y(3) ) / (x(3) - x(1));

    % Second, take derivative at point which is not the first and last by 2
    % points central difference
        for i = 2:n-1
            yd(i) = (y(i+1) - y(i-1)) / (x(i+1) - x(i-1));
        end
    
    % Finally, take derivative at last point by 3 points backward formula
    yd(n) = ( y(n-2) -4*y(n-1) + 3*y(n) ) / (x(n) - x(n-2));

end