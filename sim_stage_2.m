clear;
clc;

%% Stage 2
x0= [3;6];
L = 25;
phi ={'ev_[0,5] ( abs(y1(t)-4) < 1)', ...
      'ev_[0,5] ( abs(y2(t)-6) < 1)', ...
      'alw_[0,15] ( ( abs(y1(t)-8) < 1) or (ev_[0,5] ( abs(y1(t)-8) < 1)))', ...
      'alw_[0,15] ( ( abs(y2(t)-6) < 1) or (ev_[0,5] ( abs(y2(t)-6) < 1)))', ...
      'alw_[15,15] ( (y1(t) < 14) and (y1(t) > 2) )', ...
      'alw_[15,15] ( (y2(t) < 7) and (y2(t) > 1) )'};

[t, x, u] = sys_optimize(x0, L, phi);

save('stage_2_data.mat', 't', 'x', 'u');