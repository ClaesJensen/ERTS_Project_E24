% Generate data
fs = 48000;
duration = 1;
t = [1/fs:1/fs:duration];

%% Create notch filter
% Note the notch filter is create on behalf of the equations
% presented/calculated in "Notch filter.mcdx".

% Create filter coefficients
f0 = 1000; %hz
Q = 2;
%BW = 3; % In Octaves!
dbGain = -10; % Does not matter in a notch filter!

% Note that f0 is the target frequency for the filter.

r_n = 1; % Nullpoint unit circle distance.
r_p = 0.9; %Pole unit circle distance.


A = 10^(dbGain/40);
w0 = 2 * pi * f0/fs;
alpha = sin(w0) / (2 * Q); %Q
%alpha = sin(w0) * sinh((log(2)/2) * BW * (w0/sin(w0))); %BW

b0 = 1 + alpha * A;
b1 = -2*cos(w0);
b2 = 1 - alpha * A;
a0 = 1 + alpha/A;
a1 = -2*cos(w0);
a2 = 1 - alpha/A;

b = [b0, b1, b2];
a = [a0, a1, a2];
figure(6)
zplane(b, a)
figure(7)
freqz(b,a, 1024, fs/2*pi)

%% Convert to fixed point
frac = 24;

f = 1000;
signal = sin(2*pi*f*t);
fpsignal = int64(sin(2*pi*f*t) * (2^frac - 1));


b0_a0 = b0/a0
b1_a0 = b1/a0
b2_a0 = b2/a0
a1_a0 = a1/a0
a2_a0 = a2/a0


fp_b0_a0 = int64(b0/a0 * (2^frac - 1))
fp_b1_a0 = int64(b1/a0 * (2^frac - 1))
fp_b2_a0 = int64(b2/a0 * (2^frac - 1))
fp_a1_a0 = int64(a1/a0 * (2^frac - 1))
fp_a2_a0 = int64(a2/a0 * (2^frac - 1))


v = sprintf("%c", dec2hex(int64(bitshift(1, 24))))

sprintf("%c", dec2hex(fp_b0_a0))
sprintf("%c", dec2hex(fp_b1_a0))
sprintf("%c", dec2hex(fp_b2_a0))
sprintf("%c", dec2hex(fp_a1_a0))
sprintf("%c", dec2hex(fp_a2_a0))

coeffs = [b0_a0, b1_a0, b2_a0, -a1_a0, -a2_a0];
samples = [0, 0, 0, 0, 0];
resultsignal = zeros(length(signal), 1);

fpcoeffs = [fp_b0_a0, fp_b1_a0, fp_b2_a0, -fp_a1_a0, -fp_a2_a0];
fpsamples = [0, 0, 0, 0, 0]; %x0, x1, x2, y1, y2
resultfpsignal = zeros(length(fpsignal), 1);

for n = 1:length(signal)
    % Normal 
    samples(1) = signal(n);
    
    result = 0;
    for i = 1:1:5
        result = result + coeffs(i) * samples(i);
    end

    samples(5) = samples(4);
    samples(4) = result;
    samples(3) = samples(2);
    samples(2) = samples(1);

    resultsignal(n) = result;


    % Fixed point
    fpsamples(1) = fpsignal(n);
    fpresult = 0;
    for i = 1:1:5
        fpresult = fpresult + bitshift(fpcoeffs(i) * fpsamples(i), -frac);
    end
    

    fpsamples(5) = fpsamples(4);
    fpsamples(4) = fpresult;
    fpsamples(3) = fpsamples(2);
    fpsamples(2) = fpsamples(1);

    resultfpsignal(n) = fpresult;
end

for n = 1:128
    fprintf("%f,", signal(n))
end
fprintf("\n")

for n = 1:128
    fprintf("%f,", resultsignal(n))
end
fprintf("\n")

for n = 1:128
    fprintf("%i,", fpsignal(n))
end
fprintf("\n")

for n = 1:128
    fprintf("%i,", resultfpsignal(n))
end
fprintf("\n")


fig1 = figure(1);
plot(t, signal, color='b')
hold("on");
plot(t, resultsignal, color='r')
hold("off")


fig2 = figure(2);
plot(t, fpsignal, color='b')
hold("on");
plot(t, resultfpsignal, color='r')
hold("off")

%% Stuff
b0 = 0.00391608;
b1 = 0.00783215;
b2 = 0.00391608;
a0 = 1;
a1 = -1.81531792;
a2 = 0.83098222;

frac = 23;

b0_a0 = int64(b0 * (2^frac - 1))
b1_a0 = int64(b1 * (2^frac - 1))
b2_a0 = int64(b2 * (2^frac - 1))
a1_a0 = int64(-a1 * (2^frac - 1))
a2_a0 = int64(-a2 * (2^frac - 1))

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

