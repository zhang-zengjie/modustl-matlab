%% config.m
% Add the necessary paths of the dependencies

%% Add the paths of the dependencies
% Replace the paths according to your situation
    
try % Add the path to the tbxmanager
    addpath(genpath('Toolboxes/tbxmanager/'));
catch
    warning('Could not find mpt3 toolbox. Synthesis may fail.');
end

try % Add the path to the tensor_toolbox
    addpath(genpath('Toolboxes/tensor_toolbox/'));
catch
    warning('Could not find tensor toolbox. Synthesis may fail.');
end

try % Add the path to the mosek solver
    addpath(genpath('Toolboxes/mosek/mosek/10.0/toolbox/r2017a'));
catch
    warning('Could not find mosek solver. Synthesis may fail.');
end

try % Add the path to the mosek solver
    addpath(genpath('BluSTL-master/src'));
catch
    warning('Could not find mosek solver. Synthesis may fail.');
end

try % Add the path to the mosek solver
    addpath(genpath('gurobi10.0.1_linux64'));
catch
    warning('Could not find mosek solver. Synthesis may fail.');
end



%% Remove all other versions of SySCoRe to avoid conflicts
% rmpath(genpath(fileparts(which('SySCoRe-software'))));

%% Add all subfolders of this toolbox to the MATLAB path.
% addpath(genpath(fileparts(which(mfilename))));
