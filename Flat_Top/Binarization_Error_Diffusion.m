function y= wuchakuosan(GSM,M,N)
pixel =zeros(M,N);
% for  y = 1:500
%    for  x = 1:500
%        pixel(x,y) = 32;
%    end
% end
tic
for  y = 1:N
   for  x = 1:M
      oldI  = GSM(x,y); 
      m= sqrt(oldI);
      if m >0.9
          newpixel = 1;
      else 
          newpixel = 0;
      end
      pixel(x,y)  =newpixel;
      quant_error  = newpixel-oldI;
      if x<M && y<N
      if x > 1
          pixel(x-1,y+1) = double( pixel(x-1,y+1)) + quant_error*3/16;
      end
      pixel(x+1,y) = double (pixel(x+1,y)) + quant_error*5/16;
      pixel(x,y+1) =double( pixel(x,y+1)) + quant_error*7/16;
      pixel(x+1,y+1) = double (pixel(x+1,y+1)) + quant_error*1/16;
      end
   end
   toc
end
figure
imshow(pixel,[])
end

