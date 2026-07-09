# Potential Risks and Benefits of Low-Barrier Access and Monitoring for HIV Preexposure Prophylaxis: A Modeling Study

*A stochastic network-based modeling study of over-the-counter (OTC) tenofovir disoproxil fumarate/emtricitabine (TDF/FTC) pre-exposure prophylaxis (PrEP) among gay, bisexual, and other men who have sex with men (GBMSM) in Atlanta.*

> **OFFSCRIPT**, NIH/NIMH R21 MH136855. Built on the [EpiModel](https://www.epimodel.org/) / [EpiModelHIV-p](https://github.com/EpiModel/EpiModelHIV-p) platform.

---

## Abstract

**Introduction.** PrEP is highly effective for HIV prevention, but its impact is limited by access barriers. Low-barrier delivery strategies for daily oral TDF/FTC, such as over-the-counter availability, could improve access by eliminating clinic visits, though they may increase risks from reduced monitoring, including drug resistance, renal toxicity, and hepatitis B virus (HBV) reactivation. We estimated the population-level benefits and risks of introducing OTC PrEP to complement clinic-based care.

**Methods.** Using a stochastic network-based model of HIV and sexually transmitted infection (STI) transmission among GBMSM in Atlanta, we simulated two delivery pathways: standard prescription PrEP (clinic-based PrEP) and OTC PrEP with simplified initiation and reduced monitoring. We modeled 10% to 50% increases in total PrEP coverage over 10 years. Outcomes included HIV infections averted, STI incidence, contraindicated PrEP use with subnormal renal function (GFR < 60 mL/min/1.73 m2), HBV reactivations, and drug resistance.

**Results.** OTC PrEP increased coverage and reduced HIV incidence across all scenarios. A 50% coverage increase averted 15.4% of HIV infections over 10 years. However, clinical risks increased: renal impairment exposure rose from 2.5% to 4.8%, HBV reactivations reached 2.27 per 100 person-years, and TDF/FTC resistance increased to 8.40 events per 100 HIV infections. Sensitivity analyses showed that confirming HIV-negative status at initiation reduced resistance by more than 90% without diminishing prevention benefits, while frequent renal monitoring substantially reduced renal risk.

**Conclusions.** OTC PrEP could produce meaningful population-level HIV prevention benefits if it expands PrEP coverage beyond clinic-based care. Its net public health impact depends on implementation choices that preserve key safety functions, particularly HIV testing at initiation and targeted renal monitoring, without undermining gains in access.

---

## Headline findings

The analysis is organized around one benefit and three safety levers: prevention benefit scales with net coverage, while each clinical risk is governed by a specific implementation parameter rather than by OTC access itself.

- **Benefit scales with net coverage.** Introducing OTC PrEP alongside clinic-based PrEP reduced HIV incidence in every scenario. The percentage of infections averted (PIA) rose from 3.2% at a +10% coverage increase to 15.4% at +50% over 10 years, with the number needed to treat roughly stable (about 45 to 48). Prevention benefit was governed primarily by coverage and persistence rather than by per-user adherence.
- **Resistance is governed by HIV testing at initiation.** Combined TDF/FTC resistance rose to 8.40 events per 100 HIV infections at +50% coverage, concentrated among OTC initiations without HIV status confirmation. Confirming HIV-negative status at initiation was the dominant lever: raising confirmation from 0% to 100% cut FTC resistance by more than 90% (9.39 to 0.82 per 100 infections) without reducing prevention benefits.
- **Renal risk is governed by monitoring frequency.** Exposure to TDF/FTC with subnormal renal function (GFR < 60 mL/min/1.73 m2) rose from 2.5% to 4.8% as coverage increased, and renal monitoring frequency was the dominant lever for containing it. HBV reactivations reached 2.27 per 100 person-years among individuals with chronic HBV.

---

## Repository structure

| Path | Contents |
|---|---|
| [R/](R/) | EpiModelHIV-p analysis pipeline: A networks, B and C netsim exploration and scenarios, D restart point, E and F intervention exploration and production scenarios, Z calibration (`swfcalib`), plus `00-setup.R`, `shared_variables.R`, `hpc_configs.R`, `netsim_settings.R`, and `z-gfr_optim.R` for the renal module |
| `data/input/` | Model input parameter files (`model_parameters.csv`, `scenarios.csv`) |

Runtime environment: R 4.5, with dependencies managed through `renv` (`renv.lock` for local, `renv.lock.hpc` for the cluster) and `pixi` (`pixi.toml`). Simulations run locally for development and on a SLURM high-performance computing cluster for production scenarios.

---

## Team

- Samuel M. Jenness (PI), Emory University
- Adrien Le Guillou (analyst), Emory University and University of Reims
- Julia L. Marcus, Harvard Medical School
- Douglas S. Krakower, Harvard Medical School and Beth Israel Deaconess Medical Center
- Lauren A. Violette, Merck

## Related work

- **Modeling platform:** [EpiModel](https://www.epimodel.org/) and [EpiModelHIV-p](https://github.com/EpiModel/EpiModelHIV-p).
- **Data sources:** ARTnet for sexual network parameterization; 2019 Atlanta and Georgia HIV and STI surveillance for calibration targets; external clinical literature for the renal, HBV, and resistance modules.
- **Funding:** NIH/NIMH R21 MH136855.
