#!/bin/zsh

# Allows to reset the generated code.
# You need to execute this script if you have error about generated.cpp or generated.go.
# This errors comes from a change in the header of the Go function you are exporting.
#
# The idea is:
#   1- Code is generated for version A with parameters myfunction(a,b,c).
#   2- You remove or add parameters, now you have only myfunction(a).
#   3- When executing the compile throw an error because the generatred code is for myfunction(a,b,c) and no myfunction(a).

cp ./progpjs.progpV8Engine/_generatedBlank/* ./progpjs.progpV8Engine