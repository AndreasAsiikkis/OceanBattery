function[h] = P9_VRIGID_Full(V,D_rigid,r_rigid,Cap_rigid,L_rigid)
%% Water level Rigid Reservoir
    % Function to determine the water level over time in the rigid reservoir.
    % Find root of nonlinear function
    
% Function = (  % Area of Sector                     -  % Area of triangle                  * Length of reservoir) - % Volume
myFun = @(h,V) (((acos((r_rigid-h)/r_rigid))*r_rigid^2 - (r_rigid-h)*(sqrt(2*h*r_rigid-h^2))) * L_rigid)              -  V;

% Initial estimation of water level (use as initial input for fzero)
range = 5;

if (V/Cap_rigid)*D_rigid-range < 0 
    hi = [0 (V/Cap_rigid)*D_rigid+range];
    
elseif (V/Cap_rigid)*D_rigid+range > D_rigid
    hi = [(V/Cap_rigid)*D_rigid-range D_rigid];
    
else
    hi = [(V/Cap_rigid)*D_rigid-range (V/Cap_rigid)*D_rigid+range];
    
end

% Determining height, find root of nonlinear function
h = fzero_2(myFun,hi,[],V);
end