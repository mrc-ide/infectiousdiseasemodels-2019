##Differential equations
  
deriv(X_h) <- (1-g)*B-lambda_h*X_h-mu*X_h
deriv(X_l) <- g*B-lambda_l*X_l-mu*X_l 
deriv(Y_h) <- lambda_h*X_h-mu*Y_h-nu*Y_h
deriv(Y_l) <- lambda_l*X_l-mu*Y_h-nu*Y_l

##Initial conditions

initial(X_h) <- (1-g)*init_susc
initial(X_l) <- g*init_susc
initial(Y_h) <- 4
initial(Y_l) <- 1
init_susc <- 995

##Other equations

N_h <- X_h+Y_h
N_l <- X_l+Y_l
N_tot <- X_h+X_l+Y_h+Y_l

lambda_h <- kappa*c_h*(rho_hh*(Y_h/(X_h+Y_h))+rho_hl*(Y_l/(X_l+Y_l)))
lambda_l <- kappa*c_l*(rho_lh*(Y_h/(X_h+Y_h))+rho_ll*(Y_l/(X_l+Y_l)))

#random partner selection:

rho_hh <- c_h*(X_h+Y_h)/(c_h*(X_h+Y_h)+c_l*(X_l+Y_l))
rho_hl <- 1-rho_hh
rho_ll <- c_l*(X_l+Y_l)/(c_h*(X_h+Y_h)+c_l*(X_l+Y_l))
rho_lh <- 1-rho_ll

#partner selection varying between random and assortative

#rho_hh <- (1-epsilon)*1+epsilon*(c_h*(X_h+Y_h)/(c_h*(X_h+Y_h)+c_l*(X_l+Y_l)))
#rho_hl <- 1-rho_hh
#rho_ll <- (1-epsilon)*1+epsilon*(c_l*(X_l+Y_l)/(c_h*(X_h+Y_h)+c_l*(X_l+Y_l)))
#rho_lh <- 1-rho_ll

B <- alpha*N_tot 	#entry rate, exponentially growing population
#B <- mu*N_tot+nu*Y	#entry rate, constant population size - useful for model checking

##Parameter values

g <- user(0.4)		#proportion at lower risk (in X class)
c_h <-user(11)		#partner change rate - high activity class
c_l <-user(2)		#partner change rate - low activity class
kappa <- user(0.1)  	#per partner HIV transmission probability
#epsilon <- user(0.3)	#extent of mixing between assortative (0) and random (1) 
nu <- user(0.0833)            #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.0152)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0374)    #birth rate scaled to per person

##Additional output
output(prevalence_h) <- Y_h/N_h
output(prevalence_l) <- Y_l/N_l
output(prevalence_tot) <- (Y_h+Y_l)/N_tot
output(incidence_h) <- lambda_h*X_h
output(incidence_l) <- lambda_l*X_l
output(incidence_tot) <- lambda_h*X_h+lambda_l*X_l
output(incidence_rate_h) <- lambda_h
output(incidence_rate_l) <- lambda_l
output(incidence_rate_tot) <- (lambda_h*X_h+lambda_l*X_l)/(X_h+X_l)