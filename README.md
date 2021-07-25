<!-- dart pub upgrade --null-safety  -->
dart pub global activate protoc_plugin
cmd: export PATH=/home/thuan/.pub-cache/bin:/usr/bin:/bin:/snap/bin
create folder "Proto" in ./lib 
cmd: protoc --dart_out=grpc:lib/Proto -Iprotos ./protos/server.proto