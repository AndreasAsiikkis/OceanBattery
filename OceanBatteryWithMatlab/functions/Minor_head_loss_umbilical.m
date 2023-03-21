function [H_loss_umbilical_minor] = Minor_head_loss_umbilical(Q, OB_GUI_parameters)
%%  Minor head loss umbilical
%   No separate function for charging and discharging is needed, because
%   the air follows the same route during the charging and the discharging
%   phase. 
%
%   Because the flow through the umbilical line is divided, the parts are
%   assigned partial flows. The number of flows and their magnitude depend
%   on the design of the umbilical line. 

%% Flow == 0
%   The script generates an error when the flow is zero. To prevent this,
%   this if-statemtent is used. 
if Q == 0
    H_loss_umbilical_minor = 0;
else

%% Setting parameters
OB_parameters;
% K_values_umbilical_parameters;

%% Initial calculations
A_umbilical = pi * (0.5*D_umbilical)^2;

%% Flow
Q_U1 = p_1*Q; %[m^3/s] Flow through segment 1 of the umbilical cord.
Q_U2 = p_2*Q; %[m^3/s] Flow through segment 2 of the umbilical cord.
Q_U3 = p_3*Q; %[m^3/s] Flow through segment 3 of the umbilical cord.
Q_U4 = p_4*Q; %[m^3/s] Flow through segment 4 of the umbilical cord.

%% Velocity
v_U1 = Q_U1/A_umbilical; %[m/s] Flow velocity through segment 1 of the umbilical cord.
v_U2 = Q_U2/A_umbilical; %[m/s] Flow velocity through segment 2 of the umbilical cord.
v_U3 = Q_U3/A_umbilical; %[m/s] Flow velocity through segment 3 of the umbilical cord.
v_U4 = Q_U4/A_umbilical; %[m/s] Flow velocity through segment 4 of the umbilical cord.

%% Minor loss tee pieces
K_tee_sep_comb = 4; %[-] Minor loss coefficient of a combining/separating tee.
K_tee_bran = 2.9;%[-] Minor loss coefficient of an out/in branching tee. 

H_loss_T1 = K_tee_sep_comb * ((v_U1^2)/(2*g)); %[m] Head loss tee 1.
H_loss_T2 = K_tee_bran * ((v_U2^2)/(2*g)); %[m] Head loss tee 2.
H_loss_T3 = H_loss_T2; %[m] Head loss tee 3.

H_loss_tees = H_loss_T1 + H_loss_T2 + H_loss_T3; %[m] Total head loss all tees.

%% Bends
%Fixed values
r_bend_umb = 0.5*D_umbilical; %[m] Radius of the umbilical cord.
angle_bend_umb = 90; %[degrees] Angle that the bends make.
A_bend_umb = pi*(0.5*D_bend_umb)^2; %[m^2] Area in the bend. 

%Minor loss bend
Re_U2 = (Dens_wat*(v_U2)*D_umbilical)/Visc_wat; %[-] Reynolds number in segment U2.
Re_U3 = (Dens_wat*(v_U3)*D_umbilical)/Visc_wat; %[-] Reynolds number in segment U3.
Re_U4 = (Dens_wat*(v_U4)*D_umbilical)/Visc_wat; %[-] Reynolds number in segment U4.

gamma_U2 = Re_U2 * (r_bend_umb/R_bend_umb)^2; %[-] Gamma in segement U2.
gamma_U3 = Re_U3 * (r_bend_umb/R_bend_umb)^2; %[-] Gamma in segement U3.
gamma_U4 = Re_U4 * (r_bend_umb/R_bend_umb)^2; %[-] Gamma in segement U4.

friction_factor_U2 = ((r_bend_umb/R_bend_umb)^0.5) * (0.029 + (0.304/(gamma_U2^0.25))); %[-] Friction factor of bends in segment U2.
friction_factor_U3 = ((r_bend_umb/R_bend_umb)^0.5) * (0.029 + (0.304/(gamma_U3^0.25))); %[-] Friction factor of bends in segment U3.
friction_factor_U4 = ((r_bend_umb/R_bend_umb)^0.5) * (0.029 + (0.304/(gamma_U4^0.25))); %[-] Friction factor of bends in segment U4.

