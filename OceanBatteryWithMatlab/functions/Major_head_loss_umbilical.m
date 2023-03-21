function [H_loss_umbilical_major] = Major_head_loss_umbilical(Q, OB_GUI_parameters)
%% Major head loss umbilical cord
%   No separate function for charging and discharging is needed, because
%   the air follows the same route during the charging and the discharging
%   phase. 

%% Flow == 0
%   The script generates an error when the flow is zero. To prevent this,
%   this if-statemtent is used. 
if Q == 0
    H_loss_umbilical_major = 0;
    return
end
    
%% Setting paramaters
Copy_of_OB_parameters;

%% Initial caculations
A_umbilical = pi * (0.5*D_umbilical)^2; %[m^2] Area of the umbilical cord.
RR_umbilical = Roughness_umbilical/D_umbilical; %[-] Relative roughness of the umbilical cord.

%% Flow
Q_U1 = p_1*Q; %[m^3/s] Flow through segment 1 of the umbilical cord.
Q_U2 = p_2*Q; %[m^3/s] Flow through segment 2 of the umbilical cord.
Q_U3 = p_3*Q; %[m^3/s] Flow through segment 3 of the umbilical cord.
Q_U4 = p_4*Q; %[m^3/s] Flow through segment 4 of the umbilical cord.

%% Reynolds number
Re_u1 = ((Q_U1/A_umbilical)*D_umbilical*Dens_air)/Visc_air; %[-] Reynolds number for segment 1 of the umbilical cord.
Re_u2 = ((Q_U2/A_umbilical)*D_umbilical*Dens_air)/Visc_air; %[-] Reynolds number for segment 1 of the umbilical cord.
Re_u3 = ((Q_U3/A_umbilical)*D_umbilical*Dens_air)/Visc_air; %[-] Reynolds number for segment 1 of the umbilical cord.
Re_u4 = ((Q_U4/A_umbilical)*D_umbilical*Dens_air)/Visc_air; %[-] Reynolds number for segment 1 of the umbilical cord.

%% Friction factor
f_u1 = Moody(RR_umbilical, Re_u1); %[-] Friction factor for segment 1. 
f_u2 = Moody(RR_umbilical, Re_u2); %[-] Friction factor for segment 2.
f_u3 = Moody(RR_umbilical, Re_u3); %[-] Friction factor for segment 3.
f_u4 = Moody(RR_umbilical, Re_u4); %[-] Friction factor for segment 4. 

%% Separate head loss
H_loss_u1 = f_u1 * (L_U1/D_umbilical) * (((Q_U1/A_umbilical)^2)/(2*g)); %[m] Head loss in segment 1.
H_loss_u2 = f_u2 * (L_U2/D_umbilical) * (((Q_U2/A_umbilical)^2)/(2*g)); %[m] Head loss in segment 2.
H_loss_u3 = f_u3 * (L_U3/D_umbilical) * (((Q_U3/A_umbilical)^2)/(2*g)); %[m] Head loss in segment 3.
H_loss_u4 = f_u4 * (L_U4/D_umbilical) * (((Q_U4/A_umbilical)^2)/(2*g)); %[m] Head loss in segment 4.

%% Total head loss
H_loss_umbilical_major = (Dens_air/Dens_wat)* (H_loss_u1 + H_loss_u2 + H_loss_u3 + H_loss_u4); %[m]
end