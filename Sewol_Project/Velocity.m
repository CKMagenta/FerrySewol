function [vx,vy,v,vx_ship,vy_ship,v_ship]=Velocity(t,x_s,y_s,x_ship,y_ship)
vx=FirstDeriv(t,x_s);
vy=FirstDeriv(t,y_s);

for i=1:171
    v(i,1)=vx(i);
    v(i,2)=vy(i);
end

for i=1:171
    vx_ship(i)=dot(v(i),x_ship(i));
    vy_ship(i)=dot(v(i),y_ship(i));
end

for i=1:171
    v_ship(i,1)=vx_ship(i);
    v_ship(i,2)=vy_ship(i);
end
end