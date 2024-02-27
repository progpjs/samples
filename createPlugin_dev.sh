#!/bin/zsh

# This script will generate "_plugins/progpv8.so" which is a Go plugin contains the V8 engine.
# It's allows to reduce compilation time for about 5 seconds, to less than one.
#
# The counter part are:
# - The engine execute in dynamic mode, which is much slower.
# - Go uses an intermediate layer which make execution a little slower, it's sensible when benchmarking.
# - If you update things in progpjs.progpAPI, you must rebuild this plugin (Go warn you and emit a fatal when loading).
#
# To known: if you are using the plugin it's possible than Go emits a fatal saying you that the plugin isn't compatible.
#           This only in debug mode. To avoid this, you must add this option to the Go build params: -gcflags='all=-N -l'

# This step allows deleting compiled functions in order to only use dynamic functions.
# It's much slower but allows faster iteration when coding.
#
cp ./progpjs.progpV8Engine/_generatedBlank/* ./progpjs.progpV8Engine

# Build the plugin himself.
# If used in production, you have to remove gcflags.
#
go build -buildmode=plugin -gcflags='all=-N -l' -o ./_plugins/progpV8.so ./progpjs.progpV8Engine/asInstaller/installer.go