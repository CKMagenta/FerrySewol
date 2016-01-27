close all;
Ship = NewShip(10000000);
Box.x = 0;
Car.x = 0;
tZoom = 1000;
xlim([-25 25]);
ylim([-20 30]);
animateShip(Ship, Car, Box, theta, [1 2], [3 4]);
for t = 1:5000
    theta = 0.0001*(t)*(t-100);
    a = 9.8*sin(theta);
    %if a ~= 0
     sign = a/abs(a);
    %end
    a = sign*max(abs(a), 0);
    
    Car.x = Car.x + 0.5*a*10*(1/tZoom)^2;
    Box.x = Box.x + 0.5*a*10*(1/tZoom)^2;
    animateShip(t, Ship, Car, Box, theta, [1 2], [3 4], t);
    pause(0.02);
end