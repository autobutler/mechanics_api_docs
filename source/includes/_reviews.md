# Reviews

## Get a list of reviews

> To obtain a list of reviews, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/reviews" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/reviews",
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
      "review": {
        "id": 70116,
        "author": "Lars Larsen",
        "createdAt": "2017-05-01T15:45:25.852+02:00",
        "comment": "",
        "additionalComment": "",
        "rating": 3,
        "reviewRatings": [
          {
            "rating": null,
            "category": "Test 3"
          },
          {
            "rating": null,
            "category": "Test 2"
          },
          {
            "rating": null,
            "category": "Test 1"
          }
        ]
      },
      "offer": {},
      "job": {}
    }
  ]
}
```

This endpoint returns a list of reviews for the workshop filtered by year and month.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/reviews`

### Query Parameters

Parameter | Type    | Default | Required | Description
--------- | ------  | ------- | -------- | ----------------------------------
year      | integer | `null`  | no       | Filter the results to reviews that were created within this year. Defaults to the current year.
month     | integer | `null`  | no       | Filter the results to reviews that were created within this month number. Defaults to the current month number.

### Response JSON

Attribute                    | Type          | Can be blank? | Description
---------------------------- | -------       | ------------- | -----------------
review                       | object        | no            | The review object
review.id                    | integer       | no            | The id of the review
review.author                | string        | no            | Author of the review
review.createdAt             | string        | no            | A timestamp for when the review was created
review.comment               | string        | yes           | A comment the author wrote for the review
review.additionalComment     | string        | yes           | An additional comment the author wrote for the review
review.rating                | integer       | no            | A number from 1-5 the author gave
review.reviewRatings         | array(object) | no            | An array of ratings included in the review
review.reviewRatings.rating  | integer       | yes           | A number from 1-5 for additional ratings
review.reviewRatings.category| string        | no            | A description of the additional rating
offer                        | object        | yes           | An <a href="#offerdetails">offerDetails</a> object associated with the review. Is empty if the review came from a review request
job                          | object        | yes           | A <a href="#jobdetails">jobDetails</a> object associated with the review. Is empty if the review came from a review request

## Respond to a review

> To respond to a review, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/reviews/{reviewId}/respond" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"body\": \"Some respond.\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/reviews/{reviewId}/respond",
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

This endpoint creates a respond to a review.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/reviews/{reviewId}/respond`

### Request JSON

Attribute | Type    | Required? | Description
----------|---------|-----------|------------------
body      | string  | yes       | The respond text

### Response JSON

Attribute  | Type    | Can be blank? | Description
-----------| ------- | ------------- | -----------------
success    | boolean | no            | Indicates whether or not a respond to the review was created              
