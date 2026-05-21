# google-go-style

A Claude Code plugin that ships a single skill: `google-go-style`. The skill
codifies the [Google Go Style Guide](https://google.github.io/styleguide/go/)
into actionable rules that Claude consults whenever you write, review, or
refactor Go code.

## About

This skill encodes my interpretation of the
[Google Go Style Guide](https://google.github.io/styleguide/go/) for use with
Claude Code. The upstream guide is © Google LLC, licensed under
[CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/). This skill (SKILL.md
and supporting files under `plugins/google-go-style/skills/google-go-style/`)
is my own work, licensed Apache-2.0.

## What it does

When loaded, Claude follows the rules in `SKILL.md` on every Go change. Topics
covered:

- Naming (receivers, initialisms, repetition, test doubles, package names)
- Error handling (`%v` vs `%w`, sentinels, RPC boundaries, `errors.Is` / `As`)
- Panics, `log.Fatal`, and `error` return — when each applies
- Test discipline (no assertion libraries, `t.Error` vs `t.Fatal`, goroutines)
- API design (option struct vs variadic options, interfaces, channel direction)
- Documentation conventions
- Package layout, imports, `internal/`
- Variable declaration, zero values, strings, shadowing

`SKILL.md` is the quick-reference. Eight files under `references/` carry the
detailed rules; Claude loads them on demand.

## Why

The upstream guide is large and not optimised for being consulted on every
file edit. This skill is a digest — it puts the rules Claude needs on the hot
path and leaves the long-form material as references it can fetch when a
specific topic comes up.

## Install

### Claude Code (native plugin)

    claude plugin marketplace add cicdteam/google-go-style
    claude plugin install google-go-style@cicdteam

### Cross-agent (Claude Code, Cursor, Codex, OpenCode, …)

    npx skills add cicdteam/google-go-style

After install, Claude loads the skill automatically when triggers in its
description match (writing or reviewing Go, error handling, panics, tests, API
design, naming, package layout, variables and strings).

## Semver

Versions follow [Semantic Versioning](https://semver.org/). Breaking changes
to the rule set or plugin layout bump the major; additive rule changes bump
the minor; fixes bump the patch. See `CHANGELOG.md` for per-release notes.

## Contributing

Issues are welcome — particularly if you spot a rule that contradicts the
upstream guide or that's no longer current. PRs are accepted on a best-effort
basis; please open an issue first for non-trivial changes so we can agree on
scope.

## Attribution

The skill is a derivative work based on the
[Google Go Style Guide](https://google.github.io/styleguide/go/), © Google
LLC, licensed under
[CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/). See `NOTICE` for
the full attribution.

## License

Apache-2.0. See `LICENSE`.
