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
%% 1.4 Compare the best-fit polynomial
% Overall, the estimated values of average motion remain consistent and the vast majority
% are within 0.1 cm/yr of the compared values for all directions.
% In light of these small discrepancies, polyfit is theoretically more accurate becuse it is estimating all 
% values rather than just the beginning and end points. In more variable data,
% we suspect this difference would be more pronounced. The largest
% discrepancies were in the vertical motion estimates, which were also the
% lowest in magnitude. These lower values may be approaching the low end of
% sensor range. Similarly, perhaps vertical motion is systematically more
% difficult to detect than horizontal motion.

[V,map] = imread('VelocityTable_HW8.PNG', 'png');
imshow(V,map);


%% 1.6: Process all of the data
allGPS_HW8

%% 1.7: Analyze the results
% Residual time series data shows sinusoidal variations in plate motion. When plotted as histograms, these data most nearly approximate a normal distribution.
% The histograms make sense given the general trends observed in the plots
% of residual movement versus time and analysis of the velocity table data .Vertical residual values tend to have
% greater variability about the trend line as the histograms show a greater spread for the
% vertical residuals.
% The eastern and northern direction residuals tend to have less
% variability and are more clustered around zero residual motion because the polynomial
% fit is much better. A few stations show northern residuals that appear bimodally distributed, which may be better addressed with higher order polynomials. 
% Generally, the first order polynomial did an adequate job of detrending
% the plate movement data.
% If the bins were smaller, the normal distributions
% would become smoother. Conversely, coarser bin sizes would decrease the
% appearance of a normal distribution of the residual data and likely make
% interpretation more difficult. The chosen number of bins seems
% appropriate in this instance.
%% *Part 2: Water-year data loading & visualization*
%% 2.1: Load the data, sort and plot
% This data needs to be sorted chronologically because the raw format is 
% organized by water year from Oct 1 - Sept 31 (Table 1 in the HW doc), 
% rather than from January to December.

load('cavecreek.txt');
tEnd = datetime(1953, 9, 1) + calmonths(1:3);
tBeg = datetime(1953, 0, 1) + calmonths(1:9);
tfirst = [tEnd tBeg];
tfinal(1,:) = tfirst;

for i=1:17;
    tfinal(i+1,:) = tfirst + calyears(i);
end

tfinal2 = tfinal';
tArray = (reshape(tfinal2,1,216))';

[tArraysorted, SortIndex] = sort(tArray);
cavecreeksorted = cavecreek(SortIndex);

h = figure;
plot(tArraysorted, cavecreeksorted);
xlabel('Time [year]')
ylabel('Runoff [inches/100]')
title('Monthly Runoff at Cave Creek, KY')

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
% Mean and median runoff values do not match because the mean is influenced
% by outliers in the data moreso than is median. Particularly high or low
% runoff years can skew the mean, while only marginally affecting median.
% In this dataset, the mean for all months is greater than or roughly equal to the median, except
% in March, where the opposite was true.

for i = 1:12;
medianArray (1,i) = median(runoffArray(:,i))
meanArray (1,i) = mean(runoffArray(:,i))
end

monthArray = [1:1:12];

h = figure;
plot(monthArray, medianArray,'o','MarkerSize',10);
hold on;
plot(monthArray, meanArray,'x','MarkerSize',10);
title('Mean and Median Runoff at Cave Creek, KY')
legend('Median','Mean')
xticks([1:12])
xticklabels({'Oct','Nov','Dec','Jan','Feb','March','Apr','May','Jun','July','Aug','Sept'})
ylabel('Runoff [inches/100]')


%% 2.4: Box and whisker plot of each month
% Box and whisker plots display this data with more statisical information.
% The central 50% of the data is bounded by the boxes. The median is
% represented by the red line in each box. The 75-100% quartile and the
% 0-25% quartiles are representd by the 'whiskers' on the two ends of each
% box. The small crosses represent outlie values not included in the box and
% whisker construction. 
%
% Our plot shows March to be by far the wettest month of the year at Cave
% Creek, though it has also the widest spread in values. The median values
% for each month appear to be normally distributed. The range of values in
% the drier months (June-November) is markedly lower than the months with
% greater runoff (December-May). There are more outlier values in the drier
% months as well.

h = figure;
boxplot(runoffArray);
xticks([1:12])
xticklabels({'Oct','Nov','Dec','Jan','Feb','March','Apr','May','Jun','July','Aug','Sept'})
title('Box and Whisker Plot of Runoff at Cave Creek, KY')
xticks([1:12])
xticklabels({'Oct','Nov','Dec','Jan','Feb','March','Apr','May','Jun','July','Aug','Sept'})
ylabel('Runoff [inches/100]')


