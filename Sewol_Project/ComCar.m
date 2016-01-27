function comCar = ComCar(angle, Ship, Car)
rotationMat = [cos(angle) sin(angle);-sin(angle) cos(angle)];
car_x = Ship.width/8 * [-1 -1 1 1] + Car.x; % dl ul ur dr
car_y = sum(Ship.geometry(1:2, 2)) + Ship.geometry(2, 2)*[0 0.8 0.8 0] - Ship.draft;
car_mat = (rotationMat*[car_x;car_y]); 
comCar=[(car_mat(1,1)+car_mat(1,3))/2 (car_mat(2,1)+car_mat(2,3))/2];
end