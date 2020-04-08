require 'json'

run -> (env) {
  status = 200
  headers = {'Content-Type' => 'application/json'}
  body = 1.to_json
  [status, headers, [body]]
}
