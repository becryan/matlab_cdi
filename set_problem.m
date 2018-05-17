
% initialise values for either using the HIO function or the E_R function
rho=support.*rand(size(amplitudes));
%mshift=fftshift(mask);  %% uncomment if using a mask
beta=0.9;
% apply_mask=fftshift(mask);  %% uncomment if using a mask
 guess=rho;
rho=guess;



