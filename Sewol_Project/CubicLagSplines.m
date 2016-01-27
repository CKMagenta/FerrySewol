function Yint = CubicLagSplines(x, y, xint)
   % functino for spline interpolation that uses third-order Lag poly
   % x, y are vectors with the coordinates of the data points
   % xint is the x coordinate of the interpolated point
   % Tint is the y calue of the interpolated point
   
   % Settings
   n = length(x);   % length of vector
   
   % Finding input's location
   loc = 1;
   for i = 1:n-1
       if x(loc) <= xint && xint < x(loc+1)
           break;
       end
       loc = loc+1;
   end
   
   if( 1 <= loc && loc < 2)
       % if xint is in the first interval of the data points,
       %   the function uses a second order polynomial that passes though the
       %   first theree data points
       for i = 1:3
            L(i) = 1;
            for j = 1:3
                if j~= i
                    L(i) = L(i)*(xint-x(j))/(x(i)-x(j));
                end
            end
       end 
       Yint = sum(y(1:3).*L(1:3));
   elseif ( n-1 <= loc && loc <= n )
       % if xint is in the last interval of the data points, the functino uses
       %   a second-order polynomial that passes though the last three data
       %   points.
       for i = n-2:n
            L(i) = 1;
            for j = n-2:n
                if j~= i
                    L(i) = L(i)*(xint-x(j))/(x(i)-x(j));
                end
            end
       end    
        Yint = sum(y(n-2:n).*L(n-2:n));
   else
       %  if xint is in any other interval, the functino uses a third-order polynomial for the interpolation.
       %   the third-order polynomial is written such that it passes though the
       %   data points : x_i-1, x_i, x_+1, and x_i+2
       for i = loc-1:loc+2
            L(i) = 1;
            for j = loc-1:loc+2
                if j~= i
                    L(i) = L(i)*(xint-x(j))/(x(i)-x(j));
                end
            end
       end    
       Yint = sum(y(loc-1:loc+2).*L(loc-1:loc+2));
   end
   
   
end