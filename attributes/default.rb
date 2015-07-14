#
# Cookbook Name: common_servers
# Attributes: default
#

default[:common_server] = {
  # What should we use for client max body size? This affects the maximum
  # upload file size. Default: 100M

  :client_max_body_size => '500M',

  :http_white_list => {
    # Should we reject all HTTP verbs that are not whitelisted?
    :enabled => true,

    # What verbs should we accept when whitelisting?
    :accepted_verbs => [
      'ACL',
      'BASELINE-CONTROL',
      'CHECKIN',
      'CHECKOUT',
      'CONNECT',
      'COPY',
      'DELETE',
      'GET',
      'HEAD',
      'LABEL',
      'LOCK',
      'MERGE',
      'MKACTIVITY',
      'MKCOL',
      'MKWORKSPACE',
      'MOVE',
      'OPTIONS',
      'ORDERPATCH',
      'PATCH',
      'POST',
      'PROPFIND',
      'PROPPATCH',
      'PUT',
      'REPORT',
      'SEARCH',
      'TRACE',
      'UNCHECKOUT',
      'UNLOCK',
      'UPDATE',
      'VERSION-CONTROL'
    ]
  }
}
