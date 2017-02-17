# Mechanic Integrations

## Get a list of Mechanic Integrations

> To obtain a list of all available integrations:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations",
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
  "mechanicIntegrations": [
    {
      "integrationDetails": {
        "authenticationFields": [
          "username",
          "password"
        ],
        "authenticationType": "simple",
        "countries": [
          "dk"
        ],
        "features": {
          "supportsCustomerLookup": false,
          "supportsOpenJob": true
        },
        "name": "MechanicIntegrations::Au2officeIntegration",
        "optionFields": []
      }
    },
    {
      "configuration": {
        "credentials": {
          "password": "bar",
          "username": "foo"
        },
        "id": 3,
        "options": {}
      },
      "integrationDetails": {
        "authenticationFields": [
          "username",
          "password"
        ],
        "authenticationType": "simple",
        "countries": [
          "dk",
          "se"
        ],
        "features": {
          "supportsCustomerLookup": true,
          "supportsOpenJob": true
        },
        "name": "MechanicIntegrations::CrmpIntegration",
        "optionFields": []
      }
    },
    {
      "integrationDetails": {
        "authenticationFields": [
          "username",
          "token"
        ],
        "authenticationType": "simple",
        "countries": [
          "dk"
        ],
        "features": {
          "supportsCustomerLookup": false,
          "supportsOpenJob": true
        },
        "name": "MechanicIntegrations::TWMIntegration",
        "optionFields": []
      }
    }
  ]
}
```

This endpoint returns a list of all integrations that are available to the mechanic.
The response also contains configuration details for all integrations that are configured
and active for the mechanic.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations`

### Response JSON

Attribute                                                    | Type          | Can be blank? | Description
------------------------------------------------------------ | ------------- | ------------- | ----------------------------------------------------------------
mechanicIntegrations                                         | array(object) | no            | The list of integrations
mechanicIntegrations.integrationDetails                      | object        | no            | The details of this type of integration
mechanicIntegrations.integrationDetails.authenticationFields | array(string) | no            | A list of user-definable fields that are used for authentication
mechanicIntegrations.integrationDetails.authenticationType   | string        | no            | The authentication scheme used by this integration:<br>`"simple"`: This integration uses simple username/password/token authentication<br>`"oauth2"`: This integration uses OAuth2 authentication
mechanicIntegrations.integrationDetails.countries            | array(string) | no            | A list of country codes of countries in which the integration is available
mechanicIntegrations.integrationDetails.features             | object        | no            | Lists all the different features that are supported by the integration
mechanicIntegrations.integrationDetails.name                 | string        | no            | The unique identifier for this integration
mechanicIntegrations.integrationDetails.optionFields         | array(string) | no            | A list of user-definable fields that are used for setting various options for the integration
mechanicIntegrations.configuration                           | object        | yes           | The configuration details for the workshop for this integration
mechanicIntegrations.configuration.credentials               | object        | no            | The authentication credentials stored for the mechanic. Please be aware that this object might contain values thare are not part of the `authenticationFields`-value of the `integrationDetails`.
mechanicIntegrations.configuration.id                        | integer       | no            | The id of this integration configuration
mechanicIntegrations.configuration.options                   | object        | no            | The options stored for the mechanic. Please be aware that this object might contain values thare are not part of the `optionFields`-value of the `integrationDetails`.

## Activate/Change an integration

