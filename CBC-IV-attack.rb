require 'uri'
require 'base64'

iv="XF9yRXx0I4Q%3D"
auth="YmRtaW5pc3RyYXRvci0t0LNQg3%2BwClY%3D"

decode_IV=Base64.decode64(URI.unescape(iv))
decode_AUTH=Base64.decode64(URI.unescape(auth))



decode_IV[0]=('a'.ord^'b'.ord^decode_IV[0].ord).chr
decode_AUTH[0]='a'

puts decode_IV[0]

new_iv=URI.escape(Base64.strict_encode64(decode_IV),"+=/")
new_auth=URI.escape(Base64.strict_encode64(decode_AUTH),"+=/")

puts new_iv
puts new_auth