%% Homework 8    
% _*Taylor Dudunake & John Shuler*_
%
% GEOS597 Homework #8: GPS, streamflow data and statistics
%
% Due: 11/14/2016

clear all;
close all;
clc;
%% *Part 1: Automated GPS Data Processing*
allGPS_HW8
%% 1.4 Compare the best-fit polynomial
readtable('VelocityTable.xlsx')
%[V,map] = imread('VelocityTable_HW8.PNG', 'png');
%imshow(V,map);

% ANSWER QUESTION HERE

%% 1.7: Analyze the results
% ANSWER QUESTION HERE

%% *Part 2: Water-year data loading & visualization*
%% 2.1: Load the data, sort and plot
load('cavecreek.txt');
t1 = datetime(1953,9,1);
t2 = t1 + calmonths(1:216);

h = figure;
plot(t2, cavecreek);
xlabel('Time [year]')
ylabel('Runoff [inches/100]')
title('Monthly Runoff at Cave Creek, KY')

% ANSWER QUESTION HERE

%% 2.2: Reshape vector into a matrix and plot

B = reshape(cavecreek,[12,18]);
runoffArray = B';

h = figure;
imagesc(runoffArray);
xticks([1:2:12])
xticklabels({'Oct','Dec','Feb','Apr','Jun','Aug'})
yticks([1:2:18])
yticklabels({'1954','1956','1958','1960','1962','1964','1966','1968','1970'})
c = colorbar;
colormap(jet(20))
c.Label.String = 'Runoff [inches/100]'
title('Monthly Runoff at Cave Creek, KY')

%% 2.3: Median and Mean

for i = 1:12;
medianArray (1,i) = median(runoffArray(:,i))
meanArray (1,i) = mean(runoffArray(:,i))
end

monthArray = [1:1:12];
h = figure;
%bar (monthArray, [medianArray; meanArray]', 'stacked')
plot(monthArray, medianArray,'o','MarkerSize',10);
hold on;
plot(monthArray, meanArray,'x','MarkerSize',10);
title('Mean and Median Runoff at Cave Creek, KY')
legend('Median','Mean')
xticks([1:12])
xticklabels({'Oct','Nov','Dec','Jan','Feb','March','Apr','May','Jun','July','Aug','Sept'})
ylabel('Runoff [inches/100]')

%ANSWER QUESTION HERE

%% 2.4: Box and whisker plot of each month
h = figure;
boxplot(runoffArray);
xticks([1:12])
xticklabels({'Oct','Nov','Dec','Jan','Feb','March','Apr','May','Jun','July','Aug','Sept'})
title('Box and Whisker Plot of Runoff at Cave Creek, KY')
xticks([1:12])
xticklabels({'Oct','Nov','Dec','Jan','Feb','March','Apr','May','Jun','July','Aug','Sept'})
ylabel('Runoff [inches/100]')

% ANSWER QUESTION
