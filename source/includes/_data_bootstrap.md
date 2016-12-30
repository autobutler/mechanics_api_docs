# Bootstrap data

## Get static data from API

> To get static data for existing makes and job task types, use this code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/data-bootstrap" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "http://dev.autobutler.dk:3000/api/v2/mechanics/data-bootstrap",
  type: "GET",
  headers: {
    "Content-Type": "application/json; charset=utf-8",
  },
  contentType: "application/json",
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
  "digestOptions": {},
  "chains": [],
  "jobTaskTypes": [],
  "makes": []
}
```

This endpoint provides static data used to bootstrap the consumer of the API, meaning data, that the user will not be able to modify, while using an application.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/data-bootstrap`

### Response JSON

Attribute                                    | Type          | Can be blank? | Description
-------------------------------------------- | ------------- | ------------- | --------------------------------------------------------
digestOptions                                | object        | no            | A list of option for populating the digest email options
chains                                       | array(object) | yes           | A list of objects representing chains for mechanics country
chains.chain.id                              | integer       | no            | The id of the chain
chains.chain.name                            | string        | yes           | The name of the chain
chains.chain.rust                            | boolean       | no            | If the chain is an underseal provider
chains.chain.logoUrl                         | string        | yes           | The url to the chains logo
jobTaskTypes                                 | array(object) | yes           | A list of objects representing job task types, available for bidding
jobTaskTypes.id                              | integer       | no            | The id of the job task type
jobTaskTypes.name                            | string        | no            | The name of the job task type (used as an identifier)
jobTaskTypes.value                           | string        | no            | Human readable name of job task type
makes                                        | array(object) | yes           | A list of objects representing makes, available for bidding
makes.id                                     | integer       | no            | The id of the make
makes.name                                   | string        | no            | The name of the make (human readable)

### Potential Errors

Error Code | Meaning
---------- | ---------------------------------------
401        | User not authorized.
