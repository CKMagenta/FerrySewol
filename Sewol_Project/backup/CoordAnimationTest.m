function HDG(vectx0, vectx1, vecty0, vecty1,x_p,y_p)

axX = line([0, vectx0(1)], [0, vectx1(1)]);
axY = line([0, vecty0(1)], [0, vecty1(1)]);
xlim([0 1500]);
ylim([0 1500]);
grid on;

hold on;
    for t = 2 : length(vectx0)
        set(axX, 'Xdata', [x_p(t), vectx0(t)]);
        set(axX, 'Ydata', [y_p, vectx1(t)]);
        set(axY, 'Xdata', [x_p(t), vecty0(t)]);
        set(axY, 'Ydata', [y_p(t), vecty1(t)]);
        pause(0.1);
        title( strcat('t = ', num2str(t) ));
        drawnow;
    end
hold off;
end