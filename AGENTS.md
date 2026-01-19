# AGENTS.md - AI Assistant Guide for learylib

## Package Overview

**learylib** is a personal R package by Matt Leary containing utility functions for daily R workflow. It's an experimental package distributed via GitHub (not CRAN).

- **Version**: 0.5.2
- **Author**: Matt Leary (matt.leary@protonmail.com)
- **Repository**: https://github.com/mleary/learylib
- **License**: MIT

## Package Structure

```
learylib/
├── R/                    # Source code (10 files)
├── man/                  # Generated roxygen2 documentation
├── tests/                # Spell-check test only (no unit tests)
├── docs/                 # pkgdown generated website
├── plans/                # Development plans and upgrade documentation
├── .github/workflows/    # GitHub Actions CI/CD
├── DESCRIPTION           # Package metadata
├── NAMESPACE             # Generated exports
├── README.md             # Package documentation
├── NEWS.md               # Changelog
├── _pkgdown.yml          # pkgdown site configuration
└── run-checks.R          # Build script
```

## Dependencies

**Imports**: ggplot2, dplyr, readr, usethis  
**Suggests**: spelling

## Exported Functions (9 total)

### Helper Functions
| Function | Purpose |
|----------|---------|
| `see_pkg_funcs(package)` | List all functions in an installed R package |
| `see_lib_paths()` | Pretty-print library paths |
| `not_in(x, y)` | Negated `%in%` operator |
| `not_na(x)` | Negated `is.na()` |
| `copy_to_clipboard(data.input)` | Copy data frame to system clipboard |

### .Rprofile Management
| Function | Purpose |
|----------|---------|
| `rprofile_clear()` | Clear/reset an .Rprofile file |
| `rprofile_update()` | Update .Rprofile from GitHub template |

### Plotting
| Function | Purpose |
|----------|---------|
| `theme_leary()` | Custom minimal ggplot2 theme (Helvetica, minimal base) |

### Debugging
| Function | Purpose |
|----------|---------|
| `search_last_error()` | Google search the last R error message |

### Internal (not exported)
| Function | Purpose |
|----------|---------|
| `text_from_github(url)` | Fetch raw text files from GitHub |

## Development Workflow

### Building the Package
Run `run-checks.R` or execute these steps:

```r
devtools::document()      # Generate Rd files and NAMESPACE
pkgdown::build_site()     # Generate website documentation
devtools::check()         # Run R CMD check
```

### Documentation
- Uses **roxygen2** for documentation (comments in R files → man/*.Rd)
- Uses **pkgdown** for website generation (→ docs/)
- All functions should have `@param`, `@details`, `@examples`, `@export` tags

### Testing
- Currently minimal: only spell-check test exists
- No unit test framework (testthat) implemented yet
- GitHub Actions runs R CMD check on Windows

## Code Conventions

### Style
- 2-space indentation
- UTF-8 encoding
- roxygen2 documentation blocks above each function

### Patterns Used
- `deparse(substitute())` for capturing unquoted arguments
- `tryCatch()` for error handling
- `message()` for user feedback (not `print()` or `cat()` for info)
- Thin wrappers for common negation operations

### Imports
Functions use explicit imports via `@importFrom`:
```r
#' @importFrom ggplot2 theme_minimal theme element_text rel
```

## Key Files to Know

| File | Purpose |
|------|---------|
| `DESCRIPTION` | Package metadata, version, dependencies |
| `NAMESPACE` | Generated - do not edit manually |
| `NEWS.md` | Version changelog |
| `_pkgdown.yml` | Website structure and navigation |
| `run-checks.R` | Build automation script |

## When Adding New Functions

1. Create new `.R` file in `R/` directory
2. Add roxygen2 documentation with `@export` tag
3. Include `@examples` section
4. Run `devtools::document()` to generate `.Rd` file
5. Update `_pkgdown.yml` to include function in appropriate section
6. Update `NEWS.md` with change description
7. Bump version in `DESCRIPTION` if appropriate
8. Run `devtools::check()` before committing

## Known Issues / TODOs (from README)

- [ ] Add comprehensive unit tests (testthat)
- [ ] Create Xaringan presentation template
- [ ] Create Rmarkdown template  
- [ ] Clean up ggplot theme, create color palette
- [ ] Explore more pkgdown/usethis capabilities
- [ ] Implement CI/CD best practices

## External Dependencies

The `rprofile_update()` function defaults to fetching from Matt's personal dotfiles repository:
- URL: `https://raw.githubusercontent.com/mleary/dotfiles/master/.Rprofile`

## Project Planning and Documentation

### Plans Directory

All development plans, upgrade strategies, and architectural decisions should be documented in the `plans/` directory. This helps maintain context across development sessions and provides a record of decision-making.

#### Plan Naming Convention
Plans should be numbered and descriptive:
- `01_{intent_of_plan}.md` - First plan (e.g., `01_package_upgrade_plan.md`)
- `02_{intent_of_plan}.md` - Second plan (e.g., `02_testing_strategy.md`)
- `03_{intent_of_plan}.md` - Third plan, etc.

#### When to Create a Plan
Create a new plan document when:
- Starting a major upgrade or refactoring effort
- Planning a new feature that affects multiple functions
- Documenting architectural decisions
- Outlining a testing or documentation strategy
- Working through a complex problem that needs structure

#### Plan Structure
Plans should typically include:
- **Executive Summary** - What and why
- **Current State Assessment** - What exists now
- **Goals** - What success looks like
- **Tasks** - Actionable steps, ideally with checkboxes
- **Timeline** - Estimated effort and milestones
- **Risks** - What could go wrong and mitigations
- **Next Steps** - Immediate actions to take

#### Using Plans in Development
- Reference plan numbers in commit messages (e.g., "Fix typos - Phase 1 of Plan 01")
- Update plans as work progresses (check off completed tasks)
- Create new plans when scope expands significantly
- Keep plans focused - create a new plan rather than expanding an existing one endlessly

## Notes for AI Assistants

- This is a **personal utility package** - changes should maintain the simple, practical nature
- Functions marked as "experimental" (`not_in`, `not_na`) may be temporary
- The package hasn't been actively updated since August 2020
- No CRAN submission planned - GitHub-only distribution
- When modifying functions, preserve the `@examples` sections for documentation
- The package uses base R pipe style in examples where pipes are needed
- **Before starting significant work**, create or review a plan in the `plans/` directory
- **Generate plans first, execute later** - always get user approval on the plan before implementation
