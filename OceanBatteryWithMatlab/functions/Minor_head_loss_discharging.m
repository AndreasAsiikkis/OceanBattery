function [H_loss_discharging_minor] = Minor_head_loss_discharging(Q_turbine,OB_GUI_parameters)
%% Minor head loss (discharging)
%   this function calculates the minor losses for all parts, dependent on 
%   the flow speed in that part. The general equation that is used:
%   H_loss_charging_minor = Number_of_parts * K_part *(((Q_turbine/A_part)^2)/(2*g) + ...

%% Flow == 0
%   The script generates an error when the flow is zero. To prevent this,
%   this if-statemtent is used. 
if Q_turbine == 0
    H_loss_discharging_minor = 0;
    return
end

%% Setting parameters
phase = 2; %Indicates the discharge phase of the system, is used to calculate the correct K-values for this phase in K_values_independent.
K_values_independent; %Loads the script K_values_independent.m.

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

K_bend = K_smooth_bend + K_contraction_bend + K_enlargement_bend; %[-] Total K-value of the bend (with threaded connection).

%% Volumetric flow bypass
Q_bypass = Q_turbine*(V_rigid_in/Capacity_rigid); %[m^3/s]

%% Minor head loss (discharging)
H_loss_discharging_minor = Number_ball_valves * K_ball_valve *(((Q_turbine/A_ball_valve)^2)/(2*g)) + Number_unions * K_unions *(((Q_turbine/A_union)^2)/(2*g)) + Number_pressure_sensors * K_pressure_sensor *(((Q_turbine/A_pressure_sensor)^2)/(2*g)) + Number_flow_meters * K_flow_meter *(((Q_turbine/A_flow_meter)^2)/(2*g)) + Number_check_valves * K_check_valve *(((Q_turbine/A_check_valve)^2)/(2*g)) + Number_90deg_elbows * K_elbow_90 *(((Q_turbine/A_elbow_90)^2)/(2*g)) + Number_45deg_elbows * K_elbow_45 *(((Q_turbine/A_elbow_45)^2)/(2*g)) + Number_inlets * K_inlet *(((Q_turbine/A_inlet)^2)/(2*g)) + Number_outlets * K_outlet *(((Q_turbine/A_outlet)^2)/(2*g)) + Number_90deg_bends * K_bend * (((Q_turbine/A_bend)^2)/(2*g)) + Number_bypasses * K_bypass *(((Q_bypass/A_bypass)^2)/(2*g)); %[m] 
end