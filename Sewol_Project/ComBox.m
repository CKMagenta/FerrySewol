function comBox = ComBox(angle, Ship,Box)
rotationMat = [cos(angle) sin(angle);-sin(angle) cos(angle)];
box_x = Ship.width/6 * [-1 -1 1 1] + Box.x; % dl ul ur dr
box_y = sum(Ship.geometry(1:3, 2)) + Ship.geometry(3, 2)*[0 0.8 0.8 0] - Ship.draft;
box_mat = (rotationMat*[box_x;box_y]);
comBox=[(box_mat(1,1)+box_mat(1,3))/2 (box_mat(2,1)+box_mat(2,3))/2];
end