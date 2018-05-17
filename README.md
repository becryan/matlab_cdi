# matlab_cdi
functions used for coherent diffraction imaging (reconstruction algorithms)

Error Reduction and Hybrid-Input-Output reconstruction algorithms based on :
Fienup, J.R. (1 August 1982). "Phase retrieval algorithms: a comparison" (PDF). Applied Optics. 21 (15): 2758–2769.

Use the amplitude of the diffracted wavefield (square root of the intensity recorded at detector) to retrieve the diffracting object.

Choose a support function appropriate to the object (it must occupy at most, half the real-space array).  A good starting point might be a
square! The support should be 0s outside the support region (and 1s inside it).
