# Offers

## Get a list of sent offers

> To obtain a list of sent offers, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/offers" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/offers",
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
  "offers": [
    {
      "job": {},
      "offer": {}
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

This endpoint returns a list of offers that have been sent by the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/offers`

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | -----------------------------------------------------------------------------------------------------------------------------------
page          | 1       | no        | The page of the result to return
makeId        | null    | no        | Only show offers for jobs where the car is of the given make
jobTaskTypeId | null    | no        | Only show offers for jobs that contain at least one job task of the given type
search        | null    | no        | Only show offers for jobs where the reference number, registration number, car make, car model or job name matches the given string

### Response JSON

Attribute    | Type    | Can be blank? | Description
------------ | ------- | ------------- | ----------------------------------------------------------
offers       | array   | no            | A list of offers along with their job.
offers.job   | object  | no            | A <a href="#joboverview">jobOverview</a> object
offers.offer | object  | no            | A <a href="#offerdetails">offerDetails</a> object
pagination   | object  | no            | A <a href="#pagination">pagination</a> object
filter       | object  | no            | A <a href="#jobfilter">jobFilter</a> object

## Mark an offer as won

> To manually mark an offer as won, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/mark_as_won" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/mark_as_won",
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
  "success": true
}
```

This endpoint marks an offer as won. You should only use this endpoint in case
the car owner actually accepted your offer but did so by calling you on the
phone.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/jobs/{jobId}/offer/mark_as_won`

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | ---------------------------------------------
jobId         | null    | yes       | The id of the job of the offer to mark as won

### Response JSON

Attribute    | Type    | Can be blank? | Description
------------ | ------- | ------------- | ------------------------------------------------------
success      | boolean | no            | Wether or not the offer was successfully marked as won

### Potential Errors

Error Code | Meaning
---------- | ----------------------------------------------------------------------------------
400        | The offer could not be marked as won. Maybe a competing offer was already accepted
404        | There doesn't exist an offer for the givet job by the workshop

## PATCH Complete

> Complete a job for which the offer from the mechanic is the accepted one

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/complete" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"carPickupAt\":\"2017-08-30\", \"completionNote\":\"Some note...\", \"courtesyCar\": true, \"includeServiceFee\": true,
          \"jobWillbeCompletedOn\":\"2017-08-30\", \"offerLineItems\": [{}], \"priceOfCourtesyCar\": 0, \"pricing\": \"LINE_ITEMS\"
         }"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/complete",
  type: "PATCH",
  headers: {
    "Authorization": "token",
    "Content-Type": "application/json; charset=utf-8",
  },
  contentType: "application/json",
  data: JSON.stringify({
    "carPickupAt": "2017-08-30",
    "completionNote": "Some note...",
    "courtesyCar": true,
    "includeServiceFee": true,
    "jobWillbeCompletedOn": "2017-08-30",
    "offerLineItems": [
      {}
    ],
    "priceOfCourtesyCar": 0,
    "pricing": "LINE_ITEMS"
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

Complete a job for which the offer from the mechanic is the accepted one.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/jobs/{jobId}/offer/complete`

### Request JSON

Attribute            | Type          | Required? | Description
---------------------| --------------| ----------|--------------
carPickupAt          | string        | true      | The date when the car is ready to be picked up by the car owner.
completionNote       | string        | true      | A note the mechanic can make when completing the offer.
courtesyCar          | boolean       | true      | Whether the car owner had a courtesy car.
includeServiceFee    | boolean       | true      | Whether the service fee should be included.
jobWillbeCompletedOn | string        | true      | The date when the car is handed in to the mechanic.
offerLineItems       | array(object) | true      | An array containing the offer line items.
priceOfCourtesyCar   | decimal       | false     | Price of the courtesy car.
pricing              | string        | true      | Possible values are:<br>`"LINE_ITEMS"`: This offer contains order lines with individual prices<br>`"FIXED"`: This offer contains order lines but a single fixed price<br>`"HOURLY"`: This offer has no order lines but instead consists of an hourly rate and a fixed price for spare parts

## Marks the car owner as unreachable for an accepted offer

> To manually marks the car owner as unreachable for an accepted offer, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/unreachable_car_owner" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs/12345/offer/unreachable_car_owner",
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
  "success": true
}
```

This endpoint marks a car owner as unreachable (mechanic couldn't contact him) for an accepted offer.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/jobs/{jobId}/offer/unreachable_car_owner`

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | ---------------------------------------------
jobId         | null    | yes       | The id of the job of the offer to mark as won

### Request JSON

Attribute            | Type          | Required? | Description
---------------------| --------------| ----------|--------------
unreachableCarOwner  | boolean       | true      | Whether the car owner is unreachable or not for the accepted offer

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the booking from being updated
success    | boolean | no            | Wether or not the car owner was succesfully marked as unreachable for the accepted offer

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
401        | Invalid or missing Authorization header
404        | Job not found, not accepted or not won by the mechanic
