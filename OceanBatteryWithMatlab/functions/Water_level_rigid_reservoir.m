function [water_level_rigid] = Water_level_rigid_reservoir (V_wat_rigid, D_rigid, Capacity_rigid)
%% Water level rigid reservoir
%   This function calculates the water level in the rigid reservoir.

if V_wat_rigid == 0
    water_level_rigid = 0;
    return
end

%% Volume fraction
V_fraction= V_wat_rigid/Capacity_rigid; %[-] Fraction between the volume of the water in the tank and the capacity of the tank.

%% Vector setup #1
%   Generates a vector with the relative hight (height/inner diameter)with
%   equal length as the V_fraction_table vector.
B = linspace(0.001,1,1000);

%% Vector setup #2
%   Creates a vector with volume fractions (Barderas & Rodea, 2016)
V_fraction_table = [0 0.00169 0.00477 0.00874 0.01342 0.01869 0.02450 0.03077 0.03748 0.04458 0.05204 0.05985 0.06797 0.07639 0.08509 0.09406 0.10327 0.11273 0.12240 0.13229 0.14238 0.15266 0.16312 0.17375 0.18455 0.19550 0.20660 0.21784 0.22921 0.24070 0.25231 0.26348 0.27587 0.28779 0.29981 0.31192 0.32410 0.33636 0.34869 0.36108 0.37353 0.38603 0.39858 0.41116 0.42379 0.43644 0.44912 0.46182 0.47454 0.48727 0.50000 0.51273 0.52546 0.53818 0.55088 0.56356 0.57621 0.58884 0.60142 0.61397 0.62647 0.63892 0.65131 0.66364 0.67590 0.68808 0.70019 0.71221 0.72413 0.73652 0.74769 0.75930 0.77079 0.78216 0.79340 0.80450 0.81545 0.82625 0.83688 0.84734 0.85762 0.86771 0.87760 0.88727 0.89673 0.90594 0.91491 0.92361 0.93203 0.94015 0.94796 0.95542 0.96252 0.96923 0.97550 0.98131 0.98658 0.99126 0.99523 0.99831 1.000];
idx = 1:length(V_fraction_table);
idx_new = 1:0.1:length(V_fraction_table);

V_fraction_table_new = interp1(idx,V_fraction_table,idx_new);    
V_fraction_table_new(1) = [];

%% Water level calculation
[~,index_V_fraction] = min(abs(V_fraction_table_new - V_fraction)); %Gives the index number of the volume fraction from V_fraction_table_new, that is closest to the caculated volume fraction.
water_level_rigid = B(index_V_fraction) * D_rigid; %[m] Calculates the water hight in the rigid reservoir.  
end