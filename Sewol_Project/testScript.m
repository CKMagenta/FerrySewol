close all;
Ship = NewShip(10000);
Box.x = 0;
Car.x = 0;
tZoom = 100;
xlim([-30 30]);
ylim([-30 30]);
animateShip(Ship, Car, Box, theta, [1 2], [3 4]);
for t = 1:10*tZoom
    theta = pi()/3*sin(t^1/2*pi()/(tZoom*5));
    a = 8000*sin(theta);
    sign = a/abs(a);
    a = sign*max(abs(a), 0);
    
    Car.x = min(max(Car.x + 0.5*a*(1/tZoom)^2,-7.4),7.4);
    Box.x = min(max(Box.x + 0.5*a*(1/tZoom)^2,-7.2),7.2);
    animateShip(Ship, Car, Box, theta, [1 2], [3 4]);
    pause(0.1/tZoom);
end