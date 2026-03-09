Run `git diff HEAD` to get all staged and unstaged changes, then review them for the following categories:

**1. Bugs**
- Logic errors, off-by-one, null/undefined access, race conditions
- Incorrect error handling (swallowed errors, wrong error types)
- State management issues (stale closures, missing dependency arrays)
- Type mismatches or unsafe type assertions

**2. Security**
- SQL/command/template injection vectors
- XSS vulnerabilities (unsanitized user input in HTML/JSX)
- Hardcoded secrets, API keys, or credentials
- Missing authentication or authorization checks
- Path traversal in file operations
- Insecure cryptography (MD5/SHA1 for passwords, weak random)

**3. Performance**
- N+1 database queries or missing query optimization
- Unnecessary re-renders or missing memoization (React)
- Missing database indexes on filtered/sorted columns
- Synchronous I/O operations that should be async
- Large objects created inside loops
- Missing pagination on unbounded queries

**4. Correctness**
- Edge cases: empty arrays, null values, zero-length strings, negative numbers
- Boundary conditions at pagination limits, API rate limits, timeout thresholds
- Concurrency issues: shared mutable state, missing locks
- Timezone handling: UTC vs local, daylight saving transitions

**5. Style**
- Naming consistency with existing codebase patterns
- Dead code or unreachable branches
- Overly complex conditionals that should be simplified
- Missing or misleading function/variable names

For each issue found, output in this format:

```
[SEVERITY] file_path:line_number
Description of the issue and why it matters.
Suggested fix:
  <code snippet>
```

Severity levels:
- **CRITICAL** — Will cause bugs, data loss, or security vulnerabilities in production
- **WARNING** — Likely to cause issues under certain conditions or degrades quality
- **SUGGESTION** — Improvement opportunity, not blocking

If no issues are found, confirm the code looks good with a one-line summary.
Be direct. Skip praise. Focus on problems and how to fix them.
