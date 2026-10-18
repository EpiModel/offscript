# Low-Barrier Access and Monitoring for HIV PrEP

This repository holds the model code for:

> Le Guillou AV, Marcus JL, Krakower DS, Violette LR, Jenness SM. Potential risks and benefits of low-barrier access and monitoring for HIV pre-exposure prophylaxis: a modeling study. _J Infect Dis._ 2026; 234(4): 519-529. https://doi.org/10.1093/infdis/jiag369

It contains the R scripts for network estimation, model calibration, the over-the-counter PrEP scenarios, and the processing that produced the paper's tables and figures, along with the model parameter file (`data/input/model_parameters.csv`) and the lockfiles that record package versions (`renv.lock` for local runs, `renv.lock.hpc` for the cluster). Simulation output is not included. The work was funded by NIH/NIMH R21 MH136855 (OFFSCRIPT).

## Engine

The model runs on EpiModelHIV. The version used for the paper is this release: https://github.com/EpiModel/EpiModelHIV/releases/tag/LowBarrier-JID

```r
remotes::install_github("EpiModel/EpiModelHIV@LowBarrier-JID")
```

## Setup

Open the project in R 4.5 and restore the packages with renv:

```r
renv::restore(exclude = "ARTnetData")
```

ARTnetData is a private package and is needed only for network estimation (step A below). Every later step reads the fitted network objects that step A saves. The paper's networks were estimated with ARTnet 2.9.0, which is no longer public, so the lockfiles install ARTnet 2.9.3, the first version in the public [ARTnet](https://github.com/EpiModel/ARTnet) repository. Networks re-estimated with it may not match the paper's exactly.

## Running the pipeline

Scripts are run from the project root. Each step folder has a `z-context.R` that switches between a small local model and the full model on a SLURM cluster (set `hpc_context <- TRUE`). For the cluster, edit `mail_user` and the node setup in `R/hpc_configs.R`.

1. **Networks (`R/A-networks/`).** `1-estimation.R` fits the partnership network models from ARTnet (needs ARTnetData), and `2-diagnostics.R` and `3-assess.R` check them. `workflow-networks.R` runs both on the cluster.
2. **Calibration (`R/Z-calibration/`).** `workflow-swfcalib.R` calibrates the model to the Atlanta targets with swfcalib (`swfcalib_config.R` defines the waves), and `workflow-restart_point.R` with `choose_restart.R` saves the restart point. `finalize_params.R` writes the calibrated values to `data/input/model_parameters.csv`. `R/z-gfr_optim.R` fits the starting distribution for the renal function module.
3. **Intervention scenarios (`R/F-intervention_scenarios/`).** The scenarios are built in code (`utils-scenarios.R` and the `0*-make_scenarios*.R` scripts) and run from the restart point by the `workflow-intervention*.R` scripts: `workflow-intervention.R` for the main scenarios, `workflow-intervention_plots.R` for the coverage grid behind the contour plots, `workflow-intervention_find.R` for the search for target coverage levels, and `workflow-intervention_indics.R` for the sensitivity analyses. `1-scenarios.R` runs a small version locally.
4. **Tables and figures (`R/F-intervention_scenarios/`).** `2-process_tables.R` and `2-process_plot_data.R` summarize the merged simulations, and `3-contour_plot.R`, `4-filter_csv_tables.R`, and `6-tables.R` build the figures and tables in `data/output/`.

## Source

This is a snapshot of the private project repository, taken July 9, 2026, at the revision submitted to the journal. Its code matches the private repository at commit `30dc8a0`, apart from two added lines in `3-contour_plot.R` that save the contour figure as TIFF and PDF.
