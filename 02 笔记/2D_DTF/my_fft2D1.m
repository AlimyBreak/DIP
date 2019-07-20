function [F_u_v] = my_fft2D( f_m_n,M,N)


    F_u_v = zeros(M,N);
    
    for u = 0:M-1
        for v = 0:N-1
            F_u_v(u+1,v+1) = 0;
            for m = 0:M-1
                for n = 0:N-1
                    F_u_v(u+1,v+1) = F_u_v(u+1,v+1) + f_m_n(m+1,n+1)*exp(-1i*2*pi*(u*m/M + v*n/N));
                end
            end
            F_u_v(u+1,v+1) = F_u_v(u+1,v+1) /(M*N);
        end
    end
end