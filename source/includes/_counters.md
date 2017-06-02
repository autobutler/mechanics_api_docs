# Counters

## Get all necessary counters to show the dashboard correctly

> To obtain the counters, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/counters" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/counters",
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
  "newCampaignsCount": 0,
  "unreadConversationsCount": 0,
  "ongoingJobsCount": 0,
  "directIncomingJobsCount": 0
}
```

This endpoint returns all necessary counters to show the dashboard correctly.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/counters`

#### Request params
No request params necessary

### Response JSON

Attribute                  | Type          | Can be blank? | Description
---------------------------| ------------- | ------------- | ---------------------------------------------
newCampaignsCount          | integer       | no            | The number of new campaigns for the mechanic
unreadConversationsCount   | integer       | no            | The number of new messages for the mechanic
ongoingJobsCount           | integer       | no            | The number of ongoing jobs for the mechanic
directIncomingJobsCount    | integer       | no            | The number of incoming leads for the mechanic
