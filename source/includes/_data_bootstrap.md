# Bootstrap data

## Get static data from API

> To get static data for:
  * Existing makes
  * Job task types
  * Email digest options
  * Chains
  * Affiliations
  * Pricing details

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
  "affiliations": [],
  "jobTaskTypes": [],
  "makes": [],
  "user": {
    "countryId": 3,
    "countryCode": "dk",
    "locale": "da",
    "name": "Pauls Workshop",
    "requireAutomaticPayment": false,
    "vatFactor": 0.2,
    "isSuperbidder": true,
    "subMechanics": [{
      "id": 1,
      "name": "Pauls Workshop Amager",
      "zip": 2300,
      "city": "Copenhagen S"
    }]
  }
  "pricingDetails": {},
}
```

This endpoint provides lists of:

  * Existing makes
  * Job task types
  * Chains
  * Affiliations

Also provides information for:

  * Email digest options
  * Pricing details

In the future, it will also include all the static data needed to built on top of the API. This is the data the user will not be able to modify while using an application that requires information from the API.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/data-bootstrap`

### Response JSON

Attribute                        | Type          | Can be blank? | Description
-------------------------------- | ------------- | ------------- | -----------------------------------------------------------
digestOptions                       | object        | no            | A list of option for populating the digest email options
chains                              | array(object) | yes           | A list of objects representing chains for mechanics country
chains.chain.id                     | integer       | no            | The id of the chain
chains.chain.name                   | string        | yes           | The name of the chain
chains.chain.rust                   | boolean       | no            | If the chain is an underseal provider
chains.chain.logoUrl                | string        | yes           | The url to the chains logo
affiliations                        | array(object) | yes           | A list of objects representing affiliations for mechanics country
affiliations.affiliation.id         | integer       | no            | The id of the affiliation
affiliations.affiliation.name       | string        | yes           | The name of the affiliation
affiliations.affiliation.logoUrl    | string        | yes           | The url to the affiliation logo
jobTaskTypes                        | array(object) | yes           | A list of objects representing job task types, available for bidding
jobTaskTypes.id                     | integer       | no            | The id of the job task type
jobTaskTypes.name                   | string        | no            | The name of the job task type (used as an identifier)
jobTaskTypes.value                  | string        | no            | Human readable name of job task type
makes                               | array(object) | yes           | A list of objects representing makes, available for bidding
makes.id                            | integer       | no            | The id of the make
makes.name                          | string        | no            | The name of the make (human readable)
user                                | object        | no            | An object representing the details of the current workshop
user.countryId                      | integer       | no            | The id of the country to which the workshop belongs
user.countryCode                    | string        | no            | The code of the country to which the workshop belongs
user.locale                         | string        | no            | The locale of the country to which the workshop belongs
user.name                           | string        | no            | The name of the workshop
user.requireAutomaticPayment        | boolean       | no            | Whether or not the workshop is required to have a payment method set up
user.vatFactor                      | float         | no            | The default VAT factor of the workshop
user.isSuperbidder                  | boolean       | no            | Whether or not the workshop is a superbidder
user.subMechanics                   | array(object) | yes           | A list of submechanics in case current user is a superbidder
user.subMechanics.id                | integer       | no            | The id of a specific submechanic
user.subMechanics.name              | string        | no            | The name of a specific submechanic
user.subMechanics.zip               | string        | no            | ZIP code of the area where specific submechanic is located
user.subMechanics.city              | string        | no            | Name of the city where specific submechanic is located
pricingDetails                      | array(object) | yes           | A list of pricing details from the config file
pricingDetails.vat_factor           | integer       | no            | The vat percentage for the country the user is in.
pricingDetails.service_fee          | string        | no            | The value charged for using autobutler
pricingDetails.service_fee_treshold | string        | no            | The minimum price for an offer to be charged the service fee
pricingDetails.minimum_offer_price  | object        | no            | The minimum price for an offer to be able to be sent
pricingDetails.overdue_fee          | float         | no            | The fee charged for jobs with overdue completion

### Potential Errors

Error Code | Meaning
---------- | ---------------------------------------
401        | User not authorized.
