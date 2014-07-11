require 'chef/http/http_request'

# Remove this patch once there is a released chef version which includes
# https://github.com/opscode/chef/pull/1471

class Chef
  class HTTP
    class HTTPRequest
      URI_SCHEME_DEFAULT_PORT ||= { 'http' => 80, 'https' => 443 }.freeze

      private
      def build_headers(headers)
        @headers = headers.dup
        # No response compression unless we asked for it explicitly:
        @headers[HTTPRequest::ACCEPT_ENCODING] ||= "identity"
        @headers['X-Chef-Version'] = ::Chef::VERSION

        # Only include port in Host header when it is not the default port
        # for the url scheme (80;443) - Fixes CHEF-5355
        host_header = uri_safe_host.dup
        host_header << ":#{port}" unless URI_SCHEME_DEFAULT_PORT[@url.scheme] == port.to_i
        @headers['Host'] = host_header unless @headers.keys.any? {|k| k.downcase.to_s == HOST_LOWER }

        @headers
      end
    end
  end
end
