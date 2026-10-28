# My Personal Gemini Preferences

## Communication Style

- Be concise in explanations unless I ask for verbose details.
- Never make commits unless I see a diff and explicitly approve.
- Ask questions if my directions aren't very clear.

## Coding Style Across All Projects
- Use descriptive variable names; example: prefer `username` over `name`.
- Prefer clear code over anything clever or novel.
- Prefer 2-space indentation.
- Always include error handling, never fail silently.

## Language Preferences
- Prefer Typescript over Javascript for all new projects.
- Use strict mode in Typescript (`"strict": true`).
- Avoid the `any` type; use `unknown` if the type is truly unknown.
- Prefer Vite as a build tool.
- Prefer Vitest as a testing tool.
- Prefer server-side rendering (SSR) over client-side Javascript for websites.

## AWS Architecture Preferences
- Prefer serverless over instance-based solutions; example: Lambda over EC2.
- Use managed services when possible; example: RDS/Aurora over self-managed databases.
- Default to using DynamoDB when possible but point out cases where it may not be a good fit.
- Default to event-driven architectures using EventBridge.
- Use an event-naming style of "domain.action"; example: `user.updated`.
- For infrastructure as code, use AWS CDK or raw Cloudformation.
- Look for ways to keep AWS CDK up to date.
- Include or add infrastructure tests to ensure that changes can be made safely.

## Non AWS Architecture Preferences
- Always use Infrastructure as Code to manage services.
- Prefer OpenTofu as the IaC tool.

## Git Conventions
- Follow Conventional Commits formatting.
- Use the following conventional commits types: feat, fix, docs, refactor, chore, test.
- Use the following conventional commits format: `type(scope): description`; example: `feat(api): add endpoint for updating user preferences`.
- Prefer small, self-contained changes for commits.
- For commit messages, use a single line summary with a more detailed explanation with a blank line in between.
- Word-wrap commit messages at a width of 72 characters.

## Testing
- Ensure a minimum of 80% code coverage for business logic.
- Use descriptive test names; example: `test("updating user preferences", () => {...});`.
- Mock external dependenices.
- Use the "Arrange, Act, Assert" testing pattern.

## Security Standards
- Never commit secrets and use environment variables where appropriate.
- Validate all user inputs.
- Use parameterized queries, never concatenation.
- Always sanitize data before rendering.

## Approach
- Think before acting. Read existing files before writing code.
- Be concise in output but thorough in reasoning.
- Prefer editing over rewriting whole files.
- Do not re-read files you have already read unless the file may have changed.
- Test your code before declaring done.
- No sycophantic openers or closing fluff.
- Keep solutions simple and direct. No over-engineering.
- If unsure: say so. Never guess or invent file paths.
- User instructions always override this file.

## Efficiency
- Read before writing. Understand the problem before coding.
- No redundant file reads. Read each file once.
- One focused coding pass. Avoid write-delete-rewrite cycles.
- Test once, fix if needed, verify once. No unnecessary iterations.
- Budget: 50 tool calls maximum. Work efficiently.

## Source Accuracy & Drafting Protocol
- Never fabricate statistics, data points, or claims not explicitly present in source documents.
- If a fact cannot be verified from provided sources, flag it as `[NEEDS SOURCE]` rather than including it.
- Cross-reference all data attributions to ensure they match the correct source document and author.
- Read first, write second. Read all provided source documents fully before drafting; do not begin writing until all sources are loaded.
- Maintain a source map. Track every factual claim, metric, name, or date back to its source. Present the draft clean (no inline tags), with a "Source Map" appendix listing each claim and its origin (document name, section/heading).
- Verify before delivering. For substantive documents (strategy docs, external-facing reports, review comments, posts, presentations), spawn a verification agent that re-reads each source and checks every claim in the source map. Mark any unverifiable claim as `[UNVERIFIED]`.
- Separate verified from unverified. Present the clean draft with unverified claims removed, plus a separate list of removed claims so I can decide whether to add them back with proper sourcing.
- No invention. Never generate statistics, percentages, quotes, or specific details not found in the sources — even if they seem plausible or "directionally correct."
