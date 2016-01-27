function Ship = NewShip(mShip)

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

Ship.origin = [0 0];
Ship.geometry = deckSize;
Ship.COM = [ 0 (100/298*20)+11.78 ];
Ship.carDeckHeight = sum(Ship.geometry(1:2,2));
Ship.boxDeckHeight = sum(Ship.geometry(1:3,2));
Ship.length = 146;
Ship.draft = 6;
Ship.width = Ship.geometry(2,1);
Ship.height = sum(deckSize(:,2)); % deck total height
Ship.m = mShip;
end