# Jobs

## Get a list of available jobs

> To obtain a list of jobs, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/jobs" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs",
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
  "jobs": []
}
```

This endpoint returns a list of jobs that are available for the workshop to bid
on.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/jobs`

### Response JSON

Attribute | Type    | Can be blank? | Description
--------- | ------- | ------------- | --------------------------------------------------------
jobs      | array   | no            | A list of <a href="#joboverview">jobOverview</a> objects

## Get job details

> To obtain the details of a job, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/jobs/123456" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs/123456",
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
  "job": {},
  "draftOffer": {},
  "offer": {},
  "user": {}
}
```

This endpoint returns the details of a specific job.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/jobs/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | -----------
id        | nil     | yes       | The id of the job

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | -----------------------------------------------------------------------------------------------------------------------------
job        | object  | no            | A <a href="#jobdetails">jobDetails</a> object that contains the details of the job
draftOffer | object  | yes           | A <a href="#draftofferdetails">draftOfferDetails</a> object that contains the details of the draft offer
offer      | object  | yes           | A <a href="#offerdetails">offerDetails</a> object that contains the details of the existing offer
user       | object  | no            | A <a href="#useroverview">userOverview</a> object that contains basic information about the recommended mechanic for this job

### Potential Errors

Error Code | Meaning
---------- | -------------------------------------------------------------------------------------
404        | The job with the specified id could not be found or is not available for the workshop
410        | The job is not visible by current mechanic, because it was completed by other mechanic



## Compare the offers of an accepted job

> To manually get the comparison of the offers for an accepted job, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/compare" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/compare",
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
  "yourOffer": {
    "totalPrice": 0,
    "totalPriceBest": true,
    "distance": 0,
    "distanceBest": true,
    "rating": 0,
    "ratingBest": true,
    "ratingCount": 0,
    "ratingCountBest": true,
    "acceptedJobCount": 0,
    "acceptedJobCountBest": true,
    "guaranteeOnParts": 0,
    "guaranteeOnPartsBest": true,
    "guaranteeOnWork": 0,
    "guaranteeOnWorkBest": true,
    "qualityOfParts": "string",
    "qualityOfPartsBest": true,
    "bodySize": 0,
    "bodySizeBest": true,
    "courtesyCar": 0,
    "courtesyCarBest": true,
    "availableOn": "string",
    "availableOnBest": true,
    "won": true,
    "lineItems": [
      {
        "id": 0,
        "articleNumber": "string",
        "category": "string",
        "createdAt": "string",
        "description": "string",
        "manufacturer": "string",
        "partnerData": {},
        "type": "string",
        "unit": "string",
        "customerPrice": 0,
        "discountPercent": 0,
        "grossPrice": 0,
        "netPrice": 0,
        "quantity": 0,
        "discountedCustomerPrice": 0,
        "discountedCustomerPriceWithVat": 0,
        "subtotal": 0,
        "subtotalWithVat": 0
      }
    ]
  },
  "otherOffers": [
    {
      "totalPrice": 0,
      "totalPriceBest": true,
      "distance": 0,
      "distanceBest": true,
      "rating": 0,
      "ratingBest": true,
      "ratingCount": 0,
      "ratingCountBest": true,
      "acceptedJobCount": 0,
      "acceptedJobCountBest": true,
      "guaranteeOnParts": 0,
      "guaranteeOnPartsBest": true,
      "guaranteeOnWork": 0,
      "guaranteeOnWorkBest": true,
      "qualityOfParts": "string",
      "qualityOfPartsBest": true,
      "bodySize": 0,
      "bodySizeBest": true,
      "courtesyCar": 0,
      "courtesyCarBest": true,
      "availableOn": "string",
      "availableOnBest": true,
      "won": true,
      "lineItems": [
        {
          "id": 0,
          "articleNumber": "string",
          "category": "string",
          "createdAt": "string",
          "description": "string",
          "manufacturer": "string",
          "partnerData": {},
          "type": "string",
          "unit": "string",
          "customerPrice": 0,
          "discountPercent": 0,
          "grossPrice": 0,
          "netPrice": 0,
          "quantity": 0,
          "discountedCustomerPrice": 0,
          "discountedCustomerPriceWithVat": 0,
          "subtotal": 0,
          "subtotalWithVat": 0
        }
      ]
    }
  ]
}
```

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/jobs/{jobId}/offer/compare`

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | ---------------------------------------------
jobId         | null    | yes       | The id of the job

### Response JSON

Attribute    | Type    | Can be blank? | Description
------------ | ------- | ------------- | ------------------------------------------------------
success      | boolean | no            | Offer comparison response

### Potential Errors

Error Code | Meaning
---------- | ----------------------------------------------------------------------------------
401        | Invalid or missing Authentication header
404        | Job not found or no accepted offer for job
