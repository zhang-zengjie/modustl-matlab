T = Sys.system_data.time;
Y = Sys.system_data.Y;
U = Sys.system_data.U;

Tq= 0:0.05:5;
Yq = [Tq;Tq;Tq;Tq];

Yq(1,:) = interp1(T,Y(1,:),Tq);
Yq(2,:) = interp1(T,Y(2,:),Tq);
Yq(3,:) = interp1(T,Y(3,:),Tq);
Yq(4,:) = interp1(T,Y(4,:),Tq);

L = 80;
hold on

x_1 = [0 2 2 0];
y_1 = [0 0 2 2];
f1 = fill(x_1,y_1, [217, 179, 140]/255);

x_2 = [2 4 4 2];
y_2 = [0 0 2 2];
f2 = fill(x_2,y_2, [115, 77, 38]/255);

x_3 = [0 2 2 0];
y_3 = [2 2 4 4];
f3 = fill(x_3,y_3, [115, 77, 38]/255);

x_4 = [2 4 4 2];
y_4 = [2 2 4 4];
f4 = fill(x_4,y_4, [153, 153, 153]/255);


line([0,4], [4,4], 'color', [0, 0, 0]);
line([4,4], [0,4], 'color', [0, 0, 0]);

line([0,4], [2,2], 'color', [0, 0, 0]);
line([2,2], [0,4], 'color', [0, 0, 0]);

plot(1, 1, 'o', 'color', [0, 0, 0],'MarkerFaceColor', [0, 0, 0], 'LineWidth', 20);
plot(1, 3, 'o', 'color', [0, 0, 0],'MarkerFaceColor', [0, 0, 0], 'LineWidth', 20);
plot(3, 1, 'o', 'color', [0, 0, 0],'MarkerFaceColor', [0, 0, 0], 'LineWidth', 20);


for i=1:L
    p1 = plot(Yq(1,i), Yq(2,i), 'o', 'color', [0, 0, 0.8],'MarkerFaceColor', [0, 0, 0.8]);
end

for i=1:L
    p2 = plot(Yq(3,i), Yq(4,i), 'o', 'color', [0.8, 0, 0],'MarkerFaceColor', [0.8, 0, 0]);
end


legend([p1, p2], 'Eva', 'Walle', 'fontsize', 14, 'interpreter', 'latex')

text(1,0.8,'table 1', 'fontsize', 14);
text(1,2.8,'table 2', 'fontsize', 14);
text(3,0.8,'table 3', 'fontsize', 14);

axis([0, 4, 0, 4]);
hold off