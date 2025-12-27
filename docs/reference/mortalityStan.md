# mortalityStan Function to run binomial stan models to estimate probability of survival

mortalityStan Function to run binomial stan models to estimate
probability of survival

## Usage

``` r
mortalityStan(
  mortData,
  predData = NULL,
  modelsToRun,
  aliveColumn,
  outDir,
  runName,
  predictP,
  useCode
)
```

## Arguments

- mortData:

  Data frame to fit model with a variable called alive with 1 for
  survive, 0 for dead plus predictor varialbes.

- predData:

  Data frame to predict mortalities for if desired

- modelsToRun:

  Character vector of models

- aliveColumn:

  Name of column containing 1/0 for alive/dead

- outDir:

  output directory

- runName:

  run name

- predictP:

  TRUE/FALSE, do we want to predict to new data?

- useCode:

  character string: cmdstanr or rstan
