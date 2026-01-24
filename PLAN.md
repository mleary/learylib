# learylib Update Plan

**Generated:** 2026-01-23  
**Current Version:** 0.5.2  
**Status:** Functional but needs modernization and testing

---

## Repository Overview

**learylib** is a personal utility R package containing 9 exported functions for common R development tasks. It demonstrates good foundational package structure but requires updates to meet modern R package standards.

### Package Structure

```
learylib/
├── R/                          # 10 R files with core functions
│   ├── copy_to_clipboard.R
│   ├── not_in.R
│   ├── not_na.R
│   ├── rprofile_clear.R
│   ├── rprofile_update.R
│   ├── search_last_error.R
│   ├── see_lib_paths.R
│   ├── see_pkg_funcs.R
│   ├── theme_leary.R
│   └── utils.R                 # Contains text_from_github() helper
├── man/                        # 10 generated documentation files
├── tests/                      # Currently only spelling test
│   ├── spelling.R
│   └── testthat/              # Directory exists but empty
├── docs/                       # pkgdown generated site
├── .github/workflows/          # CI/CD (R-CMD-check.yaml)
├── DESCRIPTION                 # Package metadata
├── NAMESPACE                   # Auto-generated, 9 exports
├── README.Rmd / README.md      # Documentation
├── NEWS.md                     # Changelog
├── _pkgdown.yml               # pkgdown configuration
└── run-checks.R               # Build/check script
```

### Exported Functions

1. **`copy_to_clipboard()`** - Copy dataframes to clipboard (Windows-only)
2. **`not_in()`** - Negation of `%in%` operator
3. **`not_na()`** - Negation of `is.na()`
4. **`rprofile_clear()`** - Clear .Rprofile file
5. **`rprofile_update()`** - Update .Rprofile from GitHub
6. **`search_last_error()`** - Google search for last error message
7. **`see_lib_paths()`** - Print library paths
8. **`see_pkg_funcs()`** - List functions in a package
9. **`theme_leary()`** - Custom ggplot2 theme

### Internal Functions

- **`text_from_github()`** - Helper to read files from GitHub (documented but not exported)

### Dependencies

**Imports:**
- ggplot2
- dplyr (appears unused in current code)
- readr
- usethis

**Suggests:**
- spelling

---

## Current State Assessment

### ✅ Strengths

1. **Good Documentation Structure** - All functions have roxygen2 documentation
2. **CI/CD Pipeline** - GitHub Actions workflow configured
3. **Package Website** - pkgdown site properly configured
4. **Version Control** - Clean git structure with proper .gitignore
5. **Development Workflow** - RStudio project with build script

### ⚠️ Issues Identified

1. **No Unit Tests** - Only spelling test exists, no testthat tests
2. **Outdated RoxygenNote** - 7.1.1 (current is 7.3.x)
3. **Code Style Issues** - Inconsistent naming (dots vs underscores)
4. **Documentation Typos** - Multiple spelling/grammar errors
5. **Missing R Version** - No minimum R version specified
6. **Platform Limitations** - Some functions Windows-only
7. **Incomplete TODOs** - Templates and color palette not created
8. **README Generation** - Process appears broken (commented out)

---

## TODO List (Prioritized)

### 🔴 PRIORITY 1: Critical (Do First)

#### 1.1 Fix Code Style and Naming Conventions
**Impact:** High | **Effort:** Low | **Est. Time:** 1-2 hours

- [ ] `copy_to_clipboard.R`: Change `data.input` → `data`, `row.names.input` → `row_names`
- [ ] `rprofile_clear.R`: Change `local.rprofile.path` → `local_rprofile_path`
- [ ] `rprofile_update.R`: Change `local.rprofile.path` → `local_rprofile_path`
- [ ] `search_last_error.R`: Fix typo `additonal.term` → `additional_term`
- [ ] Review all files for unnecessary `base::` prefixes
- [ ] Update all roxygen documentation to match new parameter names
- [ ] Run `devtools::document()` after changes

**Note:** This is a breaking change - bump to version 0.6.0

#### 1.2 Fix Documentation Typos
**Impact:** High | **Effort:** Low | **Est. Time:** 30 minutes

- [ ] `not_na.R`: Fix "hel me" → "help me"
- [ ] `rprofile_clear.R`: Fix "you file path" → "your file path"
- [ ] `see_pkg_funcs.R`: Fix "packge" → "package"
- [ ] Review all documentation for additional typos

#### 1.3 Update RoxygenNote and Documentation
**Impact:** High | **Effort:** Low | **Est. Time:** 15 minutes

- [ ] Update roxygen2 package: `install.packages("roxygen2")`
- [ ] Run `devtools::document()` to regenerate documentation
- [ ] Verify NAMESPACE regenerates correctly
- [ ] Check that RoxygenNote in DESCRIPTION updates to 7.3.x

