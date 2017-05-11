# Archive

## Get a list of completed jobs

> To obtain a list of completed jobs, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/archive/jobs" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/archive/jobs",
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
  "jobs": [
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


This endpoint returns a list of jobs won and completed by the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/archive/jobs`

### URL Parameters

Parameter     | Default | Required? | Description
------------- | ------- | --------- | -----------------------------------------------------------------------------------------------------------------------------------
page          | 1       | no        | The page of the result to return
makeId        | null    | no        | Only show jobs where the car is of the given make
jobTaskTypeId | null    | no        | Only show jobs that contain at least one job task of the given type
search        | null    | no        | Only show jobs where the reference number, registration number, car make, car model or job name matches the given string

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ----------------------------------------------------------
jobs       | array   | no            | A list of offers along with their job.
jobs.job   | object  | no            | A <a href="#joboverview">jobOverview</a> object
jobs.offer | object  | no            | A <a href="#offerdetails">offerDetails</a> object
pagination | object  | no            | A <a href="#pagination">pagination</a> object
filter     | object  | no            | A <a href="#jobfilter">jobFilter</a> object
