## Derivatives. 
deriv(S) <- -S * beta*D/N_i
deriv(D) <- S * beta*D/N_i - d2c*D
deriv(C) <- d2c*D

## Initial conditions...
initial(S) <- N_i - D_i - C_i 
initial(D) <- D_i
initial(C) <- C_i

## Parameters...
pTime <- 5
d2c <- user(2.5, min = 0)
N_i <- user(500, min = 0)
D_i <- user(0.2, min = 0)
C_i <- 0

beta_i <- user(3, min = 0)
beta_f <- user(2.7, min = 0)
beta <- if(t<pTime) beta_i else beta_f 

## Additional output variables. 
## Mean case rate, for fitting to case data. 
output(CR) <- S * beta*D/N_i 

## R0. This could change with time. 
output(R0) <- beta/d2c

