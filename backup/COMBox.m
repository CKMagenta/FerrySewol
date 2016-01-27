function [COM_X COM_Y] = COMBox(Ship, angle, posBox, boxHeight)
    [COM_X, COM_Y] = Ship.origin + [-sin(angle), cos(angle)]*(Ship.boxDeckHeight+boxHeight) + posBox*[cos(angle), sin(angle)]; 
end