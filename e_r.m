function [ rho ] = error_reduction( amp,guess,support, niter )
% performs error reduction on the experimental data  using 
% 'guess', 'support' and 'amp'=amplitude of data
% guess = rho, if just performing on previously calculated rho
%  niter=number of iterations
rho=guess;

for k=1:niter  
    F=(fft2(rho));
    Error=SE(abs(F),amp);     
    phases=angle(F); 
    F=amp.*exp(1i*phases);imagesc(abs(F));
    rho=ifft2(F); 
    rho=rho.*support;
%rho(rho<0)=0; 5
        %  name=strcat(filepath,num2str(k),'.png'); uncomment if you want
        %  to set up filenames for successive reconstruction images to save
        %  and create movie
    if ceil(k/10)==floor(k/10);
        imagesc(abs(rho));
        %imagesc(abs(rho(550:650,550:650)));axis image, title(['Iteration ', num2str(k), ' , Error  ',num2str(Error)]);colorbar, drawnow;
        % saveas(gcf,name)
   disp(num2str(Error));
    end

end

end

