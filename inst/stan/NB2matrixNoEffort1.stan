data{
 int N;
 int Ncoef;
 real interceptSD;
 int phiType;
 real phiPar;
 array[N] int Y;
 vector[N] Effort;
}
parameters{
 real  b0;
 real<lower=0.00001,upper=100> phi;
}
transformed parameters{
  vector[N] logmu;
  logmu = logmu + log(Effort);
  }
}
model{
  b0~normal(0,interceptSD);
  if(phiType==1) {
    phi~exponential(phiPar);
  }  else  {
    phi~normal(0,phiPar);
  }
  Y~neg_binomial_2_log(logmu,phi);
}
generated quantities {
  array[N] real LL;
  for(i in 1:N) {
   LL[i] = neg_binomial_2_log_lpmf(Y[i]|logmu[i],phi);
  }
}


