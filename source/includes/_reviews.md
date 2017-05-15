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
      "job": {}
    }
  ],
  "pagination": {
    "currentPage": 1,
    "entriesPerPage": 20,
    "totalEntries": 4144,
    "totalPages": 208
  },
  "filter": {
    "attributes": {
      "jobTaskTypeId": null,
      "makeId": null
    },
    "search": null
  }
}
```

This endpoint returns a list of reviews for the workshop filtered by year and month.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/reviews`

### Query Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | -----------------------------------------------------------------------------------------------------------------------------------
page          | 1       | no        | The page of the result to return
makeId        | null    | no        | Only show reviews for jobs where the car is of the given make
jobTaskTypeId | null    | no        | Only show reviews for jobs that contain at least one job task of the given type
search        | null    | no        | Only show reviews for jobs where the reference number, registration number, car make, car model or job name matches the given string

### Response JSON

Attribute                             | Type          | Can be blank? | Description
------------------------------------- | -------       | ------------- | -----------------
reviews                               | array(object) | no            | A list of reviews and their associated job and offer
reviews.review                        | object        | no            | The review object
reviews.review.id                     | integer       | no            | The id of the review
reviews.review.author                 | string        | no            | Author of the review
reviews.review.createdAt              | string        | no            | A timestamp for when the review was created
reviews.review.comment                | string        | yes           | A comment the author wrote for the review
reviews.review.additionalComment      | string        | yes           | An additional comment the author wrote for the review
reviews.review.rating                 | integer       | no            | A number from 1-5 the author gave
reviews.review.reviewRatings          | array(object) | no            | An array of ratings included in the review
reviews.review.reviewRatings.rating   | integer       | yes           | A number from 1-5 for additional ratings
reviews.review.reviewRatings.category | string        | no            | A description of the additional rating
reviews.offer                         | object        | yes           | An <a href="#offerdetails">offerDetails</a> object associated with the review. Is empty if the review came from a review request
reviews.job                           | object        | yes           | A <a href="#jobdetails">jobDetails</a> object associated with the review. Is empty if the review came from a review request
pagination                            | object        | no            | A <a href="#pagination">pagination</a> object
filter                                | object        | no            | A <a href="#jobfilter">jobFilter</a> object

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
