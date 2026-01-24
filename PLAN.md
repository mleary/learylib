# learylib Update Plan

## Repository Overview

**Package:** `learylib`
**Version:** 0.5.2 (last updated August 2020)
**Purpose:** Personal R utility package with helper functions for day-to-day R work
**License:** MIT
**Author:** Matt Leary

---

## Repository Structure

```
learylib/
├── R/                          # Source files (10 functions)
│   ├── copy_to_clipboard.R
│   ├── not_in.R
│   ├── not_na.R
│   ├── rprofile_clear.R
│   ├── rprofile_update.R
│   ├── search_last_error.R
│   ├── see_lib_paths.R
│   ├── see_pkg_funcs.R
│   ├── text_from_github.R      # Internal helper (not exported)
│   └── theme_leary.R
├── man/                        # roxygen2-generated docs (11 files)
├── tests/
│   └── spelling.R              # Only test - spell check
├── docs/                       # pkgdown website
├── pkgdown/                    # pkgdown assets (favicon)
├── .github/workflows/
│   └── R-CMD-check.yaml        # CI - Windows only, outdated actions
├── DESCRIPTION
├── NAMESPACE
├── README.Rmd / README.md
├── NEWS.md
├── LICENSE / LICENSE.md
├── _pkgdown.yml
├── run-checks.R                # Manual build script
└── learylib.Rproj
```

### Exported Functions

| Function | Purpose |
|----------|---------|
| `theme_leary()` | Minimal ggplot2 theme with custom typography |
| `see_pkg_funcs()` | Display all functions in a loaded package |
| `not_in()` | Negated `%in%` operator |
| `not_na()` | Negated `is.na()` |
| `copy_to_clipboard()` | Copy data frames to clipboard |
| `search_last_error()` | Google search the last R error |
| `see_lib_paths()` | Pretty print library paths |
| `rprofile_clear()` | Clear .Rprofile file |
| `rprofile_update()` | Update .Rprofile from GitHub template |

### Current Dependencies

**Imports:**
- `ggplot2` - used by theme_leary
- `dplyr` - **UNUSED** (should be removed)
- `readr` - used by text_from_github
- `usethis` - used by rprofile_update

**Suggests:**
- `spelling`

---

## TODO List (Ranked by Importance)

### Critical (Must Fix) - COMPLETED

1. **~~Add R version requirement to DESCRIPTION~~** ✅ COMPLETED
   - File: `DESCRIPTION`
   - Issue: No `Depends: R (>= x.x.x)` specified
   - Risk: Package may fail on older R versions without clear error
   - Fix: Add `Depends: R (>= 4.1.0)` or appropriate version
   - **STATUS: Added `Depends: R (>= 4.1.0)` to DESCRIPTION**

2. **~~Remove unused `dplyr` dependency~~** ✅ COMPLETED
   - File: `DESCRIPTION`
   - Issue: `dplyr` is listed in Imports but never used in any R file
   - Risk: Unnecessary dependency bloat, confusing for users
   - Fix: Remove from Imports section
   - **STATUS: Removed `dplyr` from Imports in DESCRIPTION**

3. **~~Add testthat infrastructure and unit tests~~** ✅ COMPLETED
   - Files: Create `tests/testthat/` directory and test files
   - Issue: No unit tests exist (only spelling.R)
   - Risk: Regressions go unnoticed, code quality unknown
   - Fix: Run `usethis::use_testthat()` and write tests for each function
   - **STATUS: Added testthat (>= 3.0.0) to Suggests, created tests/testthat.R and tests for:**
     - `not_in()` - 4 test cases
     - `not_na()` - 4 test cases
     - `theme_leary()` - 3 test cases
     - `see_lib_paths()` - 2 test cases
     - `see_pkg_funcs()` - 3 test cases

### High Priority

4. **Update GitHub Actions workflow**
   - File: `.github/workflows/R-CMD-check.yaml`
   - Issues:
     - Uses outdated actions (`checkout@v2`, `r-lib/actions/setup-r@master`)
     - Only tests on Windows
   - Fix: Update to latest r-lib/actions, add Ubuntu and macOS

5. **Update roxygen2 version**
   - File: `DESCRIPTION` (RoxygenNote field)
   - Issue: Currently 7.1.1, current version is 7.3.x
   - Fix: Run `devtools::document()` with updated roxygen2

6. **Fix documentation errors in copy_to_clipboard.R**
   - File: `R/copy_to_clipboard.R`
   - Issue: Parameter docs appear copy-pasted from another function (wrong descriptions)
   - Fix: Write correct `@param` documentation

### Medium Priority

7. **Fix typo in see_pkg_funcs.R**
   - File: `R/see_pkg_funcs.R` (line 24)
   - Issue: "packge" should be "package"
   - Fix: Correct spelling

8. **Add version constraints to dependencies**
   - File: `DESCRIPTION`
   - Issue: No minimum versions specified for any imports
   - Risk: Breaking changes in dependencies could break package
   - Fix: Add minimum versions (e.g., `ggplot2 (>= 3.4.0)`)

9. **Add code coverage to CI**
   - File: `.github/workflows/` (new or existing)
   - Issue: No visibility into test coverage
   - Fix: Add covr and codecov integration

10. **Update NEWS.md**
    - File: `NEWS.md`
    - Issue: No updates since v0.5.2 (August 2020)
    - Fix: Document any changes made during this update

### Low Priority

11. **Consider adding vignettes**
    - Directory: Create `vignettes/`
    - Issue: No long-form documentation
    - Note: May be overkill for a personal utility package

12. **Review experimental functions**
    - Some functions noted as experimental in docs
    - Decide: Keep, remove, or mark as stable

13. **Add lintr/styler to CI**
    - Enforce consistent code style
    - Optional but good practice

14. **Update pkgdown site**
    - File: `_pkgdown.yml` and regenerate `docs/`
    - After making changes, rebuild the documentation site

15. **Clean up run-checks.R**
    - File: `run-checks.R`
    - Has commented-out code, could be simplified or removed

---

## Quick Reference: Key Files to Edit

| Priority | File | Changes Needed |
|----------|------|----------------|
| Critical | `DESCRIPTION` | Add R version, remove dplyr, add version constraints |
| Critical | `tests/` | Add testthat structure and tests |
| High | `.github/workflows/R-CMD-check.yaml` | Update actions, add platforms |
| High | `R/copy_to_clipboard.R` | Fix documentation |
| Medium | `R/see_pkg_funcs.R` | Fix typo |
| Medium | `NEWS.md` | Document updates |

---

## Notes for Implementation

- Run `devtools::check()` after each major change to catch issues early
- Use `usethis::use_testthat(3)` for modern testthat setup
- Consider `usethis::use_github_action("check-standard")` for modern CI template
- Bump version to 0.6.0 after completing updates
- Regenerate `README.md` from `README.Rmd` if any examples change
- Rebuild pkgdown site after all changes: `pkgdown::build_site()`
