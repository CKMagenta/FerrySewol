function J=MoI(mx,my,angle,Ship,m_tot)
rotationMat = [cos(angle) sin(angle);-sin(angle) cos(angle)];
shipOutline = rotationMat*[[-1 1 1 -1]*Ship.width/2 ; [1 1 0 0]*Ship.height-Ship.draft];
J=1/12*m_tot*(20.5574^2+25.1132^2)+m_tot*sqrt(((shipOutline(1,1)+shipOutline(1,2))/2-mx)^2 + ((shipOutline(2,1)+shipOutline(2,4))/2-my)^2);
end