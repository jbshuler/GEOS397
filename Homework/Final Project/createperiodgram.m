function [] = createperiodgram (X)
fs = 1/(15*60);               % sampling frequency in Hz
N = length(X)-1;
nfft = 2^nextpow2(N);
[Pxx,f] = periodogram(X,[],nfft,fs);
% figure;
% plot(f,Pxx); grid on;
% xlabel('Frequency [Hz]');
% ylim([0 1000]);
% title('Periodogram: Moisture 5 cm')