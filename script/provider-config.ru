require 'json'

run -> (env) {
  status = 200
  headers = {'Content-Type' => 'application/json'}
  body = {'data' => []}.to_json
  [status, headers, [body]]
}

# What a valid result _should_ look like
# run -> (env) {
#   status = 200
#   headers = {'Content-Type' => 'application/json'}
#   body = {'data' => [
#     {
#       "statement_date": "2019-11-03",
#       "actions": [
#         {
#           "type": "GET",
#           "href": "https://example.com/path/to/2019document.pdf",
#           "rel": "download-pdf"
#         }
#       ]
#     }
#   ]}.to_json
#   [status, headers, [body]]
# }
