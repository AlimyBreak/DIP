clear;
close all;
clc;


M = 5;
N = 6;

f_m_n = zeros(M,N);
for i = 1:M
    for j = 1:N
        f_m_n(i,j) = i*j;
    end
end

right_fft      = fft2(f_m_n)/(M*N);
my_fft2_result1 = my_fft2D1(f_m_n,M,N); 
my_fft2_result2 = my_fft2D1(f_m_n,M,N);

right_fft - my_fft2_result1;

right_fft - my_fft2_result2;

my_fft2_result1 - my_fft2_result2






