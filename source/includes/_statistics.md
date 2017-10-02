# Statistics

## Get mechanic statistics

> To get the statistics for a mechanic, use this code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/statistics?statisticName=jobOffersSent&startTime=2017-10-03T00:00:00+02:00&endTime=2017-10-10T00:00:00+02:00&jobOwner=autobutler&interval=2" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/statistics?statisticName=jobOffersSent&startTime=2017-10-03T00:00:00+02:00&endTime=2017-10-10T00:00:00+02:00&jobOwner=autobutler&interval=2",
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
  "data":[
    {"dateTime":"2017-08-20T00:00:00.000+00:00","value":0},
    {"dateTime":"2017-08-21T00:00:00.000+00:00","value":0},
    {"dateTime":"2017-08-22T00:00:00.000+00:00","value":0},
    ...
    {"dateTime":"2017-09-15T00:00:00.000+00:00","value":1}
    ...
    {"dateTime":"2017-09-19T00:00:00.000+00:00","value":0}
  ],
  "dataOverall":1
}
```

This endpoint returns a data series for a particular statistic specified by the `statisticName` which can be `jobOffersSentt` or `jobsCompleted`.

An array of data points grouped by the interval in days are returned as well as an overall value representing the same statistic for the whole data series.

### URL Parameters

Parameter      | Default | Required? | Description
-------------- | ------- | --------- | -----------------------------------------------------------------------------------------------------------------------------------
statisticName  | null    | yes       | The name of the statistic to be shown `jobOffersSentt` or `jobsCompleted`
interval       | 1       | no        | The number of days each data point represents
startTime      | mechanics first accepted subscription date    | no        | filter jobs by start time
endTime        | the current time    | no        | filter jobs by end time
jobOwner       | null    | no        | Filter jobs by owner `mechanic` or `autobutler`
