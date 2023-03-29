load('stage_1_data.mat', 't', 'x');
t_a = t;
x_a = x;
load('stage_2_data.mat', 't', 'x');
t_b = t;
x_b = x;
load('stage_3_data.mat', 't', 'x');
t_c = t;
x_c = x;

L = 15/0.5;
hold on

x_0 = [0 12 12 0];
y_0 = [0 0 8 8];
f0 = fill(x_0,y_0, [255, 255, 255]/255);

x_1 = [0 9 9 0];
y_1 = [1 1 8 8];
f1 = fill(x_1,y_1, [255, 229, 229]/255, 'LineStyle', 'none');

x_2 = [3 5 5 3];
y_2 = [5 5 7 7];
f2 = fill(x_2,y_2, [255, 245, 204]/255);

x_3 = [7 9 9 7];
y_3 = [5 5 7 7];
f3 = fill(x_3,y_3, [217, 242, 217]/255);

x_4 = [7 9 9 7];
y_4 = [2 2 4 4];
f4 = fill(x_4,y_4, [229, 242, 255]/255);


% line([0,4], [4,4], 'color', [0, 0, 0]);
% line([4,4], [0,4], 'color', [0, 0, 0]);
% 
% line([0,4], [2,2], 'color', [0, 0, 0]);
% line([2,2], [0,4], 'color', [0, 0, 0]);
% 
p1 = plot(x_a(1, 1:L), x_a(2, 1:L), 'color', [128, 0, 0]/255, 'LineWidth', 4, 'LineStyle', ':');
p2 = plot(x_b(1, 1:L), x_b(2, 1:L), 'color', [0, 51, 204]/255, 'LineWidth', 4, 'LineStyle', ':');
p3 = plot(x_c(1, 1:L), x_c(2, 1:L), 'color', [204, 102, 0]/255, 'LineWidth', 4, 'LineStyle', ':');

ps = plot(x_a(1, 1), x_a(2, 1), '*', 'color', [102, 0, 52]/255,'MarkerFaceColor', [0, 0, 0], 'LineWidth', 10);
pe = plot(x_c(1, L), x_c(2, L), '*', 'color', [230, 92, 0]/255,'MarkerFaceColor', [0, 0, 0], 'LineWidth', 10);
% plot(3, 1, 'o', 'color', [0, 0, 0],'MarkerFaceColor', [0, 0, 0], 'LineWidth', 20);
% 
% 
% for i=1:L
%     p1 = plot(Yq(1,i), Yq(2,i), 'o', 'color', [0, 0, 0.8],'MarkerFaceColor', [0, 0, 0.8]);
% end
% 
% for i=1:L
%     p2 = plot(Yq(3,i), Yq(4,i), 'o', 'color', [0.8, 0, 0],'MarkerFaceColor', [0.8, 0, 0]);
% end
% 
% 
legend([ps, p1, p2, p3, pe, f1], 'Initial position', 'Trajectory stage 1', 'Trajectory stage 2', 'Trajectory stage 3', 'End position', 'LSR $S_0(\psi)$', 'fontsize', 12, 'interpreter', 'latex')
% 
text(3.7,6,'$Z_0$', 'fontsize', 14, 'Interpreter', 'latex');
text(7.7,6,'$Z_1$', 'fontsize', 14, 'Interpreter', 'latex');
text(7.7,3,'$Z_2$', 'fontsize', 14, 'Interpreter', 'latex');
% 
grid on;
axis([0, 12, 0, 8]);
hold off