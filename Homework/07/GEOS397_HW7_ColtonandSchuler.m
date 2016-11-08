%Homework 7    _%Javier Colton & John Schuler%_
%% Part 1: Volume of Earth's Layers

clc
clear all

[crust,mantle,core]=earthLayers;

volCore=sphereVolume(core);
volMantle=sphereVolume(core+mantle)-volCore;
volCrust=sphereVolume(crust+core+mantle)-volMantle-volCore;
volEarth=sphereVolume(crust+core+mantle);


pctVol=@(V)(V/volEarth)*100;

pctVolCore=pctVol(volCore);
pctVolMantle=pctVol(volMantle);
pctVolCrust=pctVol(volCrust);

fprintf('Volume of Core: %.2e [km^3] \n',volCore)
fprintf('Volume of Mantle: %.2e [km^3] \n',volMantle)
fprintf('Volume of Crust: %.2e [km^3] \n',volCrust)
fprintf('Core: %.1f [%%] \n',pctVolCore)
fprintf('Mantle: %.1f [%%] \n',pctVolMantle)
fprintf('Crust: %.1f [%%] \n', pctVolCrust)


layerPct=[pctVolMantle pctVolCrust pctVolCore];
labels={'Mantle: 82.0%', 'Crust: 1.6%', 'Core: 16.4%'};
explode=[1 1 1];
pie(layerPct,explode,labels)
colormap(summer);
title('Percent Volume of Earths Layers');
%% *Step: 3 Process the GPS data*

% The following were calculated from the GPS data:
%
% * *Station Name: 


%% Part 2 Automated GPS Data Processing
ana1 = getGPSdata('ana1CleanUnf.neu');
