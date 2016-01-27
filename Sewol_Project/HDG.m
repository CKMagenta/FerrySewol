function HDG(vectx0, vectx1, vecty0, vecty1,x_p,y_p)

plot(x_p,y_p);
axX = line([x_p(1), x_p(1)+100*vectx0(1)], [y_p(1), y_p(1)+100*vectx1(1)]);
axY = line([x_p(1), x_p(1)+100*vecty0(1)], [y_p(1), y_p(1)+100*vecty1(1)]);
set(axY, 'Color', 'r');
xlim([0 1500]);
ylim([0 1500]);
grid on;

hold on;
    for t = 2 : length(vectx0)
        set(axX, 'Xdata', [x_p(t), x_p(t)+100*vectx0(t)]);
        set(axX, 'Ydata', [y_p(t), y_p(t)+100*vectx1(t)]);
        set(axY, 'Xdata', [x_p(t), x_p(t)+100*vecty0(t)]);
        set(axY, 'Ydata', [y_p(t), y_p(t)+100*vecty1(t)]);
        pause(0.1);
        title( strcat('t = ', num2str(t) ));
        drawnow;
    end
hold off;
end