#### 1.4 Add Minimum R Version Requirement
**Impact:** Medium | **Effort:** Low | **Est. Time:** 10 minutes

- [ ] Add `Depends: R (>= 3.6.0)` to DESCRIPTION file (or appropriate version)
- [ ] Test package on specified minimum R version if possible

#### 1.5 Resolve text_from_github() Export Status
**Impact:** Medium | **Effort:** Low | **Est. Time:** 15 minutes

**Decision needed:** Should this function be exported?

**Option A: Keep Internal (Recommended)**
- [ ] Add `@keywords internal` to documentation
- [ ] Remove `@export` if present
- [ ] Consider renaming to `.text_from_github()` to indicate internal use

**Option B: Export It**
- [ ] Add `@export` tag
- [ ] Ensure documentation is complete
- [ ] Add examples and tests

---

### 🟡 PRIORITY 2: Important (Do Soon)

#### 2.1 Add Unit Tests
**Impact:** High | **Effort:** Medium | **Est. Time:** 4-6 hours

- [ ] Set up testthat framework: `usethis::use_testthat()`
- [ ] Create test file for each function:
  - [ ] `test-copy_to_clipboard.R`
  - [ ] `test-not_in.R`
  - [ ] `test-not_na.R`
  - [ ] `test-rprofile_clear.R`
  - [ ] `test-rprofile_update.R`
  - [ ] `test-search_last_error.R`
  - [ ] `test-see_lib_paths.R`
  - [ ] `test-see_pkg_funcs.R`
  - [ ] `test-theme_leary.R`
  - [ ] `test-text_from_github.R` (if keeping as internal)
- [ ] Aim for >80% code coverage
- [ ] Add code coverage tracking: `usethis::use_coverage()`

**Testing Notes:**
- Some functions (like `rprofile_clear()`) modify system state - use temp files
- `copy_to_clipboard()` may require mocking on non-Windows systems
- Network-dependent functions (`rprofile_update()`, `search_last_error()`) need careful testing

#### 2.2 Fix README Generation Process
**Impact:** Medium | **Effort:** Medium | **Est. Time:** 1-2 hours

- [ ] Review commented-out code in `run-checks.R`
- [ ] Identify why `rmarkdown::render("README.Rmd")` was disabled
- [ ] Fix any knitr/rendering issues
- [ ] Test README.Rmd rendering locally
- [ ] Re-enable automatic README.md generation
- [ ] Add README rendering to run-checks.R workflow

#### 2.3 Address Platform Compatibility
**Impact:** Medium | **Effort:** Medium | **Est. Time:** 2-3 hours

- [ ] Document Windows-only limitation of `copy_to_clipboard()` in README
- [ ] Test `copy_to_clipboard()` on macOS and Linux (or note untested)
- [ ] Consider adding cross-platform clipboard support (clipr package?)
- [ ] Add platform checks with informative errors if unsupported
- [ ] Update CI to test on multiple OS (see 2.4)

#### 2.4 Expand CI/CD Testing
**Impact:** Medium | **Effort:** Low | **Est. Time:** 1 hour

- [ ] Update `.github/workflows/R-CMD-check.yaml` to include:
  - [ ] ubuntu-latest
  - [ ] macOS-latest
  - [ ] windows-latest (already present)
- [ ] Add code coverage reporting to CI
- [ ] Add spell-check to CI workflow
- [ ] Consider adding `R CMD check --as-cran` flag

#### 2.5 Clean Up and Audit Dependencies
**Impact:** Low | **Effort:** Low | **Est. Time:** 30 minutes

- [ ] Search codebase for `dplyr::` usage (appears unused - consider removing from DESCRIPTION)
- [ ] Verify all imported functions are actually used
- [ ] Document why each dependency is needed in internal notes
- [ ] Consider if any dependencies can be moved to Suggests

---

### 🟢 PRIORITY 3: Enhancements (Nice to Have)

#### 3.1 Create Color Palette for theme_leary()
**Impact:** Medium | **Effort:** Medium | **Est. Time:** 2-3 hours

- [ ] Design color palette (5-8 colors)
- [ ] Create `scale_color_leary()` function
- [ ] Create `scale_fill_leary()` function
- [ ] Add documentation with examples
- [ ] Update `theme_leary()` documentation to reference color scales
- [ ] Add visual examples to README/vignette

#### 3.2 Create Package Vignettes
**Impact:** Medium | **Effort:** Medium | **Est. Time:** 3-4 hours

- [ ] Add vignette infrastructure: `usethis::use_vignette("getting-started")`
- [ ] Create "Getting Started with learylib" vignette
- [ ] Create "Customizing Your R Workflow" vignette (rprofile functions)
- [ ] Create "Visualization with theme_leary" vignette
- [ ] Ensure vignettes build correctly with pkgdown

#### 3.3 Create RMarkdown Templates
**Impact:** Low | **Effort:** Medium | **Est. Time:** 2-3 hours

