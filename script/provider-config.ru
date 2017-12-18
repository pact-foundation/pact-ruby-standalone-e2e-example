require 'json'

run -> (env) {
  status = 200
  headers = {'Content-Type' => 'application/json'}
  body = {'message' => 'Ä'}.to_json
  [status, headers, [body]]
}
