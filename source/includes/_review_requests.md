# Review Request

## Get a list of Review Requests

> To obtain a list of Review Requests, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/review_requests" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/review_requests",
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
  "reviewRequests": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "some@email",
      "phoneNumber": "12345678",
      "registrationNumber": "AA11111",
      "make": "Ford",
      "model": "Focus",
      "comment": "Some comment",
      "createdAt": "2017-01-01",
      "expiresAt": "2017-01-01",
      "jobName": "Service"
    },
  ]
}
```

This endpoint returns a list of all review requests for the mechanic
ordered by their title.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/review_requests`

### Response JSON

Attribute          | Type    | Can be blank? | Description
------------------ | ------- | ------------- | ------------------------------------------
id                 | integer | no            | The id of the Review Request
name               | string  | yes           | The name of the car owner
email              | string  | yes           | The email of the car owner
phoneNumner        | string  | yes           | The phone number of the car owner
registrationNumber | string  | yes           | The registration number of the car
make               | string  | yes           | The make of the car
model              | string  | yes           | The model of the car
comment            | string  | yes           | The comment for the review requst
createdAt          | string  | yes           | The timestamp when the request was created
expiresAt          | string  | yes           | The timestamp when the request expires
jobName            | string  | yes           | The translated name for the job tasks

## Create new Review Request

> To create a new Review Request, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/review_requests" \
> -H "token" \
> -H "Content-Type: application/json; charset=utf-8" \
> -d "{\"title\":\"Wubba Lubba\",\"signature\":\"dub dub\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/review_requests",
    type: "POST",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
      "reviewRequest": {
        "name": "John Doe",
        "email": "some@gemail",
        "phoneNumber": "12345678",
        "registrationNumber": "AA11111",
        "make": "Ford",
        "model": "Focus",
        "comment": "Some comment",
        "jobTaskTypeIds": [1, 2]
      }
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

> The above command returns JSON structured like this when the Review Request was created successfully:

```json
{
  "success": true
}
```

> The above command returns JSON structured like this when the Review Request could not be created:

```json
{
  "success": false
}
```

This endpoint creates a new Review Request for the workshop.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/review_requests`

### Request JSON

Attribute          | Type    | Can be blank? | Description
------------------ | ------- | ------------- | ------------------------------------------
name               | string  | yes           | The name of the car owner
email              | string  | yes           | The email of the car owner
phoneNumner        | string  | yes           | The phone number of the car owner
registrationNumber | string  | yes           | The registration number of the car
make               | string  | yes           | The make of the car
model              | string  | yes           | The model of the car
comment            | string  | yes           | The comment for the review requst
createdAt          | string  | yes           | The timestamp when the request was created
expiresAt          | string  | yes           | The timestamp when the request expires
jobTaskTypeIds     | array   | yes           | The ids of the job task types

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
success    | boolean | no            | Weather or not the Review Request could be created

### Potential Errors

Error Code | Meaning
---------- | -----------------------------------------------------------------------------------------
400        | The Review Request could not be created. See the `errors`-value in the response for details

## Get an existing Review Request

> To get an existing Review Request, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/review_requests/1" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/review_requests/1",
    type: "GET",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json"
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

> The above command returns JSON structured like this when the Review Request was updated successfully:

```json
{
  "reviewRequest": {
    "id": 1,
    "name": "John Doe",
    "email": "some@email",
    "phoneNumber": "12345678",
    "registrationNumber": "AA11111",
    "make": "Ford",
    "model": "Focus",
    "comment": "Some comment",
    "createdAt": "2017-01-01",
    "expiresAt": "2017-01-01",
    "jobName": "Service"
  }
}
```

This endpoint gets an existing Review Request that belongs to the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/review_requests/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Review Request

### Response JSON

Attribute          | Type    | Can be blank? | Description
------------------ | ------- | ------------- | ------------------------------------------
id                 | integer | no            | The id of the Review Request
name               | string  | yes           | The name of the car owner
email              | string  | yes           | The email of the car owner
phoneNumner        | string  | yes           | The phone number of the car owner
registrationNumber | string  | yes           | The registration number of the car
make               | string  | yes           | The make of the car
model              | string  | yes           | The model of the car
comment            | string  | yes           | The comment for the review requst
createdAt          | string  | yes           | The timestamp when the request was created
expiresAt          | string  | yes           | The timestamp when the request expires
jobName            | string  | yes           | The translated name for the job tasks
