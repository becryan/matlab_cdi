% clear all
% Example of phase retrieval workflow :
%1 randomise the object field (rho)
%2 set the amplitude (sqrt of the intensity)
%3 set beta for HIO algorithm
%4 set umber of iterations

rho=support.*rand(size(amplitudes));
amplitudes=sqrt(intensity);
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


%%%Uncomment the lines below to do a trial of 10 guesses and use the one
%%%with the lowest error as a starting point for the phase-retrieval
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

%% Hybrid Input Output bit (HIO) 100 iterations %%
rho=hio(amplitudes,guess,support,100);
pause;
 imagesc(abs(rho(550:700,550:700)));
 
 % Error Reduction bit
rho=e_r(amplitudes,rho,support,100);




    
    
    