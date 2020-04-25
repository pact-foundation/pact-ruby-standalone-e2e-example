require 'json'

run -> (env) {
  puts "Foo1 header #{env['HTTP_FOO1']}"
  puts "Foo2 header #{env['HTTP_FOO2']}"
  status = 200
  headers = {'Content-Type' => 'application/json'}
  body = {'message' => 'Hello world'}.to_json
  [status, headers, [body]]
}
