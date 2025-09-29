    % 
    % clc; clear; close all;
    % [x, fs] = audioread('odonnellyougogirl.wav');
    % 
    % N = length(x);
    % 
    % t = linspace(0, 1, N);
    % 
    % gain_left = t';
    % gain_right = 1 - t';
    % 
    % a = gain_left .* x;
    % a = a';
    % b = gain_right .*x;
    % b = b';
    % K = 2;
    % check = 10;
    % result = [a b];
    % for i = 1: K
    %     if (check == 0)
    %         result = [result; [a, b]];
    %         check = 1;
    %     else 
    % 
    %         result = [result; [b, a]];
    %         check = 0;
    %     end
    % end
    % 
    % sound(result, fs);
    % 
    % 
    % 
    % 
fs = 8000;

% Define notes
C4 = 261.63;  D4 = 293.66;  E4 = 329.63;
F4 = 349.23;  G4 = 392.00;  A4 = 440.00;  B4 = 493.88;  G5 = 783.99;

makeNote = @(f,d) sin(2*pi*f*(0:1/fs:d));
pauseNote = @(d) zeros(1, round(d*fs));  % vẫn cần hàm nhưng dùng d = 0

% Happy Birthday melody
melody = [ ...
    G4 0.3; G4 0.3; A4 0.3; G4 0.3; C4 0.3; B4 0.6; ...
    G4 0.3; G4 0.3; A4 0.3; G4 0.3; D4 0.3; C4 0.6; ...
    G4 0.3; G4 0.3; G5 0.3; E4 0.3; C4 0.3; B4 0.3; A4 0.6; ...
    F4 0.3; F4 0.3; E4 0.3; C4 0.3; D4 0.3; C4 0.6];

song = [];
for i = 1:size(melody,1)
    f = melody(i,1);
    d = melody(i,2);
    song = [song makeNote(f,d) pauseNote(0)];  % không có khoảng nghỉ
end

sound(song, fs);
