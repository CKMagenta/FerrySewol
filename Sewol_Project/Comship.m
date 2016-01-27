function comship=Comship(angle)
rotationMat = [cos(angle) sin(angle);-sin(angle) cos(angle)];
comship=rotationMat*[0;5.78];
end