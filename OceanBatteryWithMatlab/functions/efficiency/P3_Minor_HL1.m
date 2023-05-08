function [HL1_minor_head_loss] = P3_Minor_HL1(k_cont_1,v27_2,g,N_bend90_1,...
    k_bend90_1,v22,k_elbow90_1,v32)
%% Minor head loss 1 calculation
    %Minor head loss of pipe section between entrance flexible reservoir (p2) and entrance turbine (p3).
    
%% No flow warning
if v27_2 <= 0
    HL1_minor_head_loss = 0; 
    return
end   

%% Contraction (1x)
HL1_contr_1 = k_cont_1 * (v27_2^2)/(2*g);

%% Bend 90 degrees (3x)
HL1_90bend_1 = N_bend90_1 * k_bend90_1 * (v22^2/(2*g));

%% Elbow 90 degrees (1x)
HL1_90elbowbend_1 = k_elbow90_1 * (v32^2/(2*g));

%% Flow sensor (1x)
%Ignoring the pressure loss cause by the flow sensor for this version, might be added later

%% Total minor head loss between sensor p2 and p3
HL1_minor_head_loss = HL1_90bend_1 + HL1_contr_1 + HL1_90elbowbend_1;

end