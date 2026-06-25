# machin-gen ✨

A **template engine** written in [machin (MFL)](https://github.com/javimosch/machin). Single native binary, no dependencies — 22 KB.

Uses **closures** (`map[string]func`) for transform pipelines: `{{name|upper|reverse}}`.

```bash
machin-gen "Hello {{name}}!" name=World
# Hello World!

machin-gen "{{name|upper}}" name=hello
# HELLO

machin-gen "{{name|upper|reverse}}" name=hello
# OLLEH

machin-gen -f template.txt name=admin role=dev
```

## Template syntax

| Syntax | Description |
|--------|-------------|
| `{{key}}` | Replaced with value |
| `{{key|transform}}` | Value piped through transform |
| `{{key|t1|t2}}` | Multiple piped transforms |

### Transforms

| Transform | Description |
|-----------|-------------|
| `upper` | Uppercase |
| `lower` | Lowercase |
| `reverse` | Reverse string |
| `trim` | Trim whitespace |
| `len` | String length (digit) |
| `hex` | Hex encoding |

## Usage

```bash
machin-gen <template> [key=value ...]
machin-gen -f <file> [key=value ...]
machin-gen -h
```

## Build

```bash
./build.sh
```

## Install

```bash
curl -fsSL https://github.com/javimosch/machin-gen/releases/latest/download/gen -o gen && chmod +x gen
```

## How it works

Uses MFL's first-class **closures** stored in a `map[string]func` dispatch table. Each transform is a closure that takes a string and returns a string. Template placeholders are found with `index`/`substr`, split by pipe with `index`/`split`, and replaced with `replace`.

## License

MIT
