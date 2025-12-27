# getBycatchDraws.

getBycatchDraws.

## Usage

``` r
getBycatchDraws(
  stanSum,
  modelNum,
  stanObj,
  setupObj,
  requiredVariables,
  modeledEffort = FALSE,
  effortSD = NULL,
  useCode,
  nsim
)
```

## Arguments

- stanSum:

  Output from bycatchStanSim

- modelNum:

  Model number corresponding to rows in waictab

- stanObj:

  One rstan or cmdstanr object

- setupObj:

  Data check output from BycatchEstimator dataCheck

- modeledEffort:

  TRUE if effort is input as mean and se for simulation.

- effortSD:

  Name of column with effort standard deviation

- useCode:

  rstan or cmdstanr

## Value

Returns the posterior random draws of the bycatch estimate
