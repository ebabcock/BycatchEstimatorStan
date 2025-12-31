# GetMorPred

GetMorPred

## Usage

``` r
getMortPred(
  stanSum,
  modelNum,
  Species,
  stanObj,
  setupObj,
  modeledEffort = FALSE,
  effortSD = NULL,
  useCode,
  mortResults = NULL,
  mortModelNum = NULL,
  nsim = 1000,
  summaryVariables = "Year"
)
```

## Arguments

- stanSum:

  WAIC table

- modelNum:

  Row in waictab

- Species:

  Species name

- stanObj:

  Stan model ouput for bycatch model

- setupObj:

  Data setup object

- modeledEffort:

  TRUE if effort is drawn from a distribution

- effortSD:

  Name of column with effort data

- useCode:

  cmdstanr or rstan

- mortResults:

  stan run of mortality model

- mortModelNum:

  mortality model number to use

- nsim:

  Number of draws needed

- summaryVariables:

  Defaults to Year to get annual bycatch mortality

- flipMort:

  True if estimated probability of survival and want mortality or vs/vs
