function [t, x, u] = sys_optimize(x0, L, phi)

%% Defining the plant dynamics 
% The toolbox is organized around one main class, called STLClti. An
% STLClti object is primarily a continuous Linear Time Invariant (LTI) 
% system with inputs, outputs and disturbances. Hence, a constructors for this 
% class takes matrices to define such an LTI. We first define and A and B
% matrices for state evolution:

A = zeros(2,2);
Bu = eye(2,2);
Bw = zeros(2,2);
C = eye(2,2);
Du = zeros(2,2); % check dimensions of y and u
Dw = zeros(2,2); % ensure dimension of y

%%
% Now we can call the main constructor of STLC_lti class. 
Sys= STLC_lti(A,Bu,Bw,C,Du,Dw); 

%%
% In the next section, we will define the different settings for the 
% control synthesis experiment. Before that, we define some initial state:
Sys.x0 = x0;


%% Defining the controller
% We start by defining the time instants for the whole experiment, the discrete time
% step ts for the controller and the horizon L in number of time steps.  
Sys.time = 0:0.5:30; 
Sys.ts=0.5; % sampling time for controller
Sys.L=L;  % horizon is 2s in that case
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
Sys.stl_list = phi;

%%
% We can run the system in closed loop, but this is not very interesting,
% because w is 0 anyway. Let us change this: 
Sys.Wref = Sys.time*0.;
Sys.Wref = [Sys.Wref;Sys.Wref];

controller = get_controller(Sys, 'boolean');

%%
% This time we will only plot input and outputs, i.e., disable the state
% plotting:
close;
Sys.plot_x =[]; % default was Sys.plot_x = [1 2]
run_open_loop(Sys, controller);
%run_deterministic(Sys, controller);

%%
% More examples are given in the folder BluSTL/examples. In particular the 
% hvac_room case study demonstrates the adversarial scenario, as well as
% plot customization. The idea is to create a class derived from STLC_lti
% and specialize the update_plot method. 

t = Sys.system_data.time;
x = Sys.system_data.Y;
u = Sys.system_data.U;