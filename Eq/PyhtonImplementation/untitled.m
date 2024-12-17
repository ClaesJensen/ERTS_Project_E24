%% Read audio file
filename = "MetalPipe.wav";
[x, fs] = audioread(filename);

x1 = x(:,1);
x2 = x(:,2);

%% Create notch filter
% Note the notch filter is create on behalf of the equations
% presented/calculated in "Notch filter.mcdx".

% Create filter coefficients
f0 = 1000; %hz
Q = 0.7071;
dbGain = -10;

% Note that f0 is the target frequency for the filter.

r_n = 1; % Nullpoint unit circle distance.
r_p = 0.9; %Pole unit circle distance.


A = 10^(dbGain/40);
w0 = 2 * pi * f0/fs;
alpha = sin(w0) / (2 * Q);

tb0 = 1 + alpha * A;
tb1 = -2 * cos(w0);
tb2 = 1 - alpha * A;
ta0 = 1 + alpha / A;
ta1 = -2*cos(w0);
ta2 = 1 - alpha / A;

b0 = 1.0052049360202202;
b1 = -1.999828655148014;
b2 = 0.9947950639797797;
a0 = 1.0164594528993485;
a1 = -1.999828655148014;
a2 = 0.9835405471006516;




b = [b0, b1, b2];
a = [a0, a1, a2];
figure(6)
zplane(b, a)
figure(7)
freqz(b,a, 1024, fs/2*pi)


%% Filter:
% See mathcad prime document "Notch filter.mcdx" for equations.
% y(n) = b0*x(n) - b1*x(n-1) + b2*x(n-2) + a1*y(n-1) - a2*y(n-2)

filter_y_offset = 2;
filter_x_offset = 2;

y1 = zeros(length(x1)+filter_y_offset, 1);
y2 = zeros(length(x1)+filter_y_offset, 1);

pre = 5;

for n = (1 + filter_y_offset):length(x1)
    % y(n) = b0*x(n) + b1*x(n-1) + b2*x(n-2) - a1*y(n-1) - a2*y(n-2); %Prob negative a1 and a2 in the difference equation and in the coefficients a1 and a2.
    %y(n) = b0*x(n) + b1*x(n-1) + b2*x(n-2) - a1*y(n-1) - a2*y(n-2);
    y1(n) = b0/a0 * x1(n) + b1/a0 * x1(n-1) + b2/a0 * x1(n-2) - a1/a0 * y1(n-1) - a2/a0*y1(n-2);
    y2(n) = b0/a0 * x2(n) + b1/a0 * x2(n-1) + b2/a0 * x2(n-2) - a1/a0 * y2(n-1) - a2/a0*y2(n-2);
end

figure(1);
plot(x1);

figure(2);
plot(y1);

%% fft
h = fft(x1);
figure(3);
plot(abs(h))

h2 = fft(y1);
figure(4);
plot(abs(h2))


%% playback raw
sound([x1, x2], fs)


%% playback filtered
sound([y1, y2], fs)

