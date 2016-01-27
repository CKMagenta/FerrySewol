function COM = COMShip(angle, Ship);
    COM_X = Ship.origin(1) + Ship.COM(1)*cos(angle)-Ship.COM(2)*sin(angle);
    COM_Y = Ship.origin(2) + Ship.COM(1)*sin(angle)+Ship.COM(2)*cos(angle);
    COM = [COM_X, COM_Y];
end