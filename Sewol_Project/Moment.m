function M=Moment(mg,f_c,f_d,mx,my,cx,cy, angle)
d=(((mx-cx).^2)+((my-cy).^2)).^(1/2);
M1=d*cos(angle)*mg;
maxforce=max(abs(f_c),abs(f_d));
M2=(f_c+f_d)/abs(f_c+f_d)*(maxforce-(f_c+f_d)/2)*d;
M=M1+M2;
end