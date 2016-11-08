<<<<<<< HEAD
%% Homework 7    
% _*Javier Colton & John Shuler*_
%
% Due: 11/4/2016
%% *Part 1: Volume of Earth's Layers*
%% 1.1: A function for the volume of a sphere

clc;
clear all;
close all;

% A sample use of sphereVolume.m:

r = 2;
Volume = sphereVolume(r);

%% 1.2: Ensuring valid function inputs
%
% We used the following input tests:
%
% if r==0
%
%    error('Error. r cannot equal zero.')
%
% end
%
% if r<0
%
%    error('Error. r cannot be a negative value.')

%% 1.3: Another function for the thickness of Earth's layers

% earthLayers.m was created as directed and is implemented in Step 1.4.

%% 1.4: Compute the volume of each layer
=======
%Homework 7    _%Javier Colton & John Schuler%_
%% Part 1: Volume of Earth's Layers

clc
clear all
>>>>>>> origin/GEOS_Shuler

[crust,mantle,core]=earthLayers;

volCore=sphereVolume(core);
volMantle=sphereVolume(core+mantle)-volCore;
volCrust=sphereVolume(crust+core+mantle)-volMantle-volCore;
<<<<<<< HEAD
volPlanet=sphereVolume(crust+core+mantle);

%% 1.5: Compute each layer's percentage of Earth's total volume

pctVol=@(V)(V/volPlanet)*100;
=======
volEarth=sphereVolume(crust+core+mantle);


pctVol=@(V)(V/volEarth)*100;
>>>>>>> origin/GEOS_Shuler

pctVolCore=pctVol(volCore);
pctVolMantle=pctVol(volMantle);
pctVolCrust=pctVol(volCrust);

<<<<<<< HEAD
%% 1.6: Formatted output of computation results

fprintf('Volume of Core:   %.2e [km^3] \n',volCore)
fprintf('Volume of Mantle: %.2e [km^3] \n',volMantle)
fprintf('Volume of Crust:  %.2e [km^3] \n',volCrust)
fprintf('Core:   %.1f [%%] \n',pctVolCore)
fprintf('Mantle: %.1f [%%] \n',pctVolMantle)
fprintf('Crust:  %.1f  [%%] \n', pctVolCrust)

%% 1.7: Plotting a Pie chart
=======
fprintf('Volume of Core: %.2e [km^3] \n',volCore)
fprintf('Volume of Mantle: %.2e [km^3] \n',volMantle)
fprintf('Volume of Crust: %.2e [km^3] \n',volCrust)
fprintf('Core: %.1f [%%] \n',pctVolCore)
fprintf('Mantle: %.1f [%%] \n',pctVolMantle)
fprintf('Crust: %.1f [%%] \n', pctVolCrust)

>>>>>>> origin/GEOS_Shuler

layerPct=[pctVolMantle pctVolCrust pctVolCore];
labels={'Mantle: 82.0%', 'Crust: 1.6%', 'Core: 16.4%'};
explode=[1 1 1];
pie(layerPct,explode,labels)
colormap(summer);
<<<<<<< HEAD
title('Percent Volume of Earth Layers');

%% 2.5: Process all of the data
allGPS


=======
title('Percent Volume of Earths Layers');
%% *Step: 3 Process the GPS data*

% The following were calculated from the GPS data:
%
% * *Station Name: 


%% Part 2 Automated GPS Data Processing
ana1 = getGPSdata('ana1CleanUnf.neu');
>>>>>>> origin/GEOS_Shuler