- [ ] Create `leary_html` RMarkdown template (mentioned in code comments)
- [ ] Add template infrastructure: `usethis::use_rmarkdown_template()`
- [ ] Design template styling
- [ ] Add documentation on how to use template
- [ ] Test template generation

#### 3.4 Create Xaringan Presentation Template
**Impact:** Low | **Effort:** Medium | **Est. Time:** 2-3 hours

- [ ] Install xaringan if not present
- [ ] Design slide template matching theme_leary aesthetic
- [ ] Add template infrastructure
- [ ] Create example presentation
- [ ] Document usage

#### 3.5 Improve Package Documentation
**Impact:** Low | **Effort:** Medium | **Est. Time:** 2-3 hours

- [ ] Add more examples to function documentation
- [ ] Create pkgdown articles for common workflows
- [ ] Add "See Also" sections linking related functions
- [ ] Improve DESCRIPTION file description (currently minimal)
- [ ] Add package-level documentation: `usethis::use_package_doc()`

#### 3.6 Add Package Website Enhancements
**Impact:** Low | **Effort:** Low | **Est. Time:** 1 hour

- [ ] Add GitHub badges to README (build status, coverage, etc.)
- [ ] Customize pkgdown styling to match theme_leary
- [ ] Add logo/hex sticker
- [ ] Configure GitHub Pages deployment if not already set up
- [ ] Add "Get Started" quick start guide to website

#### 3.7 Modernize Package Infrastructure
**Impact:** Low | **Effort:** Low | **Est. Time:** 1 hour

- [ ] Review `.Rbuildignore` for completeness
- [ ] Review `.gitignore` for completeness
- [ ] Consider adding `codemeta.json` for software citation
- [ ] Add CITATION file: `usethis::use_citation()`
- [ ] Consider adding code of conduct if making public

---

## Version Roadmap

### Version 0.6.0 (Breaking Changes - Priority 1)
- Fix all naming conventions (data.input → data, etc.)
- Update documentation
- Fix all typos
- Update roxygen2
- Add minimum R version

### Version 0.6.1 (Testing - Priority 2)
- Add comprehensive unit tests
- Fix README generation
- Expand CI/CD to multiple OS
- Document platform limitations

### Version 0.7.0 (Features - Priority 3)
- Add color palette functions
- Create vignettes
- Add templates (RMarkdown, xaringan)
- Enhance documentation

### Version 1.0.0 (Production Ready)
- All tests passing
- Full documentation
- Multi-platform support tested
- No outstanding TODOs
- Ready for CRAN submission (if desired)

---

## Technical Notes for Future Reference

### Parameter Naming Conventions
Current issues with dot notation (R's old style). Should use snake_case throughout:
- ❌ `data.input` → ✅ `data`
- ❌ `row.names.input` → ✅ `row_names`
- ❌ `local.rprofile.path` → ✅ `local_rprofile_path`

### Functions That Modify System State
These need special testing considerations:
- `rprofile_clear()` - Writes to filesystem
- `rprofile_update()` - Downloads from GitHub, writes to filesystem
- `copy_to_clipboard()` - Modifies clipboard

### Network-Dependent Functions
These may fail in CI or offline environments:
- `rprofile_update()` - Fetches from GitHub
- `search_last_error()` - Opens browser/searches Google

### Platform-Specific Functions
- `copy_to_clipboard()` - Currently Windows-only (uses `"clipboard"` argument)

### Documentation Generation
- Uses roxygen2 with `@importFrom` for selective imports
- NAMESPACE is auto-generated (don't edit manually)
- `devtools::document()` regenerates documentation

### Build Script
`run-checks.R` contains:
- Document generation
- Build commands
- Check commands
- README rendering (currently disabled)

### Dependencies to Review
- **dplyr**: Listed in DESCRIPTION but no obvious usage in code
- **readr**: Used by `text_from_github()` for `read_lines()`
- **usethis**: Used by several functions for path operations
- **ggplot2**: Used by `theme_leary()`

---

## Estimated Total Effort

| Priority Level | Total Time | Complexity |
|---------------|-----------|------------|
| **Priority 1** | 3-4 hours | Low |
| **Priority 2** | 8-13 hours | Medium |
| **Priority 3** | 12-17 hours | Medium |
| **Total** | 23-34 hours | - |

**Recommended Approach:** 
1. Complete all Priority 1 items first (one session)
2. Tackle Priority 2 items over 2-3 sessions
3. Address Priority 3 items as needed based on package goals

---

## Notes

- This is a personal learning package, so standards can be adjusted based on goals
- If planning CRAN submission, all Priority 1 and 2 items should be completed
- The package shows good understanding of R package structure
- Main gaps are testing and code modernization
- Consider whether some TODO items (templates, color palette) align with current goals

---

**Last Updated:** 2026-01-23  
**Next Review:** After completing Priority 1 items
