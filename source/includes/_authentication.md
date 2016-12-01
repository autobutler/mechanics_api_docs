# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "api_endpoint_here",
  headers: {
    "Authorization": "token",
  },
})
```

> Make sure to replace `token` with your API token.

The API uses short lived tokens for authentication, which must be passed via the
`Authorization` header. These tokens can be optained through the
<a href="#create-a-new-api-token">tokens</a> endpoint.

<aside class="notice">
Please note that API tokens will expire. An expired token will always result in
a <code>401: Unauthorized</code> error, upon which you must optain a new token.
</aside>
