data{
  int N;
  int Ncoef;
  array[N] int Y;
  real interceptSD;
  real coefficientSD;
  real RanEffPar;
  int phiType;
  real phiPar;
  vector[N] Effort;
  matrix[N,Ncoef] xMatrix;
  int<lower=0> NumRanEf;
  int<lower=0> RenEfTotalLevels;
  array[NumRanEf] int<lower=1> RanEfLevels;
  array[NumRanEf] int<lower=1> RanEfStart;
  array[N,NumRanEf] int<lower=1> XRanEfLevels;
}
parameters{
  real  b0;
  vector[Ncoef] b;
  real<lower=0.00001,upper=100> phi;
  vector[RenEfTotalLevels] RanEf_raw;
  array[NumRanEf] real<lower=0> sigmaRanEf;
}
transformed parameters{
  vector[N] logmu;
  vector[N] mu;
  logmu = b0 + xMatrix * b;
  if (NumRanEf > 0) {
    for (n in 1:N) {
      real re_add = 0;
      for (k in 1:NumRanEf) {
       int idx = RanEfStart[k] + XRanEfLevels[n, k] - 1;
       re_add += sigmaRanEf[k] * RanEf_raw[idx];
      }
      logmu[n] += re_add;
    }
  }
  for(i in 1:N) {
    mu[i] = exp(logmu[i]) * Effort[i];
  }
}
model{
  b0 ~ normal(0, interceptSD);
  b  ~ normal(0, coefficientSD);
  if(phiType==1) {
    phi ~ exponential(phiPar);
  } else {
    phi ~ normal(0, phiPar);
  }
  if (NumRanEf > 0) {
    for (k in 1:NumRanEf) {
      RanEf_raw[k] ~ normal(0, 1);
      sigmaRanEf[k] ~ exponential(RanEffPar);
    }
  }
  Y ~ neg_binomial_2(mu, phi);
}
generated quantities {
  array[N] real LL;
  array[N] real Yrep;
  for(i in 1:N) {
    Yrep[i] = neg_binomial_2_rng(mu[i], phi);
    LL[i]   = neg_binomial_2_lpmf(Y[i] | mu[i], phi);
  }
}
