function [HL2_minor_head_loss] = P4_Minor_HL2(N_bend90_2,N_elbow90_TU,N_cont_TU,N_enl_TU,...
    HL2_90bend_k,HL2_Sbend_k,HL2_TU_90elbowbend_k,HL2_90elbowbend_k,HL2_TU_TBR_k,HL2_TU_TLI_k,...
    HL2_TU_contr_k,HL2_TU_enl_k,v4_1_1_3,v17_5_1_3,v22,v27_2_1_3,v32,v32_1_3,v32_2_3,g)
%% Minor head loss 2
     %Minor head loss of pipe section between entrance turbine (p3) and exit turbine (p4) including the pipe section losses in the turbine system.
    
%% No flowv warning
if v22 <= 0
    HL2_minor_head_loss = 0; 
    return
end   

%% Bend 90 degrees (5x)
HL2_bend90_2 = N_bend90_2*HL2_90bend_k*(v22^2/(2*g));

%% Turbine unit (1x)
%Tee 1 branch and line
HL2_T1BR = HL2_TU_TBR_k*(v17_5_1_3^2/(2*g));
HL2_T1LI = HL2_TU_TLI_k*(v32_2_3^2/(2*g));              

%Tee 2 branch and line
HL2_T2BR = HL2_TU_TBR_k*(v17_5_1_3^2/(2*g));
HL2_T2LI = HL2_TU_TLI_k*(v32_1_3^2/(2*g));            

%Tee 3 branch and line
HL2_T3BR = HL2_TU_TBR_k*(v27_2_1_3^2/(2*g));
HL2_T3LI = HL2_TU_TLI_k*(v32_2_3^2/(2*g));             

%Tee 4 branch and line
HL2_T4BR = HL2_TU_TBR_k*(v27_2_1_3^2/(2*g));
HL2_T4LI = HL2_TU_TLI_k*(v32^2/(2*g));                  

%Elbows (2x)
HL2_elbow90_TU = N_elbow90_TU * HL2_TU_90elbowbend_k * (v32_1_3^2/(2*g));

%Contractions (3x)
HL2_cont_TU = N_cont_TU * HL2_TU_contr_k * (v4_1_1_3^2/(2*g));

%Enlargements (3x)
HL2_enl_TU = N_enl_TU * HL2_TU_enl_k * (v4_1_1_3^2/(2*g));

%Total head loss TU
HL2_TU = HL2_T1BR+HL2_T1LI+HL2_T2BR+HL2_T2LI+HL2_T3BR+...
    HL2_T3LI+HL2_T4BR+HL2_T4LI+HL2_elbow90_TU+HL2_cont_TU+...
    HL2_enl_TU;

%% S-bend (1x)
HL2_sbend_2 = HL2_Sbend_k*(v22^2/(2*g));

%% Elbow 90 degrees (1x)
HL2_elbow90_2 = HL2_90elbowbend_k * (v32^2/(2*g));

%% Minor head loss between sensor p3 and p4
HL2_minor_head_loss = HL2_bend90_2+HL2_TU+HL2_sbend_2+HL2_elbow90_2;

end