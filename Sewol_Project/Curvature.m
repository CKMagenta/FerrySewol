function r=Curvature(x_p,y_p)
% First Derivative and Second Derivative of y(x)
der1=FirstDeriv(x_p,y_p);
der2=FirstDeriv(x_p,der1);

% Curvature
r=((1+(der1).^2).^1.5)./der2;
end