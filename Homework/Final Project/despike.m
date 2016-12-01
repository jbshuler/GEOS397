function data = despike( data, limit )
%
% USAGE: data = despike( data, limit )
% 
% Description: This despiking function removes data dropouts
%
% This function finds all spikes (i.e. dropouts), sets them to NaN. Then it
% sets the  neighbors of each spike to NaN and interpolates between the
% remaining  data to fill in the NaNs. This is a more accurate method to
% just taking the average of the neighbors when there are multiple spikes
% in a row. 
%
% INPUT:
%   data  = input data vector
%   limit = the dropout value (e.g. -9999)
% OUPUT:
%   data  = output data vector after despiking.

% Written by: Dylan Mikesell (dylanmikesell@boisestate.edu)
% Last modified: 23 September 2016

% determine spike (i.e. dropout) locations
spikeIdx = data == limit;

data(spikeIdx) = NaN; % set spikes to NaN

% find indices on each side of NaNs
minusIdx = ( diff(spikeIdx) == -1 );
plusIdx =  ( diff(spikeIdx) == +1 );
% set those edges to NaN as well
data(minusIdx) = NaN; % set edges of spikes to NaN
data(plusIdx)  = NaN; % set edges of spikes to NaN

% interpolate in 1D to remove the NaN values
data(isnan(data)) = interp1( find(~isnan(data)), data(~isnan(data)), find(isnan(data)), 'pchip'); 

return