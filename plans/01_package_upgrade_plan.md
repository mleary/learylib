# Package Upgrade Plan - learylib

**Date**: 2026-01-18  
**Status**: Draft  
**Version Target**: 0.6.0

## Executive Summary

This plan outlines comprehensive upgrades for the `learylib` R package, which has been dormant since August 2020. The package contains 9 utility functions that work functionally but have numerous documentation issues, typos, missing tests, and outdated practices. The upgrade will modernize the codebase while maintaining its simple, personal utility nature.

## Current State Assessment

### Package Health
- ✅ **Functional**: All 9 exported functions work as intended
- ⚠️ **Documentation**: Multiple typos, copy-paste errors, outdated references
- ❌ **Testing**: Zero unit test coverage (only spell-check test)
- ⚠️ **Code Quality**: Some platform-specific issues, inconsistent patterns
- ⚠️ **Maintenance**: Last update August 2020, README generation broken

### Known Critical Issues
1. **Copy-paste documentation error** in `copy_to_clipboard.R` (says "update .Rprofile")
2. **Windows-only clipboard function** (won't work on macOS/Linux)
3. **README.md generation broken** (commented out in `run-checks.R`)
4. **8 typos** across codebase (parameter names, error messages, docs)
5. **No unit tests** for any function

## Upgrade Phases

### Phase 1: Critical Fixes & Documentation ⚠️ HIGH PRIORITY

**Goal**: Fix critical bugs and documentation errors that affect usability

#### Tasks
- [ ] Fix `copy_to_clipboard.R` roxygen title (copy-paste error from `rprofile_update.R`)
- [ ] Fix parameter name typo: `additonal.term` → `additional.term` in `search_last_error()`
  - Add deprecation warning for old parameter name
  - Update documentation
- [ ] Fix "packge" → "package" typo in `see_pkg_funcs.R` error message
- [ ] Fix "you" → "your" typo in error messages (`rprofile_clear.R`, `rprofile_update.R`)
- [ ] Fix additional typos:
  - "hel me" → "help me" in `not_na.R`
  - "in in" → "in" in `copy_to_clipboard.R`
  - "most" → "must" in `see_pkg_funcs.R`
- [ ] Fix AGENTS.md reference to `master` branch → `main` branch
- [ ] Fix `tryCatch()` return value in `see_pkg_funcs()` (should return error message, not NULL)

**Deliverables**:
- All documentation accurate and typo-free
- Consistent error messages
- Proper function return values

**Estimated Effort**: 2-3 hours

---

### Phase 2: Cross-Platform Compatibility 🔧 HIGH PRIORITY

**Goal**: Make functions work consistently across Windows, macOS, and Linux

#### Tasks
- [ ] Fix `copy_to_clipboard()` to work on all platforms
  - Research clipboard access methods (clipr package?)
  - Add platform detection or add dependency
  - Update documentation to note platform limitations (if any remain)
  - Test on Windows, macOS, Linux
- [ ] Document any remaining platform-specific limitations

**Deliverables**:
- `copy_to_clipboard()` works on all major platforms OR is clearly documented as Windows-only
- Platform compatibility matrix in README

**Estimated Effort**: 3-4 hours

---

### Phase 3: Testing Infrastructure ✅ HIGH PRIORITY

**Goal**: Implement comprehensive unit testing with testthat

#### Tasks
- [ ] Set up testthat infrastructure
  - `usethis::use_testthat()`
  - Create test file structure
- [ ] Write unit tests for all 9 functions:
  - [ ] `copy_to_clipboard()` - test data frame conversion, row names handling
  - [ ] `not_in()` - test negation logic, edge cases (empty vectors, NA values)
  - [ ] `not_na()` - test negation logic, various input types
  - [ ] `rprofile_clear()` - test file writing (use temp files)
  - [ ] `rprofile_update()` - test open-only mode, download mode (mock HTTP)
  - [ ] `search_last_error()` - test URL construction, error message handling
  - [ ] `see_lib_paths()` - test output formatting
  - [ ] `see_pkg_funcs()` - test package listing, error handling for missing packages
  - [ ] `theme_leary()` - test theme object structure, parameter handling
- [ ] Write tests for internal function:
  - [ ] `text_from_github()` - test URL fetching (with mocked HTTP)
- [ ] Add code coverage reporting
  - `usethis::use_coverage()`
  - Add codecov badge to README
- [ ] Add GitHub Actions for test running
  - Update `.github/workflows/R-CMD-check.yaml` to run tests
  - Add coverage upload step

**Deliverables**:
- Minimum 80% code coverage
- All edge cases tested
- CI/CD runs tests automatically

**Estimated Effort**: 8-10 hours

---

### Phase 4: Documentation Improvements 📚 MEDIUM PRIORITY

**Goal**: Modernize and complete all documentation

#### Tasks
- [ ] Fix README.md generation pipeline
  - Debug why `devtools::build_readme()` creates "odd output"
  - Update `run-checks.R` to automate README generation
  - Remove manual step requirement
- [ ] Improve function documentation:
  - [ ] Add more detailed `@details` sections
  - [ ] Ensure all `@examples` are runnable and meaningful
  - [ ] Add `@return` documentation for all functions
  - [ ] Document all parameters clearly
- [ ] Update `theme_leary()` documentation
  - Mark current status (draft/incomplete)
  - Add examples showing theme in action
  - Document intended improvements
- [ ] Add pkgdown articles/vignettes:
  - "Getting Started with learylib"
  - ".Rprofile Management Workflow"
  - "Creating Custom ggplot2 Themes"
- [ ] Fix `_pkgdown.yml` incomplete navbar (line 36 trailing dash)
- [ ] Update NEWS.md with all changes from this upgrade

**Deliverables**:
- Complete, accurate documentation for all functions
- Automated README generation
- 2-3 pkgdown articles
- Updated changelog

**Estimated Effort**: 5-6 hours

---

### Phase 5: Code Quality & Consistency 🎨 MEDIUM PRIORITY

**Goal**: Improve code consistency and follow modern R package best practices

#### Tasks
- [ ] Standardize namespace prefixing strategy
  - Decide on consistent approach (explicit `package::function()` vs `@importFrom`)
  - Apply consistently across all files
- [ ] Add proper `@importFrom` tags where missing
  - Document all external function calls
  - Ensure NAMESPACE is complete
- [ ] Review and improve error messages
  - Make error messages more informative
  - Add suggestions for how to fix common errors
- [ ] Improve `search_last_error()` robustness
  - Add checks for whether there actually is an error
  - Handle edge cases better
- [ ] Document why `text_from_github()` is unexported
  - Add internal documentation comment
  - Or consider exporting if useful
- [ ] Update roxygen2 version requirement (currently 7.1.1, now at 7.3+)
- [ ] Review and update DESCRIPTION file
  - Update date
  - Review dependency versions
  - Add URLs field for pkgdown site

**Deliverables**:
- Consistent code style throughout
- Clear namespace management
- Better error handling

**Estimated Effort**: 4-5 hours

---

### Phase 6: Function Enhancements 🚀 LOW PRIORITY

**Goal**: Complete partially-implemented features and add polish

#### Tasks
- [ ] Enhance `theme_leary()`
  - Complete the theme design
  - Test font availability (Helvetica)
  - Add font fallback options
  - Consider creating companion color palette
  - Mark as stable (remove draft status) when complete
- [ ] Review experimental functions (`not_in()`, `not_na()`)
  - Decide whether to keep or remove
  - If keeping, remove "experimental" warning
  - If removing, add deprecation warnings first
- [ ] Consider adding suggested features from TODO:
  - Evaluate Xaringan template (still relevant in 2026?)
  - Evaluate Rmarkdown template (vs Quarto templates?)
  - Note: May defer these as separate projects

**Deliverables**:
- Completed `theme_leary()` function
- Decision on experimental functions
- Updated TODO list with realistic goals

**Estimated Effort**: 4-6 hours

---

### Phase 7: Modern R Ecosystem Updates 🔄 LOW PRIORITY

**Goal**: Update package to work with modern R ecosystem (2026 standards)

#### Tasks
- [ ] Review compatibility with R 4.x features
  - Native pipe `|>` (already using in examples)
  - New function argument syntax
  - Lambda function shortcuts
- [ ] Review dependency updates
  - ggplot2 (check for breaking changes since 2020)
  - dplyr (check for breaking changes since 2020)
  - readr (check for breaking changes since 2020)
  - usethis (check for new features)
- [ ] Consider new dependencies
  - clipr for clipboard (if not using already)
  - testthat 3e (third edition) for testing
- [ ] Update GitHub Actions workflows
  - Review for deprecated actions
  - Update R versions tested (R 4.3, 4.4, etc.)
  - Add macOS and Linux to test matrix
- [ ] Review pkgdown configuration
  - Update to pkgdown 2.x best practices
  - Review Bootstrap version
  - Update template if needed

**Deliverables**:
- Package works with latest R and package versions
- Modern GitHub Actions workflows
- Updated pkgdown site

**Estimated Effort**: 3-4 hours

---

## Implementation Strategy

### Recommended Order
1. **Phase 1** (Critical Fixes) - Do first, quick wins
2. **Phase 2** (Cross-Platform) - High impact, medium effort
3. **Phase 3** (Testing) - Foundation for future work
4. **Phase 4** (Documentation) - While fresh in mind
5. **Phase 5** (Code Quality) - Polish
6. **Phase 6** (Enhancements) - Nice to have
7. **Phase 7** (Modernization) - Ongoing maintenance

### Versioning Strategy
- **v0.5.3** - Phase 1 critical fixes (patch release)
- **v0.6.0** - Phase 2-3 complete (minor release - breaking changes to parameter names)
- **v0.7.0** - Phase 4-7 complete (minor release - full modernization)

### Testing Strategy
- Create development branch for work
- Test each phase independently
- Run `devtools::check()` after each phase
- Merge to main only when phase is complete and passing checks
- Tag releases after each version milestone

## Dependencies Review

### Current Dependencies
```
Imports: ggplot2, dplyr, readr, usethis
Suggests: spelling
```

### Potential New Dependencies
- **clipr**: Cross-platform clipboard access (Phase 2)
- **testthat** (>= 3.0.0): Unit testing (Phase 3)
- **mockery** or **httptest**: HTTP mocking for tests (Phase 3)
- **covr**: Code coverage (Phase 3)

### Dependencies to Review
- Check if all current dependencies are still needed
- Check for deprecated functions in dependencies
- Review minimum version requirements

## Risk Assessment

### Low Risk
- Phase 1 (typo fixes, documentation)
- Phase 4 (documentation improvements)
- Phase 5 (code style improvements)

### Medium Risk
- Phase 3 (testing infrastructure - time intensive but low technical risk)
- Phase 6 (function enhancements - scope creep risk)

### Higher Risk
- Phase 2 (cross-platform clipboard - may have technical limitations)
- Phase 7 (dependency updates - potential breaking changes)

### Mitigation Strategies
- Test thoroughly on all platforms before releasing Phase 2
- Pin dependency versions and update incrementally
- Maintain backward compatibility where possible
- Use semantic versioning to signal breaking changes
- Keep old parameter names with deprecation warnings

## Success Criteria

### Must Have (for v0.6.0)
- ✅ All critical typos fixed
- ✅ All functions documented accurately
- ✅ Cross-platform clipboard support or documented limitations
- ✅ >80% test coverage
- ✅ README generation automated
- ✅ All `devtools::check()` tests pass with 0 errors, 0 warnings

### Should Have (for v0.7.0)
- ✅ >90% test coverage
- ✅ pkgdown articles published
- ✅ `theme_leary()` completed
- ✅ Modern R ecosystem compatibility verified
- ✅ GitHub Actions running on multiple platforms

### Nice to Have (future)
- ✅ CRAN submission (if desired)
- ✅ Additional utility functions identified through use
- ✅ Templates (Xaringan, Rmarkdown, or Quarto)

## Timeline Estimate

### Fast Track (focused work)
- Phase 1: 1 day
- Phase 2: 1-2 days
- Phase 3: 2-3 days
- **Total to v0.6.0**: ~1 week of focused work

### Full Upgrade (including polish)
- Phases 1-3: 1 week
- Phases 4-5: 1 week
- Phases 6-7: 3-4 days
- **Total to v0.7.0**: ~2.5 weeks of focused work

### Relaxed Pace (part-time)
- **v0.6.0**: 2-3 weeks
- **v0.7.0**: 4-6 weeks

## Next Steps

1. **Review this plan** - Confirm priorities and scope
2. **Set up project tracking** - Create GitHub issues for each phase
3. **Create development branch** - `git checkout -b upgrade-2026`
4. **Start Phase 1** - Quick wins to build momentum
5. **Iterate and refine** - Adjust plan based on findings during implementation

## Notes

- This is a personal utility package - maintain simplicity
- Not all TODOs from 2020 may still be relevant in 2026
- Consider actual usage patterns when prioritizing enhancements
- Don't over-engineer - keep it practical and maintainable
- Plan is flexible - adjust based on discoveries during work

---

**Plan Author**: AI Assistant  
**Plan Owner**: Matt Leary  
**Last Updated**: 2026-01-18
