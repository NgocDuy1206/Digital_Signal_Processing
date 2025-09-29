    
    clc; clear; close all;
    [x, fs] = audioread('odonnellyougogirl.wav');
    
    N = length(x);
    
    t = linspace(0, 1, N);
    
    gain_left = t';
    gain_right = 1 - t';
    
    a = gain_left .* x;
    a = a';
    b = gain_right .*x;
    b = b';
    K = 2;
    check = 10;
    result = [a b];
    for i = 1: K
        if (check == 0)
            result = [result; [a, b]];
            check = 1;
        else 
            
            result = [result; [b, a]];
            check = 0;
        end
    end
    
    sound(result, fs);
