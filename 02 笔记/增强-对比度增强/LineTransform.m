function [ gray_data_out ] = LineTransform( gray_data_in, amp_in,amp_out )
% ÏßĞÔ±ä»»
    gray_data_out = zeros(size(gray_data_in));
    a = double(amp_in(1));
    b = double(amp_in(2));
    c = double(amp_out(1));
    d = double(amp_out(2));
    
    for i = 1:size(gray_data_in,1)
        for j = 1:size(gray_data_in,2)
            temp = c+((d-c)/(b-a))*(gray_data_in(i,j)-a);
            if temp >255
                gray_data_out(i,j) = 255;
            elseif temp < 0
                gray_data_out(i,j) = 0;
            else
                gray_data_out(i,j) = floor(temp);
            end
        end
    end

    gray_data_out = uint8(gray_data_out);

end

