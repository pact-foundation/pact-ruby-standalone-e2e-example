require 'json'

run -> (env) {
  status = 200
  headers = {'Content-Type' => 'application/json'}
  body = "null"
  [status, headers, [body]]
}
