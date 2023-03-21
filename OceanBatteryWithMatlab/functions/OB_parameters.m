% %% Ocean Battery Parameters
% % In this script, most parameters for the system set.

Lout = OB_GUI_parameters.Lout; %[m] Total lenght outer segment rigid reservoir.
Lin = OB_GUI_parameters.Lin; %[m] Total lenght inner segment rigid reservoir.
D_rigid = OB_GUI_parameters.D_rigid; %[m] Inner diameter of the rigid reservoir.
Delta_t = OB_GUI_parameters.Delta_t; 
P_electrical = OB_GUI_parameters.P_electrical; %[W] Electrical input power.
N_motor = OB_GUI_parameters.N_motor; %[-] Efficiency of the motor.
N_pump = OB_GUI_parameters.N_pump; %[-] Efficiency of the pump.
N_turbine = OB_GUI_parameters.N_turbine; %[-] Efficiency of the turbine.
N_generator = OB_GUI_parameters.N_generator; %[-] Efficiency of the generator.
D_turbine = OB_GUI_parameters.D_turbine; %[m] Diameter of the turbine outlet.
L_pipeline_charging = OB_GUI_parameters.L_pipeline_charging; %[m] Total length of the pipeline during the charging phase.
L_pipeline_discharging = OB_GUI_parameters.L_pipeline_discharging; %[m] Total length of the pipeline during the discharging phase.
D_pipeline = OB_GUI_parameters.D_pipeline; %[m] Diameter of the pipeline.
Roughness_pipeline = OB_GUI_parameters.Roughness_pipeline; %[m] Absolute roughness pipeline.
D_bypass = OB_GUI_parameters.D_bypass; %[m] Diamter of the bypass.
L_bypass = OB_GUI_parameters.L_bypass; %[m] Length of the bypass. 
Roughness_bypass = OB_GUI_parameters.Roughness_bypass; %[m] Absolute roughness bypass.
Depth = OB_GUI_parameters.Depth; %[m] Depth of te system.
Dens_wat = OB_GUI_parameters.Dens_wat; %[kg/m^3] Density of water.
Visc_wat = OB_GUI_parameters.Visc_wat; %[Pa*s] Viscosity of water.
Dens_air = OB_GUI_parameters.Dens_air; %[kg/m^3] Density of air.
Visc_air = OB_GUI_parameters.Visc_air; %[Pa*s] Viscosity of air.
P_atm = OB_GUI_parameters.P_atm; %[Pa] Atmospheric pressure.
g = OB_GUI_parameters.g;%[m/s^2] Gravitational constant.
LU_1 = OB_GUI_parameters.L_U1; %[m] Length of segment 1 of the umbilical cord.
LU_2 = OB_GUI_parameters.L_U2; %[m] Length of segment 2 of the umbilical cord.
LU_3 = OB_GUI_parameters.L_U3; %[m] Length of segment 3 of the umbilical cord.
LU_4 = OB_GUI_parameters.L_U4; %[m] Length of segment 4 of the umbilical cord.
p_1 = OB_GUI_parameters.p_1; %[-] Dimensionless flow correction coefficient for segment 1 of the umbilical cord.
p_2 = OB_GUI_parameters.p_2; %[-] Dimensionless flow correction coefficient for segment 2 of the umbilical cord.
p_3 = OB_GUI_parameters.p_3; %[-] Dimensionless flow correction coefficient for segment 3 of the umbilical cord.
p_4 = OB_GUI_parameters.p_4; %[-] Dimensionless flow correction coefficient for segment 4 of the umbilical cord.
D_umbilical = OB_GUI_parameters.D_umbilical; %[m] Diameter of the umbilical cord.
Roughness_umbilical = OB_GUI_parameters.Roughness_umbilical; %[m] Absolute roughness umbilical cord. 
R_bend_umb = OB_GUI_parameters.R_bend_umb;
D_bend_umb = OB_GUI_parameters.D_bend_umb;
V_rigid_in = OB_GUI_parameters.V_rigid; %[m^3] volume inner part rigid reservoir
V_rigid_out = OB_GUI_parameters.V_rigid_out; %[m^3] volume outer part rigid reservoir
Capacity_rigid = OB_GUI_parameters.Capacity_rigid; %[m^3] total volume rigid reservoir
V_wat_rigid_start = OB_GUI_parameters.V_wat_rigid_start; %[m^3] Starting volume of the rigid reservoir. If the rigid reservoir is full, use "Capacity_rigid".
V_wat_rigid_end = OB_GUI_parameters.V_wat_rigid_end; %[m^3] End volume of the rigid reservoir. Set to zero if the rigid reservoir needs to be emtied.
V_wat_bladder_end = OB_GUI_parameters.V_wat_bladder_end; %[m^3] End volume of the bladder. Set to zero if the bladder needs to be emptied. 
t_open_ball_valve = OB_GUI_parameters.t_open_ball_valve; %[s] Time it takes to fully open the ball valve.

% Load test parameters into structure array
V_wat_rigid_end = 0.30129; %[m^3] End volume of the rigid reservoir. 
V_tank_start = 1.2*1*0.415; %[m^3] Starting volume of the water in the tank. 
A_tank = 1.2*1; %[m^2] Surface area of the tank.
h1 = 4.295; %[m] Bottom tank to floor.
h2 = 0.475; %[m] Bottom rigid reservoir to floor.
        
