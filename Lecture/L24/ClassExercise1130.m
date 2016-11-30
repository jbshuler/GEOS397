%% Class Exercise 11/30

% measured striation data
plunge = 45; % [deg]
trend = 230; % [deg]
% measured strike of plane
strike = 190; % [deg]

Nv = cosd(plunge)*cosd(trend);
Ev = cosd(plunge)*sind(trend);
Dv = sin(plunge);

Nu = cosd(0)*cosd(strike);
Eu = sin(strike)*cos(0);
Du = sin (0);

v = [Nv, Ev, Dv];
u = [Nu, Eu, Du];

theta = acosd(dot(v,u)/norm(v)/norm(u));

%%
% measured striation data
plunge = 22; % [deg]
trend = 320; % [deg]
% measured strike of plane
strike = 300; % [deg]
%%
% measured striation data
plunge = 30.3; % [deg]
trend = 182.1; % [deg]
% measured strike of plane
strike = 53; % [deg]