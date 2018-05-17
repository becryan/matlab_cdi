function [ rho ] = float_hio(amp,mask,support,rho,niter)
% float beamstop in HIO algorithm
beta=0.9;
amp=fftshift(amp);
mask=fftshift(mask);
for k=1:niter  
    F=fft2(rho);
    Error=SE(abs(F),amp.*mask);
    disp([num2str(Error),' ',num2str(k)]);
    phases=angle(F); 
    amp2=(amp.*mask)+(abs(F).*(1-mask));
    F2=amp2.*exp(1i*phases);
    rho2=ifft2(F2);
       % rho2=rho2.*support;
    rho3=rho2.*support+(1-support).*(rho-beta*rho2);   
    rho=rho3;
%if ceil(k/1)==floor(k/1);imagesc(abs(rho(550:700,550:700)));axis image, title(['Iteration ',num2str(k),'  Error  ',num2str(Error)]), drawnow;
%end
end

end