> To activate a new integration or update an already activate integration:

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::TWMIntegration" \
     -H "Authorization: token" \
     -d $'{"token": "bar", "username": "foo"}'
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::TWMIntegration",
    type: "PATCH",
    headers: {
        "Authorization": "token",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "token": "bar",
        "username": "foo"
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

> The above command returns JSON structured like this when the response was successful:

```json
{
  "configuration": {
    "credentials": {
      "token": "bar",
      "username": "foo"
    },
    "id": 4,
    "options": {}
  },
  "integrationDetails": {
    "authenticationFields": [
      "username",
      "token"
    ],
    "authenticationType": "simple",
    "features": {
      "supportsCustomerLookup": false,
      "supportsOpenJob": true
    },
    "name": "MechanicIntegrations::TWMIntegration",
    "optionFields": []
  },
  "success": true
}
```

> The above command returns JSON structured like this when the response was unsuccessful:

```json
{
  "errors": {
    "username": [
      "must be filled out"
    ]
  },
  "success": false
}
```

This endpoint allows the activation of a new available integration for the workshop
or the update of an already activated integration

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/{name}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
name      | nil     | yes       | The name of the integration to activate/update

### Request JSON

The paramters that are required and avaiable varies for each different integration. See the `authenticationFields` and `optionFields` <a href="#get-a-list-of-mechanic-integrations">here</a>.

### Response JSON

Please note that the response also includes `configuration` and `integrationDetails`. These are the same as in <a href="#get-a-list-of-mechanic-integrations">Get a list of Mechanic Integrations</a>

Attribute | Type          | Can be blank? | Description
--------- | ------------- | ------------- | -----------
success   | boolean       | no            | Weather or not the integration was successfully activated/updated
errors    | object        | yes           | The errors that prevented the integration from being activated/updated

## Deactivate an integration

> To deactivate an integration:

```shell
curl -X "DELETE" "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::TWMIntegration" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::TWMIntegration",
    type: "DELETE",
    headers: {
        "Authorization": "token",
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

This endpoint allows the deactivation of an integration for the workshop.

### HTTP Request

`DELETE https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/{name}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
name      | nil     | yes       | The name of the integration to deactivate

### Response JSON

Attribute | Type          | Can be blank? | Description
--------- | ------------- | ------------- | -----------
success   | boolean       | no            | Weather or not the integration was successfully deactivated

## Get a URL for opening a job in an integration

> To obtain a url for opening a job in an integration:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::CrmpIntegration/job_urls/565973" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::CrmpIntegration/job_urls/565973",
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
  "url": "http://APP.crmp.com/Login.aspx?Un=admin|1233213&PS=12345123&aup=123123123|352253"
}
```

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/{name}/job_urls/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
name      | nil     | yes       | The name of the integration to use
id        | nil     | yes       | The id of the job to get an URL for

### Response JSON

Attribute | Type          | Can be blank? | Description
--------- | ------------- | ------------- | -----------
url       | string        | no            | The URL for opening the job in the integration

### Potential Errors

Error Code | Meaning
---------- | -------------------------------------------------------
400        | The specified integration does not support opening jobs

## Get a URL for opening a car in an integration

> To obtain a url for opening a car in an integration:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::AutofrontalIntegration/car_urls/407340" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::AutofrontalIntegration/car_urls/407340",
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
  "url": "autofrontal:/REG=AD61451"
}
```

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/{name}/car_urls/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | --------------------------
name      | nil     | yes       | The name of the integration to use
id        | nil     | yes       | The id of the car to get an URL for

### Response JSON

Attribute | Type          | Can be blank? | Description
--------- | ------------- | ------------- | -----------
url       | string        | no            | The URL for opening the car in the integration

### Potential Errors

Error Code | Meaning
---------- | -------------------------------------------------------
400        | The specified integration does not support opening cars

## Build an offer through an integration

> To build an offer through an integration:

