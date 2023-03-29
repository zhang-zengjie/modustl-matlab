%% Defining the plant dynamics 
% The toolbox is organized around one main class, called STLClti. An
% STLClti object is primarily a continuous Linear Time Invariant (LTI) 
% system with inputs, outputs and disturbances. Hence, a constructors for this 
% class takes matrices to define such an LTI. We first define and A and B
% matrices for state evolution:

A = zeros(2,2);
% A2 = zeros(2,2);
% A12 = zeros(2,2);
% A21 = zeros(2,2);
% A = [A1, A12; A21 A2];

Bu = eye(2,2);
% B2u = eye(2,2);
% B12u = zeros(2, 2);
% B21u = zeros(2, 2);
% Bu = [B1u, B12u; B21u, B2u];

Bw = zeros(2,2);

C = eye(2,2);
% C2 = eye(2,2);
% C12 = zeros(2,2);
% C21 = zeros(2,2);
% C = [C1, C12; C21, C2];
% C = [1, 0, 1, 0];

Du = zeros(2,2); % check dimensions of y and u
Dw = zeros(2,2); % ensure dimension of y

% Du = [0, 0];
% Dw = 0;

%%
% Now we can call the main constructor of STLC_lti class. 
Sys= STLC_lti(A,Bu,Bw,C,Du,Dw); 

%%
% In the next section, we will define the different settings for the 
% control synthesis experiment. Before that, we define some initial state:
Sys.x0= [2;2];
% Sys.x0= [1;1;1;1];

% A = [0 1 ;
%      0 0];
% Bu = [0;1];
% 
% %%
% % Later on, we will use a disturbance signals so we need to define a Bw 
% % matrice. This signal will not influence the state dynamics, though, so we
% % set Bw to be 0. 
% Bw = [0;0]; 
% 
% %%
% % Next we define the output dynamics, i.e., C, Du and Dw matrices. Here we
% % have a single output $y(t) = x1(t)+w(t)$.
% C = [1 0];
% Du = 0;
% Dw = 0;
% 
% %%
% % Now we can call the main constructor of STLC_lti class. 
% Sys= STLC_lti(A,Bu,Bw,C,Du,Dw); 
% 
% %%
% % In the next section, we will define the different settings for the 
% % control synthesis experiment. Before that, we define some initial state:
% Sys.x0= [1 ; 1];




%% Defining the controller
% We start by defining the time instants for the whole experiment, the discrete time
% step ts for the controller and the horizon L in number of time steps.  
Sys.time = 0:.1:30; 
Sys.ts=.2; % sampling time for controller
Sys.L=25;  % horizon is 2s in that case
Sys.min_rob = 0.01;

%%
% Next we declare some constraints on control inputs, here, lower and upper
% bounds:
Sys.u_ub = [1; 1];  % upper bound on u 
Sys.u_lb = [-1; -1]; % lower bound on u

%%
% Then the following define a signal temporal logic formula to be satisfied
% by the system. Note that times in the temporal operators are continuous,
% not discrete steps. 
% Sys.stl_list = {'ev_[0,1.] alw_[0,2] (abs(y1(t)-w1(t)) < 0.1)'};
% Sys.stl_list = {'ev_[3,4] (max(abs(y1(t)-5), abs(y2(t)-15))<0.1) and ev_[6,8] (max(abs(y3(t)-15), abs(y4(t)-15))<0.1)'};

% Sys.stl_list = {'ev_[3,4] (max(abs(y1(t)-5), abs(y2(t)-15))<0.1)'};
% Sys.stl_list = {'ev_[0,1.] alw_[0,2] (abs(y1(t)-w1(t)) < 0.1)'};
% Sys.stl_list = {'ev_[0,1] alw_[0,2] (abs(y1(t)-1)<0.1)'};
% %%
% % Now we are ready to compile the controller for our problem. 
% controller = get_controller(Sys);
% 
% %%
% % Note that by default, the objective function will minimize the 1-norm of
% % the input. 
% 
% %% Testing the controller
% % The simplest mode to run our system with the newly created controller is in
% % open loop. This is done with the following command:
% run_open_loop(Sys, controller);

%%
% We can run the system in closed loop, but this is not very interesting,
% because w is 0 anyway. Let us change this: 
Sys.Wref = Sys.time*0.;
%Sys.Wref(30:40) = 1; 
%Sys.Wref(60:80) = -0.5; 
Sys.Wref = [Sys.Wref;Sys.Wref];

%%
% and the specifications:
% Sys.stl_list = {'alw (ev_[0,1.] alw_[0,0.5] ( abs(y1(t)-5) < 0.1))'};
% Sys.stl_list = {'alw (ev_[0,4] alw_[0,0.5] ( abs(y1(t)) < 0.1)) and alw (ev_[0,4] alw_[0,0.5] ( abs(y2(t)) < 0.1)) and alw (ev_[0,4] alw_[0,0.5] ( abs(y3(t)) < 0.1)) and alw (ev_[0,4] alw_[0,0.5] ( abs(y4(t)) < 0.1))'};
% Sys.stl_list = {'alw (ev_[0,4] alw_[0,0.5] ( abs(y1(t)-5) < 0.1))', ...
%     'alw (ev_[0,4] alw_[0,0.5] ( abs(y2(t)) < 0.1))', ...
%     'alw (ev_[0,4] alw_[0,0.5] ( abs(y3(t)) < 0.1))', ...
%     'alw (ev_[0,4] alw_[0,0.5] ( abs(y4(t)) < 0.1))'};

tor = 0.5;

Sys.stl_list = {'alw_[0,5] ev_[0,5] ( abs(y1(t)-4) < 1)', ...
                'alw_[0,5] ev_[0,5] ( abs(y2(t)-6) < 1)', ...
                'alw_[5,5] ( (y1(t) < 9) and (y1(t) > 2) )', ...
                'alw_[5,5] ( (y2(t) < 11) and (y2(t) > 1) )'};

% Sys.stl_list = {'alw_[0,5] ev_[0,5] ( abs(y1(t)-4) < 1)', ...
%                 'alw_[0,5] ev_[0,5] ( abs(y2(t)-6) < 1)', ...
%                 'ev_[0,5] alw_[0,1] ( abs(y1(t)-20) < 1)', ...
%                 'ev_[0,5] alw_[0,1] ( abs(y2(t)-5) < 1)'};

% Sys.stl_list = {'alw_[0, 2] ev_[1,2] ( abs(y1(t)-1) < tor)', ...
%                 'alw_[0, 2] ev_[1,2] ( abs(y2(t)-1) < tor)'};
controller = get_controller(Sys, 'boolean');

%%
% This time we will only plot input and outputs, i.e., disable the state
% plotting:
close;
Sys.plot_x =[]; % default was Sys.plot_x = [1 2]
run_deterministic(Sys, controller);

%%
% More examples are given in the folder BluSTL/examples. In particular the 
% hvac_room case study demonstrates the adversarial scenario, as well as
% plot customization. The idea is to create a class derived from STLC_lti
% and specialize the update_plot method. 

