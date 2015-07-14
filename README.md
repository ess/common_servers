Common Servers Cookbook for Engine Yard Cloud
=============================================

This cookbook allows you to manage a custom common/servers.conf for nginx on EngineYard Classic Cloud.

It is directly applicable to "solo" and "app" instances.

Client Max Body Size
--------------------

One can use the cookbook's `client_max_body_size` attribute to raise or lower the maximum size of a request that a client can make. Most typically, this is used to increase the maximum size of a file that a user can upload. If this value is not configured, it defaults to "100M"

```
# attributes/default.rb

default[:common_server] = {
  :client_max_body_size => '100M'
}
```

HTTP Verb Whitelisting
----------------------

In an effort to increase application security (or, at the least, reduce the app attack surface size a bit), one can use a verb whitelist to refuse requests for verbs that are not allowed. This functionality must be enabled via `default[:common_server][:http_white_list][:enabled]`, and the whitelist itself (`default[:common_server][:http_white_list][:accepted_verbs]`) is an array of HTTP verbs.

By default, the whitelist is **not** enabled.

```
# attributes/default.rb

default[:common_server] = {
  :http_white_list => {
    # Enable the whitelist
    :enabled => true,

    # Accept an incredibly small subset of verbs
    :accepted_verbs => [
      'GET',
      'POST',
      'PUT'
    ]
  }
}
```

Full Example
------------

Tying it all together, here's an example that uses all of the cookbook's functionality:

```
# attributes/default.rb

default[:common_server] = {
  :client_max_body_size => '500M',

  :http_white_list => {
    :enabled => true,

    :accepted_verbs => [
      'ACL',¬
      'BASELINE-CONTROL',¬
      'CHECKIN',¬
      'CHECKOUT',¬
      'CONNECT',¬
      'COPY',¬
      'DELETE',¬
      'GET',¬
      'HEAD',¬
      'LABEL',¬
      'LOCK',¬
      'MERGE',¬
      'MKACTIVITY',¬
      'MKCOL',¬
      'MKWORKSPACE',¬
      'MOVE',¬
      'OPTIONS',¬
      'ORDERPATCH',¬
      'PATCH',¬
      'POST',¬
      'PROPFIND',¬
      'PROPPATCH',¬
      'PUT',¬
      'REPORT',¬
      'SEARCH',¬
      'TRACE',¬
      'UNCHECKOUT',¬
      'UNLOCK',¬
      'UPDATE',¬
      'VERSION-CONTROL'
    ]
  }
}
```
