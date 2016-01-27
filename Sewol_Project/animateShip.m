function animateShip(Ship, Car, Box, angle, COM, B)


n = length(Ship.geometry); % length of deck Size

rotationMat = [cos(angle) sin(angle);-sin(angle) cos(angle)];
% plot ship walls
shipOutline = rotationMat*[[-1 1 1 -1]*Ship.width/2 ; [1 1 0 0]*Ship.height-Ship.draft];
shipWalls = fill(shipOutline(1,:),shipOutline(2,:), 'w');
hold on;
% draw car and car's ground
car_x = Ship.width/8 * [-1 -1 1 1] + Car.x; % dl ul ur dr
car_y = sum(Ship.geometry(1:2, 2)) + Ship.geometry(2, 2)*[0 0.8 0.8 0] - Ship.draft;
car_mat = (rotationMat*[car_x;car_y]);
car = fill(car_mat(1,:), car_mat(2,:), 'r');
line_car_mat = rotationMat * [[-1 1]*Ship.width/2;[1 1]*sum(Ship.geometry(1:2, 2))-Ship.draft];
line_car = line(line_car_mat(1,:), line_car_mat(2,:) );
set(line_car, 'Color', 'k');

% draw box and box's ground
box_x = Ship.width/6 * [-1 -1 1 1] + Box.x; % dl ul ur dr
box_y = sum(Ship.geometry(1:3, 2)) + Ship.geometry(3, 2)*[0 0.8 0.8 0] - Ship.draft;
box_mat = (rotationMat*[box_x;box_y]);
box = fill(box_mat(1,:), box_mat(2,:), 'b');
line_box_mat = rotationMat * [[-1 1]*Ship.width/2;[1 1]*sum(Ship.geometry(1:3, 2))-Ship.draft];
line_box = line(line_box_mat(1,:), line_box_mat(2,:));
set(line_box, 'Color', 'k');

%if(t > 0)
%    title(strcat('t = ', num2str(t)));

%{
rotate(shipWalls, [0 0 1], angle);
rotate(car, [0 0 1], angle);
rotate(box, [0 0 1], angle);
rotate(line_car, [0 0 1], angle);
rotate(line_box, [0 0 1], angle);
drawnow;
%}
plot([0],[0], 'r*');
%plot(COM(1), COM(2), 'bo');
%plot(B(1), B(2), 'go');
hold off;
end


