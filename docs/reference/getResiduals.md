# getResiduals Function to plot quantile residuals from a cmdstanr or rstan fit, using DHARMa

getResiduals Function to plot quantile residuals from a cmdstanr or
rstan fit, using DHARMa

## Usage

``` r
getResiduals(
  stanSum,
  stanObj,
  modelNum,
  setupObj,
  nsim = 1000,
  spNum = 1,
  useCode
)
```

## Arguments

- stanSum:

  Output from bycatchStanSim

- stanObj:

  One rstan or cmdstanr object

- modelNum:

  Model number corresponding to rows in waictab

- setupObj:

  bycatchSetup output

- spNum:

  Species number from bycatchSetup, generally 1

- useCode:

  "cmdstanr" or "rstan"
