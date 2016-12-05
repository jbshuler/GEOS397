fs = 1/(15*60);               % sampling frequency in Hz
N = length(pit1Moisture)-1;
nfft = 2^nextpow2(N);
subset = pit1Moisture(8000:10000,1:5);

figure;
for i = 1:5;
    A = detrend(subset(:,i),'constant');
    B = detrend((A),'linear');
    [Pxx,f] = periodogram(B,[],nfft,fs);
    subplot(1,5,i)
    plot(f,Pxx);
    grid on;
    xlabel('Freq. [Hz]');
    xlim([0 1/(12*3600)])
    ylabel('Power')
end