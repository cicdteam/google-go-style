# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-05-21

### Added

- Initial release.
- `google-go-style` skill: SKILL.md with quick rules and decision matrices,
  plus eight reference files (`api-design`, `documentation`, `errors`,
  `naming`, `package-layout`, `panics`, `strings-and-vars`, `tests`).
- Marketplace manifest (`.claude-plugin/marketplace.json`) so the plugin can
  be installed via `claude plugin marketplace add cicdteam/google-go-style`.
- GitHub Actions workflow that validates both JSON manifests on PR and push.
