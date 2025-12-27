# standardizeToObsdat Function to standardize numeric variables to means and variances from obsdat Apply this to logdat so that predictions will be correct if using numerical variables

standardizeToObsdat Function to standardize numeric variables to means
and variances from obsdat Apply this to logdat so that predictions will
be correct if using numerical variables

## Usage

``` r
standardizeToObsdat(obsdat, newdat, numericVariables = NULL)
```

## Arguments

- obsdat:

  observer data used in model fitting

- newdat:

  data to be standardized, e.g. logbook data

- numericVariables:

  character vector of names of numeric variables
