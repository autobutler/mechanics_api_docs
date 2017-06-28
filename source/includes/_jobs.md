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
