clc
clear all;
% Discrete Data of Sewol Ferry
t1=[0,36,42,48,49,53,59,60,69,89,93,99,103,107,111,115,119,123,135,139,149,158,163,170];
x1=[2.8,5.8,6.25,6.6,6.625,6.75,6.9,6.9,6.75,5.55,5.38,5,4.625,4.25,3.8,3.5,3,2.75,2,1.9,1.77,1.2,1,0.75];
y1=[7.7,4.75,4.25,3.75,3.62,3.27,2.75,2.65,1.625,0.700000000000000,0.625000000000000,0.500000000000000,0.490000000000000,0.480000000000000,0.475000000000000,0.450000000000000,0.600000000000000,0.625000000000000,0.800000000000000,0.825000000000000,0.900000000000000,1.30000000000000,1.49000000000000,1.75000000000000];
h=[139 150 155 161 162 168 178 180 229 251 254 258 262 265 268 270 272 249 247 247 246 245 245 245].*pi./180;
x=153.*x1;
y=185.*y1;
t=0:170;
m_ship=6113000;
m_box=1157000;
m_car=2451000;
mg=9.81.*(m_ship+m_box+m_car);
COM=[0 5.78];

% -------------------Create DisplacementVector---------------------------%
[x_s, y_s, x_p, y_p,hdg,x_ship,y_ship]=DisVector(t1,x,y,t,h);

[vx,vy,v,vx_ship,vy_ship,v_ship]=Velocity(t,x_s,y_s,x_ship,y_ship);

r=Curvature(x_p,y_p);

% Centrifugal Force
f_c=CentForce(m_ship,vy_ship,r);

% Drag Force
a=6*146;
f_d=DragForce(a,vx_ship);

% CASE 1
%{
subplot(2,2,2)
plot(x_s,y_s)
hold on;
plot(x,y,'r')
subplot(2,2,3)
HDG(x_ship(:,1),x_ship(:,2),y_ship(:,1),y_ship(:,2),x_p,y_p)
%}

%{
% Define Ship, Car, Box Objects
Ship = NewShip(m_ship);
Car = NewCar(m_car);
Box = NewBox(m_box);

% Define ODE to solve and Initial Conditions 
ODE{1} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (wV);
ODE{2} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (ARG(2)/ARG(1));
ODE{3} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (0);% No
ODE{4} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (0);% Acc
ODE{5} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (0);% No
ODE{6} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (0);% Vel
T = [t(1), t(length(t)), t(2)-t(1)];
INITs = [0, 0, 0, 0, 0, 0];

[angle, CAR_X, BOX_X] = Solver(ODE, T, INITs, Ship, Car, Box, f_c, f_d);
%}
%{
subplot(2,2,1);
plot(angle);
subplot(2,2,2);
plot(CAR_X);
subplot(2,2,3);
plot(BOX_X);
%}


% CASE2
% Define Ship, Car, Box Objects
Ship = NewShip(0.1*m_ship);
Car = NewCar(0.001*m_car);
Box = NewBox(0.001*m_box);

% Define ODE to solve and Initial Conditions 
ODE{1} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (wV);
ODE{2} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (ARG(2)/ARG(1));
ODE{3} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (CAR_VV);
ODE{4} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (ARG(3)*sin(angleV)+ARG(6)*cos(angleV)/ARG(4));
ODE{5} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (BOX_VV);
ODE{6} = @(tV, angleV, wV, CAR_XV, CAR_VV, BOX_XV, BOX_VV, ARG) (ARG(3)*sin(angleV)+ARG(6)*cos(angleV)/ARG(5));
T = [t(1), t(length(t)), t(2)-t(1)];
INITs = [0, 0, 0, 0, 0, 0];

[angle, CAR_X, BOX_X] = Solver(ODE, T, INITs, Ship, Car, Box, f_c, f_d);
%{
subplot(2,2,1);
plot(angle);
subplot(2,2,2);
plot(CAR_X);
subplot(2,2,3);
plot(BOX_X);
%}

% animation
for t = 1:171
    Car.x = CAR_X(t);
    Box.x = BOX_X(t);
    animateShip(Ship, Car, Box, angle(t), [0 0], [0 0]);
    %pause(0.1);
end