alfa_bend_U2 = 0.95 * 17.2 * ((R_bend_umb/r_bend_umb)^(-1.96)); %[-] Emperical factor depending on the angle of bends in U2.
alfa_bend_U3 = 0.95 * 17.2 * ((R_bend_umb/r_bend_umb)^(-1.96)); %[-] Emperical factor depending on the angle of bends in U3.
alfa_bend_U4 = 0.95 * 17.2 * ((R_bend_umb/r_bend_umb)^(-1.96)); %[-] Emperical factor depending on the angle of bends in U4.

if gamma_U2 < 91 
    K_smooth_bend_U2 = 0.00873 * alfa_bend_U2 * friction_factor_U2 * angle_bend_umb * (R_bend_umb/r_bend_umb);
else
    K_smooth_bend_U2 = 0.00241 * alfa_bend_U2 * angle_bend_umb * ((R_bend_umb/r_bend_umb)^0.84) * Re_U2^-0.17;
end
if gamma_U3 < 91 
    K_smooth_bend_U3 = 0.00873 * alfa_bend_U3 * friction_factor_U3 * angle_bend_umb * (R_bend_umb/r_bend_umb);
else
    K_smooth_bend_U3 = 0.00241 * alfa_bend_U3 * angle_bend_umb * ((R_bend_umb/r_bend_umb)^0.84) * Re_U3^-0.17;
end
if gamma_U4 < 91 
    K_smooth_bend_U4 = 0.00873 * alfa_bend_U4 * friction_factor_U4 * angle_bend_umb * (R_bend_umb/r_bend_umb);
else
    K_smooth_bend_U4 = 0.00241 * alfa_bend_U4 * angle_bend_umb * ((R_bend_umb/r_bend_umb)^0.84) * Re_U4^-0.17;
end

%Minor loss connections
A_ratio_umb = A_bend_umb/A_umbilical; %Ratio between the area of the entrance of the bend and the area in the bend.
A_ratio_table = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; %Creates a vector of possible ratios.  
[~,index_K_contraction] = min(abs(A_ratio_table - A_ratio_umb)); %Gives the index number of the ratio from A_ratio_table that is closest to A_ratio.
Cc_table = [0.585 0.624 0.632 0.643 0.659 0.681 0.712 0.755 0.813 0.892 1]; %Generates a table with possible contraction coefficients. 
Cc = Cc_table(index_K_contraction); %Uses the index number to match the corresponding Cc value.
K_contraction_bend_umb = ((1/Cc)-1)^2; %[-] Minor loss coefficient of the contraction.  

K_enlargement_bend_umb = (1 - (A_bend_umb/A_umbilical))^2; %[-] Minor loss coefficient of the enlargement.

%Total K-values bends
K_bend_U2 = K_smooth_bend_U2 + K_contraction_bend_umb + K_enlargement_bend_umb; %[-] Total K-value of the bend (with threaded connection).
K_bend_U3 = K_smooth_bend_U3 + K_contraction_bend_umb + K_enlargement_bend_umb; %[-] Total K-value of the bend (with threaded connection).
K_bend_U4 = K_smooth_bend_U4 + K_contraction_bend_umb + K_enlargement_bend_umb; %[-] Total K-value of the bend (with threaded connection).

%Separate head losses bends
H_loss_bend_U2a = K_bend_U2 * ((v_U2)/(2*g)); %[m] Head loss in bend U2a.
H_loss_bend_U2b = H_loss_bend_U2a; %[m] Head loss in bend U2b.
H_loss_bend_U3a1 = K_bend_U3 * ((v_U3)/(2*g)); %[m] Head loss in bend U3a1.
H_loss_bend_U3a2 = H_loss_bend_U3a1; %[m] Head loss in bend U3a2.
H_loss_bend_U3b1 = H_loss_bend_U3a1; %[m] Head loss in bend U3b1.
H_loss_bend_U3b2 = H_loss_bend_U3a1; %[m] Head loss in bend U3b2.
H_loss_bend_U4a = K_bend_U4 * ((v_U4)/(2*g)); %[m] Head loss in bend U4a.
H_loss_bend_U4b = H_loss_bend_U4a; %[m] Head loss in bend U4b.

%Combined head loss bends
H_loss_bends = H_loss_bend_U2a + H_loss_bend_U2b + H_loss_bend_U3a1 + H_loss_bend_U3a2 + H_loss_bend_U3b1 + H_loss_bend_U3b2 + H_loss_bend_U4a + H_loss_bend_U4b; %[m] Total head loss all bends. 

%% Total head loss
H_loss_umbilical_minor = (Dens_air/Dens_wat)*(H_loss_tees + H_loss_bends);

end

end

