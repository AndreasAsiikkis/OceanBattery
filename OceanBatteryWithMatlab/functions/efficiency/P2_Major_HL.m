function [HL_major] = P2_Major_HL(L,D,v,g,f)
%% P2_Major_HL_funct
%Major head loss calculation

%% No flow warning
if v <= 0
    HL_major = 0;
    return
end

%% Major head loss
HL_major = f*(L/D)*(v^2/(2*g));

end