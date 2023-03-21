function [H_loss_test_minor] = Minor_head_loss_test_setup(Q_turbine, OB_GUI_parameters)
%% Minor head loss test setup
%   For the test setup, the bladder was replaced with a tank on a storage
%   shelf. The tank is connected to the inlet of the discharge system of
%   the Ocean Battery. This function accounts for the minor losses in the
%   tubes that connect the tank to the discharge system. 

%% Setting parameters
OB_parameters;
K_values_independent_test_setup;

%% 90-degree bend. 
%   This is dependent on the flow velocity and is therefore located in 
%   this function.
Re_bend = (Dens_wat*(Q_turbine/A_bend)*2*r_bend)/Visc_wat; %[-] Reynolds number in the bend.
gamma = Re_bend * (r_bend/R_bend)^2; %[-]
friction_factor = ((r_bend/R_bend)^0.5) * (0.029 + (0.304/(gamma^0.25))); %[-] Friction factor bend.

if gamma<91
    K_smooth_bend = 0.00873 * alfa_bend * friction_factor * angle_bend * (R_bend/r_bend);
else
    K_smooth_bend = 0.00241 * alfa_bend * angle_bend * ((R_bend/r_bend)^0.84) * Re_bend^-0.17;
end

K_bend = K_smooth_bend + K_contraction_bend + K_enlargement_bend; %[-] total K-value of the bend (with threaded connection)


%% Minor head loss (discharging)
H_loss_test_minor = Number_ball_valves * K_ball_valve *(((Q_turbine/A_ball_valve)^2)/(2*g)) + Number_unions * K_unions *(((Q_turbine/A_union)^2)/(2*g)) + Number_90deg_elbows * K_elbow_90 *(((Q_turbine/A_elbow_90)^2)/(2*g)) + Number_45deg_elbows * K_elbow_45 *(((Q_turbine/A_elbow_45)^2)/(2*g)) + Number_inlets * K_inlet *(((Q_turbine/A_inlet)^2)/(2*g)) + Number_90deg_bends * K_bend * (((Q_turbine/A_bend)^2)/(2*g)); 

end

