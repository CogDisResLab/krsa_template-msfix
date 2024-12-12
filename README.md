# KRSA Report and Kinome Analysis Template

This repository includes a series of scripts and other files that make it
easier and quicker to generate Kinome Analysis using the
[Cognitive Disorders Research Lab](https://cdrl-ut.org) set of tools.

## Features

This template allows you to perform the following tasks:

- Generate KRSA reports for a given kinome array experiment dataset
- Generate UKA results for a given kinome array experiment dataset
- Generate creedenzymatic results for the experiments
- Generate Quartile plots for the experiments

In addition, this repository allows for the following:

- Standardizing the location of particular input and output files
- Allow for easy and predictable management of the data and results
- Allow for easy publishing of the results in a reproducible manner

## Requirements

Use of this repository requires the following tools to already be installed:

1. [`R`](https://www.r-project.org/) -- The language runtime
1. [`git`](https://git-scm.com/downloads) -- A version control system
1. [`just`](https://just.systems/) -- A task runner
1. A text editor or IDE ([`Visual Studio Code`](https://code.visualstudio.com/),
[`RStudio`](https://posit.co/download/rstudio-desktop/),
[`Neovim`](https://neovim.io/) etc.)
1. (For Windows Only) [`Rtools`](https://cran.r-project.org/bin/windows/Rtools/)
for your version of R.
1. (Optional) [`radian`](https://github.com/randy3k/radian) -- An alternative R Console

## Quickstart

Follow this process for a quick start:

1. Use the [`Use Template`] button to generate a copy of the repository in
your own account.
2. Clone this repository to your own computer.
3. Open R in the repository directory.
4. Run `renv::restore()` in the R Console and install all the dependencies.
5. Place your `SigmBg` and `SignalSaturation` files in the `kinome_data` folder.
6. Copy the `template.Rmd` file to your report name.
7. Change the file paths in the top matter of the `Rmd` file to point
to the files you just placed.
8. Run `just all` in the console.
