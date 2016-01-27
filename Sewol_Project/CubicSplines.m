function Yint = CubicSplines(x, y, xint)
    % Natural Cubic Splines

    % Settings
    n = length(x);    % measure length of vector x
    A = zeros(n);     % n by n matrix
    B = zeros(n,1);   % n by 1 col vector
    C = zeros(n-2);   % n-2 by n-2 matrix
    D = zeros(n-2,1); % n-2 by 1 column vector
    E = zeros(n,1);   % n by 1 col vector

    % calc h
    for i = 1:n-1
        h(i)=x(i+1)-x(i);
    end

    for j = 1:n-2
        A(j,j) = h(j);
        A(j,j+1) = 2*(h(j)+h(j+1));
        A(j,j+2) = h(j+1);
        B(j) = 6*((y(j+2)-y(j+1))/h(j+1)-(y(j+1)-y(j))/h(j));
    end

    % set both a1 and aN as 0
    A(:,1) = 0;
    A(:,n) = 0;

    % CX = D
    for k = 1:n-2
        for m = 1:n-2
            C(k,m) = A(k,m+1);
            D(k) = B(k);
        end
    end

    % calc coefficients
    X = C\D;
    E(1) = 0; E(n) = 0;

    % recovering the original size
    for i = 2:n-1
        E(i) = X(i-1);
    end

    % finding location of xint
    for i = 1:n-1
        if xint >= x(i) && xint <= x(i+1)
            k = i;
            break
        end
    end

    % simplified form of equations
    Yint = E(k)/6/h(k)*(x(k+1)-xint)^3+E(k+1)/6/h(k)*(xint-x(k))^3+(y(k)/h(k)-E(k)*h(k)/6)*(x(k+1)-xint)+(y(k+1)/h(k)-E(k+1)*h(k)/6)*(xint-x(k));
end
