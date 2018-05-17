function  rho  = float_modes( amp,rho,support, niter, esw, weights,mask,chomode)
% performs error reduction on the experimental data  using 
% 'guess', 'support' and 'amp'=amplitude of data
% guess = rho, if just performing on previously calculated rho
%niter=number of iterations
% masks the beamstop region
m2=fftshift(mask);
bamp=fftshift(amp);
% amp = the measured amp
%rho=fftshift(guess);
%ID='mode5Error.csv'; save for when we want to record error per iteration.
%fileID=fopen(ID,'a');

%amp=fftshift(amp);

for k=1:niter  
    F1=(fft2(rho));
    [summ,new_psi_n]=summed_modes(rho, esw, weights, 1,chomode);
    %figure(1);imagesc(abs(summ));figure(2);imagesc(abs(bamp));pause
    F=((bamp./summ).*m2).*new_psi_n; %imagesc(abs(F));pause;
    F=(F.*m2)+(F1.*(1-m2));
   % Error=SE(abs(F).*m2,amp.*m2);
   Error=SE(summ,bamp.*m2);
    rho=ifft2(F);    rho(rho<0)=0; 
    rho=rho.*support;       
  %  fprintf(fileID,strcat('%u, ','%6.8f\n'), k,Error);

  if ceil(k/2)==floor(k/2);
  
      imagesc(abs(rho(550:650,550:650)),[0 1]);axis image, title(k), drawnow;
      disp(num2str(Error));disp(k);disp(chomode); 
end



end

end