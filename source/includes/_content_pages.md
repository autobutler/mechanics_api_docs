# Content Pages

## Get a list of Content Pages

> To obtain a list of Content Pages, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/content_pages" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/content_pages",
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
  "contentPages": [
    {
      "id": 2626,
      "title": "Foo Bar"
    },
    {
      "id": 2627,
      "title": "Wubba Lubba"
    }
  ]
}
```

This endpoint returns a list of all Content Pages available for
the workshop ordered by their title.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/content_pages`

### Response JSON

Attribute | Type    | Can be blank? | Description
--------- | ------- | ------------- | --------------------------------------------------------
id        | integer | no            | The id of the Content Page
title     | string  | no            | The title of the Content Page

## Get Content Page details

> To obtain the details of a Content Page, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/content_pages/2626" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/content_pages/2626",
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
  "id": 2626,
  "text": "Lorem Ipsum... blah blah blah...",
  "title": "Foo Bar"
}
```

This endpoint returns the details of the Content Page matching the specified id
which belongs to the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/content_pages/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Content Page

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------
id         | integer | no            | The id of the Content Page
text       | string  | no            | The body text of the Content Page
title      | string  | no            | The title of the Content Page

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
404        | The Content Page with the specified id could not be found or does not belong to the workshop

## Create new Content Page

> To create a new Content Page, use the following code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/content_pages" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"title\":\"Wubba Lubba\",\"text\":\"dub dub\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/content_pages",
    type: "POST",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "title": "Wubba Lubba",
        "text": "dub dub"
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

> The above command returns JSON structured like this when the Content Page was created successfully:

```json
{
  "id": 2628,
  "success": true
}
```

> The above command returns JSON structured like this when the Content Page could not be created:

```json
{
  "errors": {
    "text": [
      "must be filled out"
    ],
    "title": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint creates a new Content Page for the workshop.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/content_pages`

### Request JSON

Attribute | Type   | Required? | Description
--------- | ------ | --------- | ---------------------------------
text      | string | yes       | The body text of the Content Page
title     | string | yes       | The title of the Content Page

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the Content Page from being created
id         | integer | yes           | The id of the newly created Content Page
success    | boolean | no            | Weather or not the Content Page could be created

### Potential Errors

Error Code | Meaning
---------- | -----------------------------------------------------------------------------------------
400        | The Content Page could not be created. See the `errors`-value in the response for details

## Update existing Content Page

> To update an existing Content Page, use the following code:

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/content_pages/2628" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"title\":\"Foo Bar\",\"text\":\"My wonderful text\"}"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/content_pages/2628",
    type: "PATCH",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "title": "Foo Bar",
        "text": "My wonderful text"
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

> The above command returns JSON structured like this when the Content Page was updated successfully:

```json
{
  "success": true
}
```

> The above command returns JSON structured like this when the Content Page could not be updated:

```json
{
  "errors": {
    "text": [
      "must be filled out"
    ],
    "title": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint updates an existing Content Page that belongs to the workshop.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/content_pages/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Content Page

### Request JSON

Attribute | Type   | Required? | Description
--------- | ------ | --------- | ---------------------------------
text      | string | yes       | The body text of the Content Page
title     | string | yes       | The title of the Content Page

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ---------------------------------------------------------
errors     | array   | yes           | Errors that prevented the Content Page from being updated
success    | boolean | no            | Weather or not the Content Page could be updated

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
400        | The Content Page could not be updated. See the `errors`-value in the response for details
404        | The Content Page with the specified id could not be found or does not belong to the workshop

## Delete a Content Page

> To delete a Content Page, use the following code:

```shell
curl -X "DELETE" "https://www.autobutler.dk/api/v2/mechanics/content_pages/2626" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/content_pages/2626",
    type: "DELETE",
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

> The above command returns JSON structured like this when the Content Page was successfully deleted:

```json
{
  "success": true
}
```

> The above command returns JSON structured like this when the Content Page could not be deleted:

```json
{
  "success": false
}
```

This endpoint deletes the specified Content Page that belongs to the workshop

### HTTP Request

`DELETE https://www.autobutler.dk/api/v2/mechanics/content_pages/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
id        | nil     | yes       | The id of the Content Page

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | ------------------------------------------------
success    | boolean | no            | Weather or not the Content Page could be deleted

### Potential Errors

Error Code | Meaning
---------- | --------------------------------------------------------------------------------------------
404        | The Content Page with the specified id could not be found or does not belong to the workshop
