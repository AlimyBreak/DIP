function [F_u_v] = my_fft2D2( f_m_n,M,N)
    F_u_v = zeros(M,N);
    
    for i = 1:M
        F_u_v(i,:) = fft(f_m_n(i,:));
    end
    
    for j = 1:N
        F_u_v(:,j) = fft(F_u_v(:,j))
    end
    
    F_u_v = F_u_v /(M*N);
   
end