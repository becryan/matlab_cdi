function [ rho ] = hio(Ints,guess,support, niter )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
beta=0.9;
rho=guess;
amp=sqrt(Ints);
for k=1:niter
    F=(fft2(rho));
    Error=SE(abs(F),amp);
    disp(num2str(Error));disp(k);
    phases=angle(F); 
    F=amp.*exp(1i*phases);
    rho2=ifft2(F);
    rho=rho2.*support+(1-support).*(rho-beta*rho2);
    %rho=rho.*support;
%if ceil(k/10)==floor(k/10);imagesc(abs(rho(570:630,570:630)));axis image, title(k), drawnow;   
%end

end

%        F1(KREAL)=F3(KREAL)*SUPP(K)+(1.0D0-SUPP(K))*(F1(KREAL)-BETA*F3(KREAL))
%        
%        rho=rho2*support+(1-support).*(rho-beta*rho2);