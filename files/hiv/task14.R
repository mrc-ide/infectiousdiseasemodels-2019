##Differential equations

deriv(X_f) <- g*B/2-beta_mtof*X_f*Y_m/N_m-mu*X_f
deriv(X_m) <- g*B/2-beta_ftom*X_m*Y_f/N_f-mu*X_m

deriv(Y_f) <- beta_mtof*X_f*Y_m/N_m-mu*Y_f-nu*Y_f
deriv(Y_m) <- beta_ftom*X_m*Y_f/N_f-mu*Y_m-nu*Y_m

deriv(Z_f) <- (1-g)*B/2-mu*Z_f
deriv(Z_m) <- (1-g)*B/2-mu*Z_m

##Initial conditions

initial(X_f) <- g*init_susc/2
initial(X_m) <- g*init_susc/2

initial(Y_f) <- 5
initial(Y_m) <- 5

initial(Z_f) <- (1-g)*init_susc/2
initial(Z_m) <- (1-g)*init_susc/2

init_susc <- 990

##Other equations

N_f <- X_f+Y_f+Z_f
N_m <- X_m+Y_m+Z_m
N_tot <- N_f+N_m

beta_mtof <- kappa_mtof*c_f
beta_ftom <- kappa_ftom*c_m

B <- alpha*N_tot 	#entry rate, exponentially growing population
#B <- mu*N+nu*Y	#entry rate, constant population size - useful for model checking

##Parameter values

g <- user(0.4)		#proportion at-risk (in X class)
c_f <-user(11)		#partner change rate, females
c_m <-user(11)		#partner change rate, males
kappa_mtof <- user(0.1)  	#per partner HIV transmission probability, male to female
kappa_ftom <- user(0.1)  	#per partner HIV transmission probability, female to male
nu <- user(0.0833)            #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.0152)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0374)    #birth rate scaled to per person

##Additional output

output(prevalence_f) <- Y_f/N_f

output(prevalence_m) <- Y_m/N_m

output(prevalence_tot) <- (Y_f+Y_m)/N_tot


output(incidence_f) <- beta_mtof*X_f*Y_m/N_m
output(incidence_m) <- beta_ftom*X_f*Y_f/N_f
output(incidence_tot) <- (beta_mtof*X_f*Y_m/N_m)+(beta_ftom*X_f*Y_f/N_f)
output(incidence_rate_f) <- (beta_mtof*X_f*Y_m/N_m)/(X_f+Z_f)
output(incidence_rate_m) <- (beta_ftom*X_m*Y_f/N_f)/(X_m+Z_m)
output(incidence_rate_tot) <- ((beta_mtof*X_f*Y_m/N_m)+(beta_ftom*X_f*Y_f/N_f))/(X_f+Z_f+X_m+Z_m)
output(partnerships_f) <- c_f*(X_f+Y_f)
output(partnerships_m) <- c_m*(X_m+Y_m)