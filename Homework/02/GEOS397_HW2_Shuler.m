%% 
% John Shuler
%
% GEOS597 Homework #1: GIT, Markdown and MATLAB
%
% Due: 9/02/2016

close all;
clear all;
clc;
%% Problem 1: Variables and time
%
% A)
time = clock;
size (time);
%
% Time is a 1 x 6 row vector. Time contains, in order: year, month, date, hour, 
% and minute data. Time is classified as a double variable.
%
% B)
yearString = datestr (time,'yyyy');
%% Problem 2: Plotting sine and cosine waves
% A) 
tArray=linspace(0,1,1001);
% The sample interval is 0.001 sec.
% B)
f = 5;          % [Hz]
% C)
w = 2*pi*f;     % angular frequency in [rad/sec]
% D)
sineArray = sin(w*tArray);
cosArray  = cos(w*tArray);
% E)
figure (1);
plot (tArray, sineArray,'--');
hold on;
plot (tArray, cosArray);
xlabel ('time(sec)');
ylabel ('y(t)');
% F)
legend('sin (t)','cos (t)','Location','northeastoutside');
% G)
axis ([0 1 -1.5 1.5]);
% H)
grid on
% I)
% It appears we successfully plotted 5 Hz sine and cosine waves, as each
% wave moves through 5 cycles over the course of 1 second. The sine and
% cosine waves are identical in shape, but out of phase by .05 sec.
%
% J) 
% Wave amplitude = 1.
%
% K)
% We could change the amplitudes by multiplying our sine and cosine waves
% by some coefficient > 1 as shown below:
figure (2);
plot (tArray,2*sineArray,'--');
hold on;
plot (tArray, 2*cosArray);
xlabel ('time(sec)');
ylabel ('y(t)');
legend('2 sin (t)','2 cos (t)','Location','northeastoutside');
axis ([0 1 -2.5 2.5]);
grid on;

%% Problem 3: Population growth
% A)
initialRabbits = 2;
dt = 1;
% B)
maxGestation = 8;
growthRate = 0.6;

% C)
n = 1;
rabbitPopulation = zeros(2,9);
while n <= maxGestation;
    rabbitPopulation(1,n) = n;
    rabbitPopulation(2,1) = initialRabbits;
    rabbitPopulation(2,n+1) = rabbitPopulation(2,n) + growthRate*rabbitPopulation(2,n)*dt;
    n = n+1;
end

rabbitPopulation(1,9)=9;

% D)
figure (3);
subplot (1,2,1);
plot (rabbitPopulation(1,:),rabbitPopulation(2,:));
xlabel ('Generation')
ylabel ('Rabbit Population')
title ('Rabbit Population: Growth Rate = 0.6');
grid on;
hold on;
subplot (1,2,2);
plot (rabbitPopulation(1,:),log10(rabbitPopulation(2,:)));
xlabel ('Generation')
ylabel ('log10 Rabbit Population')
grid on;
title ('Rabbit Population: Growth Rate = 0.6');

% E) 
%
% Varying the value of the growth rate from 0.1 to 0.9, varies the final
% rabbit population after eight generations from ~5 to ~350. Clearly the
% value of the growth rate has a strong influence on rabbit populations.
%
% F)
%
% According to the Merck Manual (2011), average rabbit gestation period is
% ~ 31 days. This means that there are between 11 - 12 gestation units per
% calender year. Running the model above with a growth rate of 1 and 11 
% gestation units per year, predicts a rabbit population of 4096.

maxGestation = 11;
growthRate = 1;

% C)
n = 1;
rabbitPopulation = zeros(2,12);
while n <= maxGestation;
    rabbitPopulation(1,n) = n;
    rabbitPopulation(2,1) = initialRabbits;
    rabbitPopulation(2,n+1) = rabbitPopulation(2,n) + growthRate*rabbitPopulation(2,n)*dt;
    n = n+1;
end

rabbitPopulation(1,12)=12;
figure (4);
subplot (1,2,1);
plot (rabbitPopulation(1,:),rabbitPopulation(2,:));
xlabel ('Generation')
ylabel ('Rabbit Population')
title ('Rabbit Population in One Year: Growth Rate = 1');
grid on;
hold on;
subplot (1,2,2);
plot (rabbitPopulation(1,:),log10(rabbitPopulation(2,:)));
xlabel ('Generation')
ylabel ('log10 Rabbit Population')
title ('Rabbit Population in One Year: Growth Rate = 1');
grid on;






