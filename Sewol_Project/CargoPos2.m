function dydt=CargoPos2(t,x,y,f_c,m,angle)
g=9.81;
dydt=f_c*cos(angle)+m*g*sin(angle);
end