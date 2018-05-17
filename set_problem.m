
%# files used with this: SE.m, and getviolations.m
rho=support.*rand(size(amplitudes));
%mshift=fftshift(mask);
%amp=fftshift(amplitudes);
beta=0.9;
% apply_mask=fftshift(mask);
 guess=rho;
rho=guess;



