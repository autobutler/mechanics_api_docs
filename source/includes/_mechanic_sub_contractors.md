# Mechanic Sub-contractors

## Get a list of Mechanic Sub-contractors

> To obtain a list of Mechanic Sub-contractors, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors",
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
  "mechanicSubContractors": [
    {
      "id": 1,
      "chainId": 1,
      "name": "Rasmus",
      "address": "136 avenue",
      "zip": "2000",
      "contact": "04567891"
    },
    {
      "id": 2,
      "chainId": 2,
      "name": "Andre",
      "address": "99 jagtvej",
      "zip": "1667",
      "contact": "12345678"
    }
  ]
}
```

This endpoint returns a list of all Mechanic sub contractors available for
the workshop ordered by their chain's name.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors`

### Response JSON

Attribute | Type    | Can be blank? | Description
--------- | ------- | ------------- | --------------------------------------------------------
id        | integer | no            | The id of the Mechanic sub contractor
chainId   | integer | no            | The chains Id
name      | string  | no            | The name of the Mechanic sub contractor
address   | string  | yes           | The address of the Mechanic sub contractor
zip       | integer | yes           | The zip of the Mechanic sub contractor
contact   | string  | yes           | The name of the person of contact to the Mechanic sub contractor

## Create new Mechanic sub contractor

> To create a new Mechanic sub contractor, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"chainId\":1,\"name\":\"Rasmus\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors",
    type: "POST",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "chainId": "1",
        "name": "Rasmus"
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

> The above command returns JSON structured like this when the Mechanic sub contractor was created successfully:

```json
{
  "success": true,
  "mechanicSubContractor": {
    "id":1442,
    "chainId":1,
    "name":"sub contractor's name",
    "address":null,
    "zip":null,
    "contact":null
  }
}
```

> The above command returns JSON structured like this when the Mechanic sub contractor could not be created:

```json
{
  "errors": {
    "chainId": [
      "must be filled out"
    ],
    "name": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint creates a new Mechanic sub contractor for the workshop.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors`

### Request JSON

Attribute | Type    | Required? | Description
--------- | ------- | --------- | ---------------------------------
chainId   | integer | yes       | The chain that the mechanic sub contractor belongs to
name      | string  | yes       | The name of the mechanic sub contractor
address   | string  | no        | The address of the Mechanic sub contractor
zip       | integer | no        | The zip of the Mechanic sub contractor
contact   | string  | no        | The name of the person of contact to the Mechanic sub contractor

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the Mechanic sub contractor from being created
id         | integer | yes           | The id of the newly created Mechanic sub contractor
success    | boolean | no            | Weather or not the Mechanic sub contractor could be created

### Potential Errors

Error Code | Meaning
---------- | -----------------------------------------------------------------------------------------
400        | The Mechanic sub contractor could not be created. See the `errors`-value in the response for details

## Update existing Mechanic sub contractor

> To update an existing Mechanic sub contractor, use the following code:

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors/1" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"name\":\"My name\",\"address\":\"My address\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors/1",
    type: "PATCH",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "title": "Foo Bar",
        "text": "My wonderful text"
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

> The above command returns JSON structured like this when the Mechanic sub contractor was updated successfully:

```json
{
  "success": true
}
```

> The above command returns JSON structured like this when the Mechanic sub contractor could not be updated:

```json
{
  "errors": {
    "name": [
      "must be filled out"
    ],
    "chainId": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint updates an existing Mechanic sub contractor that belongs to the workshop.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Mechanic sub contractor

### Request JSON

Attribute | Type    | Required? | Description
--------- | ------- | --------- | ---------------------------------
chainId   | integer | yes       | The chain that the Mechanic sub contractor belongs to
name      | string  | yes       | The name of the Mechanic sub contractor
address   | string  | no        | The address of the Mechanic sub contractor
zip       | integer | no        | The zip of the Mechanic sub contractor
contact   | string  | no        | The name of the person of contact to the Mechanic sub contractor

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the Mechanic sub contractor from being updated
success    | boolean | no            | Weather or not the Mechanic sub contractor could be updated

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
400        | The Mechanic sub contractor could not be updated. See the `errors`-value in the response for details
404        | The Mechanic sub contractor with the specified id could not be found or does not belong to the workshop

## Delete a Mechanic sub contractor

> To delete a Mechanic sub contractor, use the following code:

```shell
curl -X "DELETE" "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors/1" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors/1",
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

> The above command returns JSON structured like this when the Mechanic sub contractor was successfully deleted:

```json
{
  "success": true
}
```

> The above command returns JSON structured like this when the Mechanic sub contractor could not be deleted:

```json
{
  "success": false
}
```

This endpoint deletes the specified Mechanic sub contractor that belongs to the workshop

### HTTP Request

`DELETE https://www.autobutler.dk/api/v2/mechanics/mechanic_sub_contractors/1`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Mechanic sub contractor

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ------------------------------------------------
success    | boolean | no            | Weather or not the Mechanic sub contractor could be deleted

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
404        | The Mechanic sub contractor with the specified id could not be found or does not belong to the workshop