D_pipeline_test = 0.0426; %[m] Diameter of the pipeline from the test setup.
Roughness_pipeline_test = 0.0015e-3; %[m] Absolute roughness of the pipeline from the test setup.
L_pipeline_test = 4.175; %[m] Length of the pipeline from the test setup.V_wat_rigid_end = 0.30129; %[m^3] End volume of the rigid reservoir. 
      

% 
% %%  Size parameters
% Lout = 7.774; %[m] Total lenght outer segment rigid reservoir.
% Lin = 2.591; %[m] Total lenght inner segment rigid reservoir.
% D_rigid = 0.315; %[m] Inner diameter of the rigid reservoir.
% 
% %% Accuracy parameters
% %   Set the accuracy of the model here.
% %   0.1      = timestep equal to one deci-second.
% %   0.01     = timestep equal to one centi-second.
% %   0.001    = timestep equal to one milli-second.
% Delta_t = 0.1; 
% 
% %% Pump, turbine, motor and generator parameters
% P_electrical = 78.78; %[W] Electrical input power.
% N_motor = 1; %[-] Efficiency of the motor.
% N_pump = 0.4181; %[-] Efficiency of the pump.
% N_turbine = 0.2; %[-] Efficiency of the turbine.
% N_generator = 1; %[-] Efficiency of the generator.
% D_turbine = 0.034; %[m] Diameter of the turbine outlet.
% 
% %% Pipeline parameters
% L_pipeline_charging = 3.77; %[m] Total length of the pipeline during the charging phase.
% L_pipeline_discharging = 4.318; %[m] Total length of the pipeline during the discharging phase.
% D_pipeline = 0.034; %[m] Diameter of the pipeline.
% Roughness_pipeline = 0.0015e-3; %[m] Absolute roughness pipeline.
% 
% %% Bypass parameters
% D_bypass = 0.05; %[m] Diamter of the bypass.
% L_bypass = 0.579; %[m] Length of the bypass. 
% Roughness_bypass = 0.0015e-3; %[m] Absolute roughness bypass.
% 
% %% External parameters
% Depth = 5; %[m] Depth of te system.
% Dens_wat = 999.15; %[kg/m^3] Density of water.
% Visc_wat = 0.001; %[Pa*s] Viscosity of water.
% Dens_air = 1.2; %[kg/m^3] Density of air.
% Visc_air = 1.865e-5; %[Pa*s] Viscosity of air.
% P_atm = 101325; %[Pa] Atmospheric pressure.
% g = 9.81;%[m/s^2] Gravitational constant.
% 
% %% Umbilical cord parameters
% L_U1 = 10; %[m] Length of segment 1 of the umbilical cord.
% L_U2 = 0.6; %[m] Length of segment 2 of the umbilical cord.
% L_U3 = 0.4; %[m] Length of segment 3 of the umbilical cord.
% L_U4 = 0.4; %[m] Length of segment 4 of the umbilical cord.
% 
% p_1  = 1; %[-] Dimensionless flow correction coefficient for segment 1 of the umbilical cord.
% p_2  = 1/2; %[-] Dimensionless flow correction coefficient for segment 2 of the umbilical cord.
% p_3  = 3/8; %[-] Dimensionless flow correction coefficient for segment 3 of the umbilical cord.
% p_4  = 1/8; %[-] Dimensionless flow correction coefficient for segment 4 of the umbilical cord.
% 
% D_umbilical = 0.025; %[m] Diameter of the umbilical cord.
% Roughness_umbilical = 0.0015e-3; %[m] Absolute roughness umbilical cord. 
% 
% R_bend_umb = 0.03;
% D_bend_umb = 0.02;
% 
% %% Initial calculations
% %   It is preferred not to execute calculattions here. If it is possible,
% %   these equations will be moved to another function. DO NOT CHANGE.
% 
% V_rigid_in = pi*(0.5*D_rigid)^2*Lin; %[m^3] volume inner part rigid reservoir
% V_rigid_out = pi*(0.5*D_rigid)^2*Lout; %[m^3] volume outer part rigid reservoir
% Capacity_rigid = V_rigid_in + V_rigid_out; %[m^3] total volume rigid reservoir
% 
% %% Test parameters
% V_wat_rigid_start = Capacity_rigid; %[m^3] Starting volume of the rigid reservoir. If the rigid reservoir is full, use "Capacity_rigid".
% V_wat_rigid_end = 0; %[m^3] End volume of the rigid reservoir. Set to zero if the rigid reservoir needs to be emtied.
% V_wat_bladder_end = 0; %[m^3] End volume of the bladder. Set to zero if the bladder needs to be emptied. 
% 
% %% Other system parameters
% t_open_ball_valve = 12; %[s] Time it takes to fully open the ball valve.
% 
% %% Change parameters to GUI input if aplicapble
% P_electrical=OB_GUI_parameters.P_electrical;
% N_pump=OB_GUI_parameters.N_pump;
% N_turbine = OB_GUI_parameters.N_turbine;
% Depth = OB_GUI_parameters.Depth;
% Lout = OB_GUI_parameters.Lout;
% Lin = OB_GUI_parameters.Lin;
% D_rigid = OB_GUI_parameters.D_rigid;
% L_pipeline_discharging = OB_GUI_parameters.L_pipeline_discharging;
% D_pipeline = OB_GUI_parameters.D_pipeline;
% L_pipeline_charging = OB_GUI_parameters.L_pipeline_charging;
% % D_pipeline_test = OB_GUI_parameters.D_pipeline_test;
% 
