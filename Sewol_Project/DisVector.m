function [x_s, y_s, x_p, y_p,hdg,x_ship,y_ship]=DisVector(t1,x,y,t,h)

px=polyfit(t1,x,5);
 x_p=polyval(px,t);
for i=1:171
x_s(i)=CubicLagSplines(t1,x,t(i));
end
 py=polyfit(t1,y,2);
 y_p=polyval(py,t);
for i=1:171
y_s(i)=CubicLagSplines(t1,y,t(i));
end

for i=1:171
hdg(i)=CubicLagSplines(t1,h,t(i));
end

for i=1:171
      x_ship(i,1)=cos(hdg(i));
      x_ship(i,2)=-sin(hdg(i));
      y_ship(i,1)=sin(hdg(i));
      y_ship(i,2)=cos(hdg(i));
end
end