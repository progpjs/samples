# ProgpJS v2 - Samples

## Introduction

Here you will found samples about ProgpJS:  
* How to embed the engine.  
* Samples about exposing Go function to javascript.  
* Samples about calling javascript from Go.  
* Samples about how embedding a javascript module inside the generated executable.  

See https://github.com/progpjs/progpjs for more information.

## How to start

You first have to clone the project with his submodules.
> git clone --recurse-submodules https://github.com/progpjs/samples

Once done you can run the sample project by doing:
> cd ./embedProgpJs
> go run .

It will execute the script **./sampleProject/index.ts** when starting.

## Special files

There is two special file allowing to help you when developing.  

* **plugAndPlay_EnabledJavascript.go** - It allows to enable javascript support.
If this file is removed (or renamed with a underscore before his name) then
the javascript engine will be disabled. It's interested if you want to test
things without waiting 5 to 10 seconds until the project compile.
Here **plugAndPlay_EnableCompiledMode.go** must be disabled too.

* **plugAndPlay_EnableCompiledMode.go** - It's enable the compiled mode, which is
the faster execution mode. The other modes are *dynamic mode* which allows using
  ProgpJs as a simple Go library. And *plugin mode*.

## Enabling plugin mode

This execution mode allows to move the javascript engine into a dynamic library
which is loaded at runtime. It allows short compilation time, which is way better
when developing with ProgpJs. It can also be used for production, but have to mind
that the plugin is linked to your exact Go version, your os type (linux x64/arm, or darwin)
and the exact version of the projects *progpjs.progpjs* and *progpjs.progpV8Engine*.

### Enabling it for production

In order to use plugin mode, the first step is to create the plugin himself.
For that execute the script **createPlugin_prod.sh**, which will build the file
**./plugins/progpV8.so**. Once done you have to delete/disable the file
**plugAndPlay_EnableCompiledMode.go** in order to avoid using compiled mode.

### Enabling it for dev

When debugging Go code, the Go system don't use the same internal libraries which
result in incompatibility with the plugin mode. It ok when executing, but crash when debugging.
In order to avoid that, the idea is to force Go to always use the internal version used to debug.

How to do that? Here we have to use this Go flags when building / running our project: **-gcflags='all=-N -l'**.
The script **createPlugin_dev.sh** already add it but you have to add it to your project build/run config.
For example you can do:

> go run -gcflags='all=-N -l' .