```shell
curl -X "POST" "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::TWMIntegration/offers" \
     -H "Authorization: token"
     -H "Content-Type: application/json; charset=utf-8" \
     -d $'{"jobId": 565973, "remoteId": "10391678"}'
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/MechanicIntegrations::TWMIntegration/offers",
    type: "POST",
    headers: {
        "Authorization": "token",
        "Content-Type": "application/json; charset=utf-8",
    },
    contentType: "application/json",
    data: JSON.stringify({
        "jobId": 565973,
        "remoteId": "10391678"
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
  "offer": {
    "acceptanceText": null,
    "acceptedToCompleteAt": null,
    "availableOn": null,
    "body": null,
    "cancelComment": null,
    "cancelledAt": null,
    "carPickupAt": null,
    "completionNote": null,
    "completionTimeOfDay": null,
    "courtesyCar": false,
    "createdAt": null,
    "declinedAt": null,
    "draft": false,
    "expirationDate": null,
    "guaranteeOnParts": null,
    "guaranteeOnWork": null,
    "id": null,
    "jobWillBeCompletedOn": null,
    "lost": false,
    "marketPrice": null,
    "mechanicIntegrationData": {
      "MechanicIntegrations::TWMIntegration": {
        "raw_quotation": {
          "case_id": "10391678",
          "case_no": "99",
          "comments": null,
          "internal_comments": "Anhængertræk - Fastmonteret, 7-pole - Skal bruges til montering af cykelanhænger.\n",
          "make_and_model": null,
          "offer_length": null,
          "our_ref": null,
          "quotation_date": "2017-02-16T15:17:35.000+00:00",
          "quotation_lines": {
            "quotation_line": [
              {
                "case_id": "10391678",
                "discount_percent": "0",
                "product_category_no": "101",
                "product_no": "001",
                "product_text": "TEST 1",
                "quantity": "1",
                "quotation_line_id": "1",
                "sub_total": "100.0000",
                "sub_total_incl_vat": "125.0000",
                "unit": "Stk.",
                "unit_sales_price": "100.0000",
                "unit_sales_price_incl_vat": "125.0000",
                "user_id": "21505"
              },
              {
                "case_id": "10391678",
                "discount_percent": "0",
                "product_category_no": "101",
                "product_no": "002",
                "product_text": "TEST 2",
                "quantity": "2",
                "quotation_line_id": "2",
                "sub_total": "400.0000",
                "sub_total_incl_vat": "500.0000",
                "unit": "Stk.",
                "unit_sales_price": "200.0000",
                "unit_sales_price_incl_vat": "250.0000",
                "user_id": "21505"
              },
              {
                "case_id": "10391678",
                "discount_percent": "0",
                "product_category_no": "101",
                "product_no": "003",
                "product_text": "TEST 3",
                "quantity": "3",
                "quotation_line_id": "3",
                "sub_total": "900.0000",
                "sub_total_incl_vat": "1125.0000",
                "unit": "Timer",
                "unit_sales_price": "300.0000",
                "unit_sales_price_incl_vat": "375.0000",
                "user_id": "21505"
              }
            ]
          },
          "user_id": "21505",
          "your_ref": null
        },
        "remote_id": "10391678"
      }
    },
    "pickupTimeOfDay": null,
    "priceDetails": {
      "lineItems": [
        {
          "articleNumber": "001",
          "category": null,
          "createdAt": null,
          "customerPrice": 100.0,
          "description": "TEST 1",
          "discountPercent": 0.0,
          "discountedCustomerPrice": 100.0,
          "discountedCustomerPriceWithVat": 125.0,
          "grossPrice": 100.0,
          "id": null,
          "manufacturer": null,
          "mechanicIntegrationData": {
            "MechanicIntegrations::TWMIntegration": {
              "case_id": "10391678",
              "discount_percent": "0",
              "product_category_no": "101",
              "product_no": "001",
              "product_text": "TEST 1",
              "quantity": "1",
              "quotation_line_id": "1",
              "sub_total": "100.0000",
              "sub_total_incl_vat": "125.0000",
              "unit": "Stk.",
              "unit_sales_price": "100.0000",
              "unit_sales_price_incl_vat": "125.0000",
              "user_id": "21505"
            }
          },
          "netPrice": 100.0,
          "partnerData": {},
          "quantity": 1.0,
          "subtotal": 100.0,
          "subtotalWithVat": 125.0,
          "type": "",
          "unit": "pcs"
        },
        {
          "articleNumber": "002",
          "category": null,
          "createdAt": null,
          "customerPrice": 200.0,
          "description": "TEST 2",
          "discountPercent": 0.0,
          "discountedCustomerPrice": 200.0,
          "discountedCustomerPriceWithVat": 250.0,
          "grossPrice": 200.0,
          "id": null,
          "manufacturer": null,
          "mechanicIntegrationData": {
            "MechanicIntegrations::TWMIntegration": {
              "case_id": "10391678",
              "discount_percent": "0",
              "product_category_no": "101",
              "product_no": "002",
              "product_text": "TEST 2",
              "quantity": "2",
              "quotation_line_id": "2",
              "sub_total": "400.0000",
              "sub_total_incl_vat": "500.0000",
              "unit": "Stk.",
              "unit_sales_price": "200.0000",
              "unit_sales_price_incl_vat": "250.0000",
              "user_id": "21505"
            }
          },
          "netPrice": 200.0,
          "partnerData": {},
          "quantity": 2.0,
          "subtotal": 400.0,
          "subtotalWithVat": 500.0,
          "type": "",
          "unit": "pcs"
        },
        {
          "articleNumber": "003",
          "category": null,
          "createdAt": null,
          "customerPrice": 300.0,
          "description": "TEST 3",
          "discountPercent": 0.0,
          "discountedCustomerPrice": 300.0,
          "discountedCustomerPriceWithVat": 375.0,
          "grossPrice": 300.0,
          "id": null,
          "manufacturer": null,
          "mechanicIntegrationData": {
            "MechanicIntegrations::TWMIntegration": {
              "case_id": "10391678",
              "discount_percent": "0",
              "product_category_no": "101",
              "product_no": "003",
              "product_text": "TEST 3",
              "quantity": "3",
              "quotation_line_id": "3",
              "sub_total": "900.0000",
              "sub_total_incl_vat": "1125.0000",
              "unit": "Timer",
              "unit_sales_price": "300.0000",
              "unit_sales_price_incl_vat": "375.0000",
              "user_id": "21505"
            }
          },
          "netPrice": 300.0,
          "partnerData": {},
          "quantity": 3.0,
          "subtotal": 900.0,
          "subtotalWithVat": 1125.0,
          "type": "",
          "unit": "hours"
        }
      ],
      "pricing": "LINE_ITEMS",
      "subtotal": 1431.2,
      "totalNumberOfHours": 3.0,
      "totalPrice": 1789.0,
      "totalsExcludingVat": {
        "priceOfCourtesyCar": 0.0,
        "priceOfParts": 500.0,
        "priceOfWork": 900.0,
        "priceOfWorkPerHour": 300.0,
        "serviceFee": 31.2
      },
      "totalsIncludingVat": {
        "priceOfCourtesyCar": 0.0,
        "priceOfParts": 625.0,
        "priceOfWork": 1125.0,
        "priceOfWorkPerHour": 375.0,
        "serviceFee": 39.0
      },
      "vat": 357.8,
      "vatFactor": 0.25
    },
    "qualityOfParts": null,
    "rejectedExplanation": null,
    "rejectedReason": null
  },
  "success": true
}
```

This endpoint allows you to build an offer from the details stored
in the remote integration system.

### HTTP Request

`POST https://www.autobutler.dk/api/v2/mechanics/mechanic_integrations/{name}/offers`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | ----------------------------------
name      | nil     | yes       | The name of the integration to use

### Request JSON

Attribute | Type    | Required? | Description
--------- | ------- | --------- | -----------------------------------------------
jobId     | integer | yes       | The id of the job to build an offer for
remoteId  | string  | yes       | The id of the remote offer from the integration

### Potential Errors

Error Code | Meaning
---------- | ----------------------------------------------------------
400        | The specified integration does not support building offers
