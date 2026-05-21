# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.1] — 2026-05-22

### Fixed
- `$schema` URL in `plugin.json` corrected from `www.schemastore.org` to `json.schemastore.org`. Symmetric fix to the marketplace.json change in v0.2.0 (which incorrectly limited the schema fix to a single file).

## [0.2.0] — 2026-05-22

### Added
- Cross-agent install support via `vercel-labs/skills` CLI (`npx skills add cicdteam/google-go-style`).
- `metadata.pluginRoot` and per-plugin `skills` fields in `marketplace.json` for explicit skill discovery.

### Fixed
- `$schema` URL corrected from `www.schemastore.org` to `json.schemastore.org`.

## [0.1.0] - 2026-05-21

### Added

- Initial release.
- `google-go-style` skill: SKILL.md with quick rules and decision matrices,
  plus eight reference files (`api-design`, `documentation`, `errors`,
  `naming`, `package-layout`, `panics`, `strings-and-vars`, `tests`).
- Marketplace manifest (`.claude-plugin/marketplace.json`) so the plugin can
  be installed via `claude plugin marketplace add cicdteam/google-go-style`.
- GitHub Actions workflow that validates both JSON manifests on PR and push.
