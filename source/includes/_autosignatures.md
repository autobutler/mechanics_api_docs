# Auto Signatures

## Get a list of Auto Signatures

> To obtain a list of Auto Signatures, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/autosignatures" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/autosignatures",
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
  "autosignatures": [
    {
      "autosignature":
        {
          "id": 1,
          "title": "Hello",
          "signature":"World"
        },
      "autosignature":
        {
          "id": 2,
          "title": "another",
          "signature": "one"
        }
    }
  ]
}
```

This endpoint returns a list of all autosignatures for the mechanic
ordered by their title.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/autosignatures`

### Response JSON

Attribute | Type    | Can be blank? | Description
--------- | ------- | ------------- | --------------------------------------------------------
id        | integer | no            | The id of the Auto signature
title     | string  | no            | The title of the Auto signature
signature | string  | no            | The signature of the Auto signature

## Create new auto signature

> To create a new Auto signature, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/autosignatures" \
> -H "token" \
> -H "Content-Type: application/json; charset=utf-8" \
> -d "{\"title\":\"Wubba Lubba\",\"signature\":\"dub dub\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/autosignatures",
    type: "POST",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "title": "Wubba Lubba",
        "signature": "dub dub"
    })
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

> The above command returns JSON structured like this when the Auto Signature was created successfully:

```json
{
  "success": true,
  "autosignature":
    {
      "id": 269502,
      "title": "Wubba Lubba",
      "signature":"dub dub"
    }
}
```

> The above command returns JSON structured like this when the Auto Signature could not be created:

```json
{
  "errors": {
    "title": [
      "must be filled out"
    ],
    "signature": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint creates a new Auto Signature for the workshop.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/autosignatures`

### Request JSON

Attribute | Type   | Required? | Description
--------- | ------ | --------- | ---------------------------------
title     | string | yes       | The title of the Auto signature
signature | string | yes       | The signature of the Auto signature

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the Auto signature from being created
id         | integer | yes           | The id of the newly created Auto signature
success    | boolean | no            | Weather or not the Auto signature could be created

### Potential Errors

Error Code | Meaning
---------- | -----------------------------------------------------------------------------------------
400        | The Auto signature could not be created. See the `errors`-value in the response for details

## Update an existing Auto signature

> To update an existing Auto signature, use the following code:

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/autosignatures/1" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"title\":\"Foo Bar\",\"signature\":\"My signature\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/autosignatures/1",
    type: "PATCH",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "title": "Foo Bar",
        "signature": "My signature"
    })
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

> The above command returns JSON structured like this when the Auto signature was updated successfully:

```json
{
  "success": true,
  "autosignature": {
    "id":1,
    "title": "Foo Bar",
    "signature":"My signature"
  }
}
```

> The above command returns JSON structured like this when the Auto signature could not be updated:

```json
{
  "errors": {
    "title": [
      "must be filled out"
    ],
    "signature": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint updates an existing Auto signature that belongs to the workshop.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/autosignatures/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Auto signature

### Request JSON

Attribute | Type   | Required? | Description
--------- | ------ | --------- | ---------------------------------
title     | string | no        | The title of the Auto signature
signature | string | no        | The signature of the Auto signature

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the Auto signature from being updated
success    | boolean | no            | Weather or not the Auto signature could be updated

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
400        | The Auto signature could not be updated. See the `errors`-value in the response for details
404        | The Auto signature with the specified id could not be found or does not belong to the workshop

## Delete a Auto signature

> To delete a Auto signature, use the following code:

```shell
curl -X "DELETE" "https://www.autobutler.dk/api/v2/mechanics/autosignatures/1" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/autosignatures/1",
    type: "DELETE",
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

> The above command returns JSON structured like this when the Auto signature was successfully deleted:

```json
{
  "success": true
}
```

> The above command returns JSON structured like this when the Auto signature could not be deleted:

```json
{
  "success": false
}
```

This endpoint deletes the specified Auto signature that belongs to the workshop

### HTTP Request

`DELETE https://www.autobutler.dk/api/v2/mechanics/autosignatures/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Auto signature

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ------------------------------------------------
success    | boolean | no            | Weather or not the Auto signature could be deleted

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
404        | The Auto signature with the specified id could not be found or does not belong to the workshop
