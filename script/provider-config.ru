require 'json'

run -> (env) {
  status = 200
  headers = {'Content-Type' => 'application/json'}
  body = {'message' => 'Hello world'}.to_json
  [status, headers, [body]]
}
