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
mechanicIntegrations.integrationDetails.features             | object        | no            | Lists all the different features that are supported by the integration
mechanicIntegrations.integrationDetails.name                 | string        | no            | The unique identifier for this integration
mechanicIntegrations.integrationDetails.optionFields         | array(string) | no            | A list of user-definable fields that are used for setting various options for the integration
mechanicIntegrations.configuration                           | object        | yes           | The configuration details for the workshop for this integration
mechanicIntegrations.configuration.credentials               | object        | no            | The authentication credentials stored for the mechanic. Please be aware that this object might contain values thare are not part of the `authenticationFields`-value of the `integrationDetails`.
mechanicIntegrations.configuration.id                        | integer       | no            | The id of this integration configuration
mechanicIntegrations.configuration.options                   | object        | no            | The options stored for the mechanic. Please be aware that this object might contain values thare are not part of the `optionFields`-value of the `integrationDetails`.
