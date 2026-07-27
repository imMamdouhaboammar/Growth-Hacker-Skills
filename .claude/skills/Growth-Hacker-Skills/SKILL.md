```markdown
# Growth-Hacker-Skills Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill documents the development patterns and conventions used in the Growth-Hacker-Skills repository, a TypeScript codebase focused on growth hacking utilities and skills. It outlines file organization, code style, commit practices, and testing patterns to ensure consistency and maintainability.

## Coding Conventions

### File Naming
- Use **kebab-case** for all file names.
  - Example:  
    ```
    growth-hacker-utils.ts
    user-profile.test.ts
    ```

### Import Style
- Use **relative imports** for modules within the codebase.
  - Example:
    ```typescript
    import { getUserGrowth } from './user-growth';
    ```

### Export Style
- Use **named exports** for all modules.
  - Example:
    ```typescript
    // user-growth.ts
    export function getUserGrowth() { ... }
    ```

### Commit Messages
- Follow **conventional commit** style.
- Use the `docs` prefix for documentation changes.
  - Example:
    ```
    docs: update README with usage examples
    ```

## Workflows

### Documentation Update
**Trigger:** When updating or adding documentation files  
**Command:** `/update-docs`

1. Edit or add documentation in markdown files.
2. Stage your changes:
    ```
    git add <file>
    ```
3. Commit using the conventional commit style with the `docs` prefix:
    ```
    git commit -m "docs: update documentation for feature X"
    ```
4. Push your changes:
    ```
    git push
    ```

## Testing Patterns

- Test files use the `*.test.*` naming pattern.
  - Example:  
    ```
    growth-hacker-utils.test.ts
    ```
- The testing framework is not specified; ensure tests are colocated with the code they test and follow the naming convention.
- Example test file structure:
    ```typescript
    // growth-hacker-utils.test.ts
    import { getUserGrowth } from './user-growth';

    describe('getUserGrowth', () => {
      it('should calculate growth correctly', () => {
        // test implementation
      });
    });
    ```

## Commands
| Command       | Purpose                                   |
|---------------|-------------------------------------------|
| /update-docs  | Start the documentation update workflow   |
```
