% clear all

%fsq=fsq.*mask;

rho=support.*rand(size(amplitude));
amplitudes=amplitude;
amplitudes=ifftshift(amplitude);
%amplitudes=sqrt(intensity);
%rho=ifftshift(rho);
numberOfIterations=10000;
E=zeros([1000,1]);
beta=0.9;
imagesc(amplitudes);
figure(2);
imagesc(support);

% implement error guess check.
keep_metric=10;
guess=zeros(size(support));
good_guess=zeros(size(support));
F=zeros(size(support));

% for j=1:10
%     
% phases=zeros(size(support))*2*pi();
% guess=support.*exp(1i*phases);
% F=fft2(guess);
% %F=fftshift(fft2(guess));
% 
% metric=SE(abs(F),amplitudes)
% 
% if metric<keep_metric
%     keep_metric=metric;
%     good_guess=guess;
% end
% disp(j)
% end

%rho = (good_guess);
%F=fftshift(fft2(rho));

figure(1); imagesc(abs(rho(550:700,550:700)));pause


 for k=1:100  
     F=(fft2(rho)); % fourier transform density estimate to obtain
     Error=SE(abs(F),amplitudes);
     disp(num2str(Error));disp(k);
     phases=angle(F); 
     F=amplitudes.*exp(i*phases); % replace amplitudes with measured diffraction amplitudes 
     rho2=ifft2(F); % inverse fourier transform to obtain new estimate of density 
if ceil(k/20)==floor(k/20);imagesc(abs(rho(550:700,550:700)));title(k);end
     
     %     % points that do not satisfy the constraints::
     violidx=getviolations(rho2,support);
     E(k)=sum(sum(abs(rho2(violidx)).^2)); 
     rho3=rho2;    
     rho3(violidx)=beta*rho2(violidx)-rho(violidx);
     rho=rho3;
   
 end
 pause
 clear F
 imagesc(abs(rho(550:700,550:700)))
 for k=201:350
    
if k>1;
    F=(fft2(rho));%imagesc(abs(F));title('detector plane');pause(0.1)
end
Error=SE(abs(F),amplitudes);
disp(num2str(Error));disp(k);
phases=angle(F); 
F=amplitudes.*exp(1i*phases);
%F=abs(F);
rho=ifft2(F);
if ceil(k/20)==floor(k/20);imagesc(abs(rho(550:700,550:700)));title(k);end%imagesc(abs(rho(550:700,550:700)));title(k);pause(0.1)
rho=rho.*support;
%rho(rho<0)=0;
E(k)=Error;
%imagesc(abs(rho(550:700,550:700))), axis image,title(k), drawnow
end%




    
    
    