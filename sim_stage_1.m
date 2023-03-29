clear;
clc;

%% Stage 1
%x0 = [2;2];
x0 = [2;6];
L = 25;  
phi = {'alw_[0,15] ev_[0,5] ( abs(y1(t)-4) < 1)', ...
       'alw_[0,15] ev_[0,5] ( abs(y2(t)-6) < 1)', ...
       'alw_[15,15] ( (y1(t) < 9) and (y1(t) > 2) )', ...
       'alw_[15,15] ( (y2(t) < 11) and (y2(t) > 1) )'};

[t, x, u] = sys_optimize(x0, L, phi);

save('stage_1_data.mat', 't', 'x', 'u');