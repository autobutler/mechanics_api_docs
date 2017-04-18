# Conversations

## Get a list of conversations for current mechanic

> To obtain a list of conversations, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/conversations?page=1" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/conversations?page=1",
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
  "conversations": [
    {
      "jobReferenceNumber": "ab46099",
      "unread": false,
      "unanswered": false,
      "car": {
        "id": 43950,
        "registrationNumber": "YB57453",
        "make": "Renault",
        "model": "Laguna",
        "year": 2003,
        "name": "Renault Laguna"
      },
      "carOwner": {
        "id": 30910,
        "email": "henrikcasper@hotmail.co.uk",
        "name": "Henrik Casper"
      },
      "latestComment": {
        "id": 437496,
        "userId": 23107,
        "subjectId": 104205,
        "body": "cmdhrtuigrt",
        "createdAt": "2017-04-18T13:20:01.496+02:00",
        "viewedAt": null
      }
    }
  ],
  "page": 1,
  "totalPages": 256
}
```

This endpoint returns a list of conversations with customers for the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/conversations?page={page}`

### Response JSON

Attribute                                                   | Type          | Can be blank? | Description
----------------------------------------------------------- | ------------- | ------------- | -----------------------------------------------------------------------------
conversations                                               | array(object) | no            | An array of objects representing the individual conversations
conversations.jobReferenceNumber                            | string        | no            | The reference number of the job, related to a conversation
conversations.car                                           | object        | no            | An object representing the car, related to a conversation
conversations.car.id                                        | integer       | no            | The id of the car
conversations.car.registrationNumber                        | string        | no            | The registration number of the car
conversations.car.make                                      | string        | no            | The name of the car make
conversations.car.model                                     | string        | no            | The name of the car model
conversations.car.year                                      | integer       | no            | The year when the car was produced
conversations.car.name                                      | string        | no            | The name of the car (make and model)
conversations.carOwner                                      | object        | no            | An object that represents the owner of the car, related to a conversation
conversations.carOwner.id                                   | integer       | no            | The id of the car owner
conversations.carOwner.name                                 | string        | no            | The name of the car owner
conversations.carOwner.email                                | string        | no            | The email of the car owner
conversations.latestComment                                 | object        | no            | An object representing the owner of the latest comment from the conversation
conversations.latestComment.id                              | integer       | no            | The id of the comment
conversations.latestComment.userId                          | integer       | no            | The id of the user that made the latest comment
conversations.latestComment.subjectId                       | integer       | no            | The id of the subject of the latest comment (a job or an offer)
conversations.latestComment.body                            | string        | no            | The actual text of the latest comment
conversations.latestComment.createdAt                       | string        | no            | The latest comment creation date
conversations.latestComment.viewedAt                        | string        | yes           | The date of viewing of the latest comment
page                                                        | integer       | no            | Current page number
totalPages                                                  | integer       | no            | Total number of pages


## Get a number of unread conversations for current mechanic

> To obtain a number of unread conversations, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/conversations/unread_counter" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/conversations/unread_counter",
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
  "unreadConversationsCount": 454
}
```

This endpoint returns a number of unread conversations with customers for the workshop

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/conversations/counters`

### Response JSON

Attribute                                                   | Type          | Can be blank? | Description
----------------------------------------------------------- | ------------- | ------------- | ---------------------------------------------------------------------------
unreadConversationsCount                                    | integer       | no            | The number of conversations for current mechanic, that have unread messages
