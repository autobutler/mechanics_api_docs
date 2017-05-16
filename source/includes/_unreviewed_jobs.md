# Unreviewed Jobs

## Get a list of jobs without a review

> To obtain a list of jobs, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/unreviewed_jobs" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/unreviewed_jobs",
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

`GET https://www.autobutler.dk/api/v2/mechanics/unreviewed_jobs`

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | -----------------------------------------------------------------------------------------------------------------------------
job        | object  | no            | A <a href="#jobdetails">jobDetails</a> object that contains the details of the job
offer      | object  | yes           | A <a href="#offerdetails">offerDetails</a> object that contains the details of the existing offer
