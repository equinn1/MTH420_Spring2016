data { 
  int<lower=0> Nobs;                   //number of observations
  int<lower=0> Nsites;                 //number of sites
  int<lower=0,upper=1> rain_01[Nobs];  //rainfall yes or no
  int<lower=0,upper=12> site[Nobs];    //site
} 
parameters {
  real<lower=0,upper=1> theta[Nsites];
} 
model {
  theta  ~ beta(1,1);
  for (i in 1:Nobs) {
    rain_01[i] ~ bernoulli(theta[site[i]]);
  }
}
generated quantities{
  int<lower=0,upper=1> rain_01_rep[Nsites];
  for (i in 1:Nsites) {
    rain_01_rep[i] <- binomial_rng(1,theta[i]);  
  }
}
