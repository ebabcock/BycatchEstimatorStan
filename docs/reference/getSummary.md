# getSummary Function to extract parameter summary table for coefficients and scale parameter

getSummary Function to extract parameter summary table for coefficients
and scale parameter

## Usage

``` r
getSummary(stanSum, stanObj, modelNum, setupObj, spNum = 1, useCode)
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
