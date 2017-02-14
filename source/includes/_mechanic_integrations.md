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
