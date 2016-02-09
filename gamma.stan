//model file for week2 parameter estimation exercise
data {
  int N;                        //sample size
  real<lower=0> y[N];           //data values
}
parameters {
  real<lower=0> alpha;          //shape parameter for gamma
  real<lower=0> beta;           //scale parameter for gamma
}
model {
  alpha ~ normal(0,50);         //half-normal prior for alpha
  beta  ~ normal(0,50);         //half-normal prior for beta 
  y ~ gamma(alpha,beta);         //process data
}
