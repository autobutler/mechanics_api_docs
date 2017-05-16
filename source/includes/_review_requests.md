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
      "reviewRequest": {}
    }
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
review_request     | object  | no            | A <a href="#reviewrequest">reviewRequest</a> object that contains the details of the review request

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
  "reviewRequest": {}
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
review_request     | object  | no            | A <a href="#reviewrequest">reviewRequest</a> object that contains the details of the review request

## Review: Get reviews from review requests
> To get reviews from review requests, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/review_requests/reviews" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/review_requests/reviews",
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
  "reviews": [
    {
      "review": {},
      "reviewRequest": {}
    }
  ]
}
```

This endpoint returns a list of reviews that came from a review request.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/review_requests/reviews`

### Response JSON

Attribute       | Type    | Can be blank? | Description
--------------- | ------- | ------------- | -----------------------------------------------------------------------------------------------------------------------------
review          | object  | no            | A <a href="#review">review</a> object that contains the details of the review
review_request  | object  | no            | A <a href="#reviewrequest">reviewRequest</a> object that contains the details of the review request

## Review: Respond to a review

> To respond to a review from a review request, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/review_requests/reviews/{reviewId}/respond" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"body\": \"Some respond.\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/review_requests/reviews/{reviewId}/respond",
    type: "POST",
    headers: {
        "Authorization": "token",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "body": "Some respond."
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

> The above command returns JSON structured like this:

```json
{
  "success": true
}
```

This endpoint creates a respond to a review from a review request.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/review_requests/reviews/{reviewId}/respond`

### Request JSON

Attribute | Type    | Required? | Description
----------|---------|-----------|------------------
body      | string  | yes       | The respond text

### Response JSON

Attribute  | Type    | Can be blank? | Description
-----------| ------- | ------------- | -----------------
success    | boolean | no            | Indicates whether or not a respond to the review was created
