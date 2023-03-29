% load('stage_1_data', 't', 'x');

subplot(2, 1, 1)
hold on
fill([1, 2, 2, 1], [0, 0, 1, 1], [0.9, 0.9, 0.9]);
fill([4, 5, 5, 4], [0, 0, 1, 1], [0.9, 0.9, 0.9]);
line([1, 1], [0, 1], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
line([2, 2], [0, 1], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
line([4, 4], [0, 1], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
line([5, 5], [0, 1], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
p1 = plot(t, x(1, :), 'color', [0, 0, 0.8], 'LineWidth', 1.5, 'LineStyle', '-.');
ylabel('X-axis');
grid on
axis([0, 15, 0, 8]);
hold off

subplot(2, 1, 2)
hold on

fill([1, 2, 2, 1], [0, 0, 3, 3], [0.9, 0.9, 0.9]);
fill([4, 5, 5, 4], [0, 0, 3, 3], [0.9, 0.9, 0.9]);
%p2 = plot(Yq(3,i), Yq(4,i), 'o', 'color', [0.8, 0, 0],'MarkerFaceColor', [0.8, 0, 0]);
line([1, 1], [0, 3], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
line([2, 2], [0, 3], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
line([4, 4], [0, 3], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
line([5, 5], [0, 3], 'LineStyle', '--', 'color', [0.2, 0.2, 0.2]);
p2 = plot(t, x(2, :), 'color', [0, 0, 0.8], 'LineWidth', 1.5, 'LineStyle', '-.');
ylabel('Y-axis');
grid on
axis([0, 15, 0, 8]);
xlabel('time');
%legend([f1, f2, f3, f4, p1, p2], '$X_1$', '$X_2$', '$X_3$', '$X_4$', '$A_1$', '$A_2$', 'fontsize', 14, 'interpreter', 'latex')

hold off
