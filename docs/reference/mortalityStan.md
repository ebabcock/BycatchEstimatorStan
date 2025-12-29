# mortalityStan Function to run binomial stan models to estimate probability of survival

mortalityStan Function to run binomial stan models to estimate
probability of survival

## Usage

``` r
mortalityStan(
  mortData,
  predData = NULL,
  modelsToRun,
  factorVariables = NA,
  numericVariables = NA,
  mortalityColumn,
  outDir,
  runName,
  predictP,
  useCode
)
```

## Arguments

- mortData:

  Data frame to fit model with a variable called mortality with 1 for
  dead, 0 for alive plus predictor variables.

- predData:

  Data frame to predict mortalities for if desired. If null, uses all
  distinct rows of the fitting data

- modelsToRun:

  Character vector of models

- mortalityColumn:

  Name of column containing 1/0 for dead/alive

- outDir:

  output directory

- runName:

  run name

- predictP:

  TRUE/FALSE, do we want to predict to new data?

- useCode:

  character string: cmdstanr or rstan

- FactorVariables:

  Variables to interpret as categorical

- Numericvariables:

  Variable to interpret as numerical
