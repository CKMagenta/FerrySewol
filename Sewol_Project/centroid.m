function [area, cx, cy] = centroid(Ship, angle)
    [area, cx, cy ] = polycenter([Ship.width*0.5/cos(angle), Ship.width*0.5*cos(angle) - (-Ship.draft)*sin(angle) (-Ship.width)*0.5*cos(angle) - (-Ship.draft)*sin(angle) -Ship.width*0.5/cos(angle)], [0,Ship.width*0.5*sin(angle)+(-Ship.draft)*cos(angle), (-Ship.width)*0.5*sin(angle)+(-Ship.draft)*cos(angle), 0]);
    
end