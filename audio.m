load('z1.mat');
load('z2.mat');
fIn = z1;
fs = 44100;

%% Play original signal
% sound(fIn,fs);

%% Plot the frequency spectrum
N = length(fIn);
df = fs / N ;  % scaling here ?
w = (-(N/2):(N/2)-1) * df;
y = abs(fftshift(fft(fIn))) / N; % scaling here ?
% figure;
% plot(w,y);
% xlim([-10000,10000])
% N = 10, Fo = 13504 Hz

%% Bandpass filter that filters out between 550 to 13500 Hz
n = 8; % 5->8
beginFreq = 550 / fs;
endFreq = 13500 / fs;
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');

%% Filter the signal
fOut = filter(b, a, fIn) * 10;

%% Plot filtered signal
% figure;
% plot(w,fOut);
% xlim([0,10000]);

%% Play new signal
% sound(fOut,fs);
% audiowrite('female.wav',fOut,fs);