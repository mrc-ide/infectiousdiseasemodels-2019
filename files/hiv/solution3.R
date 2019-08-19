##Differential equations

deriv(X_f) <- g * B/2-beta_mtof * X_f * Y_m/N_m - mu * X_f
deriv(X_m) <- g * B/2-beta_ftom * X_m * Y_f/N_f - mu * X_m

deriv(Y_f) <- beta_mtof * X_f * Y_m/N_m-mu * Y_f - nu * Y_f
deriv(Y_m) <- beta_ftom * X_m * Y_f/N_f-mu * Y_m - nu * Y_m

deriv(Z_f) <- (1 - g) * B/2-mu * Z_f
deriv(Z_m) <- (1 - g) * B/2-mu * Z_m

##Initialising equations

initial(X_f) <- g * init_susc/2
initial(X_m) <- g * init_susc/2

initial(Y_f) <- 50
initial(Y_m) <- 50

initial(Z_f) <- (1 - g) * init_susc/2
initial(Z_m) <- (1 - g) * init_susc/2

init_susc <- 100000-100

##Other equations

X_tot1 <- X_f + X_m
Y_tot1 <- Y_f + Y_m
Z_tot1 <- Z_f + Y_f

N_f <- X_f + Y_f + Z_f
N_m <- X_m + Y_m + Z_m
N_tot <- N_f + N_m

beta_mtof <- kappa_mtof * c_f
beta_ftom <- kappa_ftom * c_m

B <- alpha * N_tot 	#entry rate, exponentially growing population
#B <- mu * N + nu * Y	#entry rate, constant population size - useful for model checking

prevalence_f1 <- Y_f/N_f
prevalence_m1 <- Y_m/N_m
prevalence_tot1 <- (Y_f + Y_m)/N_tot

incidence_f1 <- beta_mtof * X_f * Y_m/N_m
incidence_m1 <- beta_ftom * X_f * Y_f/N_f
incidence_tot1 <- incidence_f1 + incidence_m1

incidence_rate_f1 <- incidence_f1/(X_f + Z_f)
incidence_rate_m1 <- incidence_m1/(X_m + Z_m)
incidence_rate_tot1 <- incidence_tot1/(X_f + Z_f + X_m + Z_m)

partnerships_f1 <- c_f * (X_f + Y_f)
partnerships_m1 <- c_m * (X_m + Y_m)

#Output
output(prevalence_f) <- prevalence_f1
output(prevalence_m) <- prevalence_m1
output(prevalence_tot) <- prevalence_tot1

output(incidence_f) <- incidence_f1
output(incidence_m) <- incidence_m1
output(incidence_tot) <- incidence_tot1

output(incidence_rate_f) <- incidence_rate_f1
output(incidence_rate_m) <- incidence_rate_m1
output(incidence_rate_tot) <- incidence_rate_tot1

output(partnerships_f) <- partnerships_f1
output(partnerships_m) <- partnerships_m1

output(X_tot) <- X_tot1
output(Y_tot) <- Y_tot1
output(Z_tot) <- Z_tot1

##Parameter values
g <- user(0.4)		#proportion at-risk (in X class)
c_f <-user(11)		#partner change rate, females
c_m <-user(11)		#partner change rate, males
kappa_mtof <- user(0.1)	#per partner HIV transmission probability, male to female
kappa_ftom <- user(0.1)	#per partner HIV transmission probability, female to male
duration_infection<-user(12) #mean duration of infection before death from HIV/AIDS
nu <- 1/duration_infection #mortality rate due to HIV/AIDS		
non_aids_mortality <- user(15.2)#crude mortality rate due to causes other than AIDS, per 1000 people
mu <- non_aids_mortality/1000#crude mortality rate due to causes other than AIDS, scaled to rate per person
birth_rate<-user(37.4) #birth rate per 1000 people
alpha <-birth_rate/1000 #birth rate scaled to per person
