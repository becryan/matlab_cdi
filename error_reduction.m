% ERROR REDUCTION BASIC!!!!!!!!!
close all
support=support./(max(support(:)));
support=double(support);
amplitudes=double(amplitudes);
amplitudes=ifftshift(amplitudes);

% implement error guess check.
keep_metric=10;
guess=zeros(size(support));
good_guess=zeros(size(support));
F=zeros(size(support));

for j=1:2
    
phases=zeros(size(support))*2*pi();
guess=support.*exp(1i*phases);
F=fftshift(fft2(guess));

metric=SE(abs(F),amplitudes)

if metric<keep_metric
    keep_metric=metric;
    good_guess=guess;
end
disp(j)
end

rho = (good_guess);
F=fftshift(fft2(rho));

figure(1); imagesc(abs(rho(550:700,550:700)));pause
%amplitudes=sqrt(intensity);
% fft all of these:

%rho=ifftshift(rho);
%support=ifftshift(support);
E=zeros([1000,1]);
figure(2);
% do error reduction looop:
Error=0;
imagesc(abs(F));title('detector plane');pause

for k=1:3000
    
if k>1;
    F=(fft2(rho));%imagesc(abs(F));title('detector plane');pause(0.1)
end
Error=SE(abs(F),amplitudes);
disp(num2str(Error));disp(k);
phases=angle(F); %phases(phases<0)=-phases(phases<0);
F=amplitudes.*exp(1i*phases);
%F=abs(F);
rho=ifft2(F);if ceil(k/20)==floor(k/20);imagesc(abs(rho(550:700,550:700)));title(k);pause(0.1);end

if ceil(k/10)==floor(k/10);
    charge_roi=rho.*(1-support);tmp=-angle(rho);charge_roi=abs(charge_roi).*exp(1i*tmp);clear tmp;
    rho=rho.*support;rho=rho+charge_roi;
else
   rho=rho.*support;
end

%rho(rho<0)=0;
E(k)=Error;
%imagesc(abs(rho(550:700,550:700))), axis image,title(k), drawnow
end