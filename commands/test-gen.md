Generate comprehensive tests for the most recently changed files (check git diff HEAD --name-only).

If no files have changed, ask the user which files to generate tests for.

**Step 1: Detect the test framework**
Check package.json, pyproject.toml, Cargo.toml, go.mod, or build.gradle to identify:
- JavaScript/TypeScript: Vitest, Jest, Mocha, or Playwright
- Python: pytest, unittest
- Go: built-in testing package
- Rust: built-in #[test] + proptest

If tests already exist in the project, match their patterns exactly (imports, assertions, file structure, naming conventions).

**Step 2: Analyze each changed file**
For every function, method, class, or exported module:
- Identify inputs, outputs, side effects, and error conditions
- Map the happy path and all edge cases
- Note any external dependencies that need mocking

**Step 3: Generate tests**

For each changed file, create tests covering:

*Happy path*
- Normal inputs produce expected outputs
- Standard use cases work correctly
- Return types match expectations

*Edge cases*
- Empty inputs: null, undefined, empty string, empty array, 0
- Boundary values: MAX_INT, very long strings, single-character strings
- Special characters: unicode, newlines, SQL-significant characters

*Error cases*
- Invalid inputs: wrong types, out-of-range values, malformed data
- Missing required fields
- Network/IO failures (when applicable)
- Permission errors (when applicable)

*Integration points*
- Mock external services (HTTP calls, database, file system)
- Verify correct arguments passed to dependencies
- Test retry logic and timeout handling if present

**Step 4: Output**
- Place test files according to project conventions:
  - Co-located `__tests__/` directories (React/Node convention)
  - Top-level `tests/` directory (Python convention)
  - Same directory with `_test` suffix (Go convention)
- Include all necessary imports and setup/teardown
- Add descriptive test names that explain the scenario, not the implementation
- Do NOT modify source code — only create test files

**Rules:**
- Every test must be independently runnable
- No test should depend on another test's state
- Use descriptive names: `test_returns_empty_list_when_no_results_found` not `test_1`
- Prefer explicit assertions over snapshot tests for logic
