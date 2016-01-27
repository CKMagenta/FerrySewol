function COM = COMCar(Ship, angle, posCar, carHeight)
    COM = Ship.origin + [-sin(angle), cos(angle)]*(Ship.carDeckHeight+carHeight) + posCar*[cos(angle), sin(angle)]; 
end