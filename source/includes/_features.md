# Features

## Check if a feature flag is enabled for the mechanic

> To check if a feature flag is enabled for the mechanic, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/features/featureName" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/features/featureName",
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
  "enabled": true
}
```


This endpoint returns an object containing information about wether or not the
feature is enabled for the mechanic.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/features/{featureName}`

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | -----------------------
featureName   | null    | yes       | The name of the feature

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------------
enabled    | boolean | no            | Wether or not the requested feature is enabled for the mechanic
