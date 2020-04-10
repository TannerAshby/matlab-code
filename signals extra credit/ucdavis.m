clear
clc

c1=1209;
c2=1336;
c3=1477;
r1=697;
r2=770;
r3=852;
r4=941;

fs = 8000 %sampling frequency
t=[0:(1/fs):.25];% 1/fs is sampling period. 0 to .25 is the length of tone in seconds
A1=.5;
p1=0;
A2=.5;
p2=0;
tone=A1*cos(2*pi*r1.*t+p1) + A2*cos(2*pi*c1.*t+p2);


% this is the beginning of UC DAVIS code


% Subplot 1: time signal
%
figure;
subplot(2,1,1);
plot(t,tone,'g')
%
% limit to first 0.015 s
%
axis([0 0.015 -1 1]);
xlabel('t(s)');
title('Tone for 5 button');
%
% Subplot 2: Fourier series
%
subplot(2,1,2)
%
% Compute Fourier series
%
p = abs(fft(tone)); % not sure if the built in function of "fast fourier transform" is allowed. Need to check on this

summing = sum(p); % extra stuff ignore this
fprintf('the sum of all p values is  %4.2f: ',summing)% extra stuff ignore this
n = length(tone); % you take the length of the  tone, which is 2001
%
% Get corresponding frequency values
%
f = (0:n-1)*(fs/n);
plot(f,p);
axis([500 1700 0 300]);
%
% Find peak position
%
[peak_amp peak_loc]=findpeaks(p,'Minpeakheight',200);
%
% peak_loc is in point; convert to frequency
%
freq=f(peak_loc);
%
% Only keep values in DTMF range
%
peak_freq=freq(freq < 1700);
peak_height = peak_amp(freq < 1700);
%
hold on
str=num2str(int32(peak_freq));
text(peak_freq(1),peak_height(1),str(1))
text(peak_freq(2),peak_height(2),str(2))

% we need to code to have peak values displayed somewhere. 
