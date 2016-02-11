//model file for week2 parameter estimation exercise
data {
  int N;                        //sample size
  int<lower=0,upper=1> y[N];           //data values
}
parameters {
  real<lower=0,upper=1> theta;          //probability of success
}
model {
  theta ~ beta(1,1);            //uniform prior for alpha
  y ~ bernoulli(theta);        //process data
}
