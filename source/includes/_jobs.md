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
  "jobs":[{"job":{...}],
  "pagination":{"currentPage":1,"totalPages":7,"totalEntries":132,"entriesPerPage":20}
}
```

This endpoint returns a list of jobs that are available for the workshop to bid
on. Aka Incoming Jobs

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/jobs`

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------  | ------- | ------------- | --------------------------------------------------------
jobs       | array   | no            | A list of <a href="#joboverview">jobOverview</a> objects
pagination | object  | no            | A <a href="#pagination">pagination</a> object

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | -----------------------------------------------------------------------------------------------------------------------------------
page          | 1       | no        | The page of the result to return
makeId        | null    | no        | Only show jobs where the car is of the given make
jobTaskTypeId | null    | no        | Only show jobs that contain at least one job task of the given type
jobRequestType| null    | no        | Only show jobs of the type filtered. Accept only parameters 'direct' or 'other'. Wrong parameter will return an unfiltered result

## Get a list of jobs without a review

> To obtain a list of jobs, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/jobs/unreviewed" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/jobs/unreviewed",
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

This endpoint returns a list of completed jobs without a review.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/jobs/unreviewed`

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | -----------------------------------------------------------------------------------------------------------------------------
job        | object  | no            | A <a href="#jobdetails">jobDetails</a> object that contains the details of the job
offer      | object  | yes           | A <a href="#offerdetails">offerDetails</a> object that contains the details of the existing offer

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | -----------------------------------------------------------------------------------------------------------------------------------
page          | 1       | no        | The page of the result to return
makeId        | null    | no        | Only show jobs where the car is of the given make
jobTaskTypeId | null    | no        | Only show jobs that contain at least one job task of the given type


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

## Update the booking dates of an accepted job won by the mechanic

> To update booking dates, use the following code:

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/jobs/{job_id}/booking" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"booking\":{\"job_will_be_completed_on\":\"string\",\"car_pickup_at\":\"string\",\"completion_time_of_day\":\"string\",\"pickup_time_of_day\":\"string\"}}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/jobs/{job_id}/booking",
    type: "PATCH",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
      "booking": {
        "job_will_be_completed_on": "string",
        "car_pickup_at": "string",
        "completion_time_of_day": "string",
        "pickup_time_of_day": "string"
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

> The above command returns JSON structured like this:

```json
{
  "success": true,
  "errors": [
    "string"
  ]
}
```

This endpoint updates the booking dates of an accepted job won by the mechanic.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/jobs/{job_id}/booking`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
job_id    | nil     | yes       | The id of the Job

### Request JSON

Attribute                        | Type   | Required? | Description
-------------------------------- | ------ | --------- | ---------------------------------
booking                          | object | yes       | Details of the booking
booking.job_will_be_completed_on | string | yes       | The date when the accepted job will be completed
booking.car_pickup_at            | string | yes       | The car pickup date for the accepted job
booking.completion_time_of_day.  | string | yes       | The completion time for the accepted job
booking.pickup_time_of_day.      | string | yes       | The car pickup time for the accepted job

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the booking from being updated
success    | boolean | no            | Weather or not the booking could be updated

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
401        | Invalid or missing Authorization header
404        | Job not found, not accepted or not won by the mechanic
