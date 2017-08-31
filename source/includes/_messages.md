# Messages

## Get the most recent message for a Mechanic

> To obtain the most recent message for a Mechanic, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/messages/most_recent" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/messages/most_recent",
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
  "message": {
    "id": 365,
    "title": "Message Title",
    "body": "Message Body",
    "createdAt": "2017-08-28T17:18:34.009+02:00"
  }
}
```

This endpoint returns the most recent message for a Mechanic

### HTTP Request

`https://www.autobutler.dk/api/v2/mechanics/messages/most_recent`

### Response JSON

Attribute | Type    | Can be blank? | Description
--------- | ------- | ------------- | --------------------------------------------------------
id        | integer | no            | The id of the message
title     | string  | yes           | The title of the message
body      | string  | yes           | The body of the message
createdAt | string  | no            | The date of creation of the message


## Mark message as viewed by a Mechanic

> To mark message as viewed by a Mechanic, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/messages/1/view" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"chainId\":1,\"name\":\"Rasmus\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/messages/1/view",
    type: "POST",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json"
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

> The above command returns JSON structured like this when the message was marked as viewed successfully:

```json
{
  "success": true
}
```

This endpoint marks message as viewed by a Mechanic.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/messages/1/view`

### Potential Errors

Error Code | Meaning
---------- | -----------------------------------------------------------------------------------------
404        | The message was not found in the system
