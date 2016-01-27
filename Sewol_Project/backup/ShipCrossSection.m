close all;

iCAR = 3; CAR_WIDTH = 200; CAR_HEIGHT = 60;
iBOX = 4; BOX_WIDTH = 200; BOX_HEIGHT = 100;
% GIVEN DATA
deckSize = [  % Deck width height
      0 38 ;   % BOTTOM DECK
    546 153 ;   % E  DECK
    546 156 ;   % D  DECK CAR
    546 122 ;   % C  DECK BOX
    546  68 ;   % B  DECK
    546  65 ;   % A  DECK
    546  65];  % NAV DECK

deckSize = deckSize / 298 * 17 * 132/200; % px to m 

% curve of bottom part
curveCoeff = polyfit( [ 
    -deckSize(2,1)/2, 0, deckSize(2,1)/2], [ 
    deckSize(1,2), deckSize(1,1), deckSize(1,2) ], 2);
curve = @(x) curveCoeff(1).*x.^2 + curveCoeff(2).*x + curveCoeff(3);

n = size(deckSize); n = n(1);   % length of deck Size
deckHeight = sum(deckSize(:,2)) % deck total height

% left wall
for i = 1:n-1
    shipWalls(i, 1) = -deckSize(n,1)/2;
    shipWalls(i, 2) = sum(deckSize(1:n-(i-1),2))
end

% bottom curve
shipWalls(n:2*n,1) = linspace(-deckSize(2,1)/2,deckSize(2,1)/2, n+1);
shipWalls(n:2*n,2) = curve(linspace(-deckSize(2,1)/2,deckSize(2,1)/2, n+1));

% right wall
for i = 2*n+1:3*n
    shipWalls(i, 1) = deckSize(n,1)/2;
    shipWalls(i, 2) = sum(deckSize(1:(i-2*n),2));
end

% ceil
shipWalls(3*n+1, :) = shipWalls(1, :);

% plot ship walls
hold on;
plot(shipWalls(:,1), shipWalls(:,2));

for i = 2:n
    plot([-deckSize(i, 1)/2, deckSize(i,1)/2], [sum(deckSize(1:i-1, 2)), sum(deckSize(1:i-1, 2))]);
end

car_x = CAR_WIDTH/2 * [-1 -1 1 1]; % dl ul ur dr
car_y = sum(deckSize(1:iCAR-1, 2)) + [0 CAR_HEIGHT CAR_HEIGHT 0];
car = fill(car_x, car_y, 'r');

box_x = BOX_WIDTH/2 * [-1 -1 1 1]; % dl ul ur dr
box_y = sum(deckSize(1:iBOX-1, 2)) + [0 BOX_HEIGHT BOX_HEIGHT 0];
box = fill(box_x, box_y, 'b');
% COM, Moment of inertia theta
hold off;

COM_ship(0, 11.78); % (m)


