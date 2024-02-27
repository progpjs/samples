# The "-b main" option allows tracking the last commit.
# Without that we are stuck to an old version.

git submodule add -b main https://github.com/progpjs/httpServer.git ./progpjs.httpServer
git submodule add -b main https://github.com/progpjs/modules.git ./progpjs.modules
git submodule add -b main https://github.com/progpjs/progpAPI.git ./progpjs.progpAPI
git submodule add -b main https://github.com/progpjs/progpjs.git ./progpjs.progpjs
git submodule add -b main https://github.com/progpjs/progpV8Engine.git ./progpjs.progpV8Engine
git submodule add -b main https://github.com/progpjs/embedProgpJs.git ./embedProgpJs
