# Evaluating Semi-Mechanistic Nowcasts of COVID-19 Hospital Admissions in Germany

This repository contains the write-up, results, and code of a project evaluating the use of a semi-mechanistic nowcasting approach for COVID-19 hospitalisations in Germany. 

## Resources

- [`writeups`](writeups/): Summary paper and additional supplementary information.
- `_targets.Rmd` and `_targets.md`: Analysis workflow.
- [`data`](data/): Input data and summarised output generated by steps in the analysis.
- Rendered summary paper.
- Rendered SI.
- [`analyses`](analyses/): Ad-hoc analyses not part of the overarching workflow.
- [`NEWS.md`](NEWS.md): Dated development notes.
- `.devcontainer`: Resources for reproducibility using `vscode` and `docker`.

## Reproducibility

### Dependencies

```r
remotes::install_dev_deps()
```

### Analyses

- The full analysis can be recreated using the following,

```bash
. _targets.sh
```

- Run the workflow using all available workers.

```r
targets::tar_make_future(workers = future::availableCores())
```

- Explore a graph of the workflow.

```r
targets::tar_visnetwork(targets_only = TRUE)
```

- Watch the workflow as it runs.

```r
targets::tar_watch(targets_only = TRUE)
```

To understand the workflow in more detail see the supplementary information and the summary paper.
