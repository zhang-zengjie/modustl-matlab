load('stage_1_data.mat', 't', 'x');
t_a = t;
x_a = x;
load('stage_2_data.mat', 't', 'x');
t_b = t;
x_b = x;
load('stage_3_data.mat', 't', 'x');
t_c = t;
x_c = x;

L = 15.5/0.5;

subplot(2, 1, 1)
hold on
fill([2.5, 16.5, 16.5, 2.5], [0.1, 0.1, 11.9, 11.9], [255, 245, 204]/255, 'LineStyle', 'none');
fill([19.3, 19.7, 19.7, 19.3], [0.1, 0.1, 11.9, 11.9], [217, 242, 217]/255, 'LineStyle', 'none');
fill([24, 24.5, 24.5, 24], [0.1, 0.1, 11.9, 11.9], [217, 242, 217]/255, 'LineStyle', 'none');
fill([29, 39.5, 39.5, 29], [0.1, 0.1, 11.9, 11.9], [217, 242, 217]/255, 'LineStyle', 'none');

fill([21.9, 22.1, 22.1, 21.9], [0.1, 0.1, 11.9, 11.9], [255, 245, 204]/255, 'LineStyle', 'none');
fill([26.5, 27, 27, 26.5], [0.1, 0.1, 11.9, 11.9], [255, 245, 204]/255, 'LineStyle', 'none');
fill([44, 45, 45, 44], [0.1, 0.1, 11.9, 11.9], [229, 242, 255]/255, 'LineStyle', 'none');
%fill([4, 5, 5, 4], [0, 0, 1, 1], [0.9, 0.9, 0.9]);
p1a = plot(t_a(1:L), x_a(1,1:L), 'color', [128, 0, 0]/255, 'LineWidth', 2, 'LineStyle', '-.');
p1b = plot(t_b(1:L) + t_a(L), x_b(1,1:L), 'color', [0, 51, 204]/255, 'LineWidth', 2, 'LineStyle', '-.');
p1c = plot(t_c(1:L) + t_a(L) + t_b(L), x_c(1,1:L), 'color', [204, 102, 0]/255, 'LineWidth', 2, 'LineStyle', '-.');
ylabel('$\zeta_x(t)$ (m)', 'Interpreter', 'latex', 'FontSize', 12);
grid on
axis([0, 45, 0, 12]);
hold off

subplot(2, 1, 2)
hold on

z0 = fill([2.5, 16.5, 16.5, 2.5], [0.1, 0.1, 7.9, 7.9], [255, 245, 204]/255, 'LineStyle', 'none');
fill([19.3, 19.7, 19.7, 19.3], [0.1, 0.1, 7.9, 7.9], [217, 242, 217]/255, 'LineStyle', 'none');
fill([24, 24.5, 24.5, 24], [0.1, 0.1, 7.9, 7.9], [217, 242, 217]/255, 'LineStyle', 'none');
fill([29, 39.5, 39.5, 29], [0.1, 0.1, 7.9, 7.9], [217, 242, 217]/255, 'LineStyle', 'none');

fill([21.9, 22.1, 22.1, 21.9], [0.1, 0.1, 7.9, 7.9], [255, 245, 204]/255, 'LineStyle', 'none');
z1 = fill([26.5, 27, 27, 26.5], [0.1, 0.1, 7.9, 7.9], [255, 245, 204]/255, 'LineStyle', 'none');
z2 = fill([44, 45, 45, 44], [0.1, 0.1, 7.9, 7.9], [229, 242, 255]/255, 'LineStyle', 'none');
%fill([4, 5, 5, 4], [0, 0, 3, 3], [0.9, 0.9, 0.9]);
p2a = plot(t_a(1:L), x_a(2,1:L), 'color', [128, 0, 0]/255, 'LineWidth', 2, 'LineStyle', '-.');
p2b = plot(t_b(1:L) + t_a(L), x_b(2,1:L), 'color', [0, 51, 204]/255, 'LineWidth', 2, 'LineStyle', '-.');
p2c = plot(t_c(1:L)+ t_a(L) + t_b(L), x_c(2,1:L), 'color', [204, 102, 0]/255, 'LineWidth', 2, 'LineStyle', '-.');
ylabel('$\zeta_y(t)$ (m)', 'Interpreter', 'latex', 'FontSize', 12);
grid on
axis([0, 45, 0, 8]);
xlabel('time (s)', 'FontSize', 12);
% legend([z0, z1, z2], 'TARGET $Z_0$', 'HOME $Z_1$', 'CHARGER $Z_2$', 'fontsize', 14, 'interpreter', 'latex');
legend([p2a, p2b, p2c], 'Trajectory stage 1', 'Trajectory stage 2', 'Trajectory stage 3', 'fontsize', 14, 'interpreter', 'latex');
%set(lgd2,'FontSize',14);

hold off