function [H_loss_test_major] = Major_head_loss_test_setup(Q_turbine, OB_GUI_parameters)
%% Major head loss test setup
%   For the test setup, the bladder was replaced with a tank on a storage
%   shelf. The tank is connected to the inlet of the discharge system of
%   the Ocean Battery. This function accounts for the major losses in the
%   tubes that connect the tank to the discharge system. 

%% Setting parameters
OB_parameters;

%% Independent parameters
A_pipeline_test = pi * (0.5*D_pipeline_test)^2; %area, if there are a lot of independent variables, a seperate script for these parameters will be created
RR_pipeline_test = Roughness_pipeline_test/D_pipeline_test; %[-] Relative roughness of the pipeline.

%% Dependent parameters
Re_pipeline_test = ((Q_turbine/A_pipeline_test) * D_pipeline_test * Dens_wat) / Visc_wat; %[-] Reynolds number of the flow in the pipeline.
f_pipeline_test = Moody(RR_pipeline_test, Re_pipeline_test); %[-] Friction factor of the pipeline, from the moody diagram.

%% Major head loss calculation
H_loss_test_major = f_pipeline_test * (L_pipeline_test/D_pipeline_test) * (((Q_turbine/A_pipeline_test)^2)/(2*g));

end

