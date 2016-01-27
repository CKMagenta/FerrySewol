function [angle, CAR_X, BOX_X] = Solver(ODE, T, INITs, Ship, Car, Box, f_c, f_d)
% ODEs : ODE{1}, ODE{2}.. 
%   ODE{1} : 
%   ODE{2} : 
% CAR_X : [ .... ];
% BOX_X : [ .... ];

% T : [ t_first,  t_last, dt ]
% INITs : [ ... ]

% ARG = [J, M, g, mCar, mBox, f_c]

% K(1,1) : K 1 x, K(1, 2) K 1 y ..
t(1) = T(1);
h = T(3);
N = ( T(2)-T(1) )/T(3);

g = 9.81;
mShip = Ship.m;
mCar = Car.m;
mBox = Box.m;

angle(1) = INITs(1);
w(1)     = INITs(2);
CAR_X(1) = INITs(3);
CAR_V(1) = INITs(4);
BOX_X(1) = INITs(5);
BOX_V(1) = INITs(6);


for i = 1 : N 
    t(i+1) = t(i) + h;
    tm = t(i) + h/2;
    
    [area, cx, cy] = centroid(Ship, angle(i));
    
    comShip = Comship(angle(i));
    Box.x = BOX_X(i);
    Car.x = CAR_X(i);
    comBox = ComBox(angle(i), Ship, Box);
    comCar = ComCar(angle(i), Ship, Car);
    [comx, comy] = COM(mShip, mCar, mBox, comShip, comCar, comBox);
    [mx, my] = MomentCenter(cx, cy, comx, comy);
    
    
    J = MoI(mx, my, angle(i), Ship, mShip+mCar+mBox);
    
    M = Moment((mShip+mBox+mCar)*g, f_c(i), f_d(i), mx, my, cx, cy, angle(i));
    
    ARG = [J, M, g, mCar, mBox, f_c(i)];
    for j = 1:6
        K(1,j) = ODE{j}(t(i), angle(i), w(i), CAR_X(i), CAR_V(i), BOX_X(i), BOX_V(i), ARG);
    end
    
    for j = 1:6
        K(2,j) = ODE{j}(tm, angle(i)+K(1,1)*h/2, w(i)+K(1,2)*h/2, CAR_X(i)+K(1,3)*h/2, CAR_V(i)+K(1,4)*h/2, BOX_X(i)+K(1,5)*h/2, BOX_V(i)+K(1,6)*h/2,  ARG);
    end
    
    for j = 1:6
        K(3,j) = ODE{j}(tm, angle(i)+K(2,1)*h/2, w(i)+K(2,2)*h/2, CAR_X(i)+K(2,3)*h/2, CAR_V(i)+K(2,4)*h/2, BOX_X(i)+K(2,5)*h/2, BOX_V(i)+K(2,6)*h/2, ARG);
    end
    
    for j = 1:6
        K(4,j) = ODE{j}(t(i+1), angle(i)+K(3,1)*h, w(i)+K(3,2)*h, CAR_X(i)+K(3,3)*h, CAR_V(i)+K(3,4)*h, BOX_X(i)+K(3,5)*h, BOX_V(i)+K(3,6)*h,  ARG);
    end
    
    angle(i+1) = (angle(i) + (K(1,1) + 2*K(2,1) + 2*K(3,1) + K(4,1))*h/6);
        w(i+1) =     w(i) + (K(1,2) + 2*K(2,2) + 2*K(3,2) + K(4,2))*h/6;
    CAR_X(i+1) = max(min(CAR_X(i) + (K(1,3) + 2*K(2,3) + 2*K(3,3) + K(4,3))*h/6 , 15.5/2), -15.5/2);
    CAR_V(i+1) = CAR_V(i) + (K(1,4) + 2*K(2,4) + 2*K(3,4) + K(4,4))*h/6;
    BOX_X(i+1) = max(min(BOX_X(i) + (K(1,5) + 2*K(2,5) + 2*K(3,5) + K(4,5))*h/6 , 13.5/2), -13.5/2);
    BOX_V(i+1) = BOX_V(i) + (K(1,6) + 2*K(2,6) + 2*K(3,6) + K(4,6))*h/6;
    
    % angle(i+1), CAR_X(i+1), BOX_X(i+1)
end
end