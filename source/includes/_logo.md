# Logo
## Get logo url

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/logo" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/logo",
    type: "GET",
    headers: {
        "Authorization": "token",
    },
})
.done(function(data, textStatus, jqXHR) {
    console.log("HTTP Request Succeeded: " + jqXHR.status);
    console.log(data);
})
.fail(function(jqXHR, textStatus, errorThrown) {
    console.log("HTTP Request Failed");
})
.always(function() {
    /* ... */
});

```

> The above command returns JSON structured like this:

```json
{
    "logo": "https://cloudfront.net/logos/some_logo_url"
}
```

This endpoint returns an URL for the mechanic's logo. The logo can be the mechanic's
personal logo, if the mechanic uploaded one, or it can be a fallback logo.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/logo`

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | --------------------------------------------------------
logo       | String  | no            | The URL for the mechnic's personal logo or a fallback logo.

