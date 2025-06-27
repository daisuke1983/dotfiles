# Check E2E Test Quality

Please verify the following items in the E2E test code:

## Basic Checks

- Are there any hardcoded or dummy values in related pages or components?
- Do E2E test selectors use IDs?
- Do selectors actually exist in the pages or components?

## Wait Logic

- Does the code avoid `waitForTimeout()` and use `expect(locator).toBeVisible()` or `waitForLoadState()` for conditional waiting?
- Does file selection use `Promise.all([page.waitForEvent('filechooser'), button.click()])` pattern to prevent race conditions?
- Does it properly wait for dynamic content to load?

## Loop Safety

- Do loops compare previous and current counts, breaking if no decrease occurs?
- Are pre-update counts stored in separate variables for comparison?
- Is there a maximum retry limit to prevent infinite loops?

## Proper Playwright API Usage

- Does string clearing use `locator.fill('')` instead of `locator.clear()`?
- Do alert text tests use regex for partial matching instead of exact matching?
- Are debug logs consolidated using `test.step()` / `test.info()` instead of excessive `console.log`?

## Test Skip and Structure

- Does the code ensure page navigation beforehand to minimize individual skip conditions?
- Are conditional skips written as one-line `test.skip(condition, 'reason')`?
- Are test preconditions properly set up in `beforeEach` / `beforeAll`?

## Path and Temporary File Management

- Are all paths generated as absolute paths using `path.resolve(__dirname, ...)`?
- Are temporary files created in `os.tmpdir()` and deleted after tests?
- Does the code handle file paths containing spaces?

## Helper Functions for Duplicate Logic

- Are common operations like uploads and page navigation extracted into reusable functions?
- Is Page Object Model (POM) adopted for centralized selector management?
- Are common test data and configurations managed in one place?

## Selector Stability

- Are ID selectors prioritized?
- Does the code avoid selectors dependent on styles or DOM structure?
- Are complex CSS selectors avoided for readability and maintainability?
- Are data-testid attributes utilized?

## Cross-Platform Compatibility

- Does the code avoid OS-specific paths or commands?
- Are file path separators handled using `path.join()`?
- Are line ending differences considered?

## Failure Investigation

- Are trace and video saved only for failed cases?
- Are they configured to be saved as CI artifacts?
- Are major steps wrapped with `test.step()` for report visibility?
- Is error state properly captured?

## Performance and Flake Rate

- Is test execution time under 10 minutes?
- Is flake rate maintained below 2%?
- Are heavy operations like common login executed only once in `globalSetup`?
- Are parallelizable tests configured for parallel execution?

## Other Best Practices

- Is test data cleanup implemented?
- Is there retry logic for network errors and timeouts?
- Are environment-dependent settings managed via environment variables?
- Are tests independent (not relying on other tests)?
