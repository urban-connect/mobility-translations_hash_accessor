# CLAUDE.md

## Project Overview

`mobility-translations_hash_accessor` — a Mobility plugin gem that adds `{attribute}_translations_hash` reader methods to models.

## Common Commands

```shell
bundle install              # Install dependencies
bundle exec rspec           # Run all tests
bundle exec standardrb      # Run linting
bundle exec standardrb --fix # Auto-fix lint issues
```

## Coding Conventions

- Always start every new file with `# frozen_string_literal: true`
- Always put `private` directly before the method name: `private def method_name`
- Run `bundle exec standardrb --fix` to auto-correct lint issues when possible before committing
- Do not commit unless explicitly asked to
- Do not push branches unless explicitly asked to
- Never force push
- Keep branch names short but readable
