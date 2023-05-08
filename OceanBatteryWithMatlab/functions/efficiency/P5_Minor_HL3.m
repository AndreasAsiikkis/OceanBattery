function [HL3_minor_head_loss] = P5_Minor_HL3(HL3_BV_k,HL3_90elbow_k,HL3_enl_k,...
    v23_9,v27_2,v32,HL3_90elbow_n,g)
%% Minor head loss 3
    %Minor head loss of pipe section between exit turbine (p4) and entrance rigid reservoir (p5).
    
%% No flow warning
if v23_9 <= 0
    HL3_minor_head_loss = 0;
    return
end   

%% Ball valve
HL3_BV_3 = HL3_BV_k * (v23_9^2/(2*g));

%% Elbow 90 degrees (2x)
HL3_elbow90_3 = HL3_90elbow_n * HL3_90elbow_k * (v32^2/(2*g));

%% Enlargement (1x)
HL3_enl_3 = HL3_enl_k *(v27_2^2/(2*g));

%% Minor head loss between sensor 3 and exit
HL3_minor_head_loss = HL3_BV_3+HL3_elbow90_3+HL3_enl_3+HL3_BV_3;

end