#!/usr/bin/env -S just --justfile

set dotenv-load := true

alias d := dev
alias c := comply
alias k := check

# List available commands.
_default:
    just --list --unsorted

# Tasks to make the code-base comply with the rules. Mostly used in git hooks.
comply: fmt compile

# Check if the repository comply with the rules and ready to be pushed.
check: fmt compile

dev:
    typst watch template/template.typ --root .

fmt:
    typstyle format-all
    yamlfmt template/template.yml

compile:
    typst compile template/template.typ --root .
