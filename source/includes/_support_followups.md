# Support Followups

## Create a new record for support to follow up on the interest of a user.

> To create a new record, use this code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/support_followups" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/support_followups",
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

> The above command returns JSON structured like this:

```json
{
  "success": true
}
```

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/support_followups`

### URL Parameters

Parameter          | Default | Required? | Description
------------------ | ------- | --------- | ------------------------------------------
emailOrPhoneNumber | nil     | yes       | The email or phone number to follow up on
website            | nil     | yes       | The website that the user is interested in

### Response JSON

Attribute  | Type    | Can be blank? | Description
---------- | ------- | ------------- | -------------------------------------
success    | boolean | no            | true, if the operation was successful

### Potential Errors

Error Code | Meaning
---------- | ----------------------------------------------------------
404        | The Website was not found
