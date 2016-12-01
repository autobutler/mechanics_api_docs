# Tokens

## Create a new API token

> To obtain an API token, use this code:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/tokens" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"email\":\"workshop@email.dk\",\"password\":\"qwerty\"}"
```

```javascript
jQuery.ajax({
  url: "http://dev.autobutler.dk:3000/api/v2/mechanics/tokens",
  type: "POST",
  headers: {
    "Content-Type": "application/json; charset=utf-8",
  },
  contentType: "application/json",
  data: JSON.stringify({
    "email": "workshop@email.dk",
    "password": "qwerty"
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
  "status": "ok",
  "token": "eyJ0fXAiOiJRL1QiLCJhbGcoOiJIUzI1NiJ9.abJ1c2VyX2lkIjoyODE5NTAsInV4cCI6MTQ3NTMxMDMxM30.U0l2r96BQ0Wj9vgRIu-y2ue8MW3O86wUtpDSMx2NI4w",
  "refreshToken": "be04ef6368e721104ej7fb582356b232364b9d8a59aa6401905cc9b700e79c7a0",
  "user": {
    "name": "Workshop Name",
    "countryId": 1,
    "locale": "da",
    "vatFactor": 0.25,
    "requireAutomaticPayment": true
  }
}
```

This endpoint provides an API token for the the specified workshop login
credentials.

Please note that the provided token is short lived and will have to be renewed
by performing a new request to the token endpoint when it expires.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/tokens`

### Query Parameters

Parameter | Type   | Default | Required | Description
--------- | ------ | ------- | -------- | ----------------------------------
email     | string | `null`  | yes      | The e-mail address of the workshop
password  | string | `null`  | yes      | The password of the workshop

### Response JSON

Attribute                    | Type    | Description
---------------------------- | ------- | ------------------------------------------------------------
status                       | string  | `ok` if the login credentials were valid. Otherwise `failed`
token                        | string  | The API token that should be used for other requests
refreshToken                 | string  | A token that can be used to obtain a fresh API token
user.name                    | string  | The name of the workshop
user.countryId               | integer | The Id of the country with which the workshop is associated
user.locale                  | string  | The locale that is configured for the workshop
user.vatFactor               | float   | The VAT factor that is configured for the workshop
user.requireAutomaticPayment | boolean | A boolean indicating weather or not the workshop must have automatic payment configured

### Potential Errors

Error Code | Meaning
---------- | ---------------------------------------
401        | The provided credentials were incorrect
