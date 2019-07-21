function [ gray_data_out ] = PartLineTransform( gray_data_in , Mf,area_you_like_original,area_you_like_target,Mg)

    % 分段线性变换
    gray_data_out = zeros(size(gray_data_in));
    a = area_you_like_original(1);
    b = area_you_like_original(2);
    c = area_you_like_target(1);
    d = area_you_like_target(2);
    
    for i = 1:size(gray_data_in,1)
        for j = 1:size(gray_data_in,2)
            
            if gray_data_in(i,j) < a
                temp = ((c-0)/(a-0))*gray_data_in(i,j);
            elseif gray_data_in(i,j) < b
                temp = ((d-c)/(b-a))*(gray_data_in(i,j)-a)+c;
            else
                temp = ((Mg-d)/(Mf-b))*(gray_data_in(i,j)-b)+d;
            end
            
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

