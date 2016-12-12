# Settings

## Get mechanic settings

> To get the settings for the workshop, use this code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/settings" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/settings",
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
  "allowMail": true,
  "bidSettings": {
    "auto": {
      "active": true,
      "guaranteeOnParts": 24,
      "guaranteeOnWork": 24,
      "hourlyRate": 479.0,
      "nextFreeTimeDaysForward": 3,
      "numberOfDaysValid": 30,
      "priceOfCourtesyCar": 179.0,
      "productDiscountPercent": 4.5,
      "qualityOfParts": "OEM",
      "timeDiscountPercent": 4.5
    },
    "courtesyCar": true,
    "manual": {
      "guaranteeOnParts": 48,
      "guaranteeOnWork": 48,
      "hourlyRate": 499.0,
      "numberOfDaysValid": 30,
      "priceOfCourtesyCar": 199.0,
      "productDiscountPercent": 5.0,
      "qualityOfParts": "ORIGINAL",
      "timeDiscountPercent": 5.0
    }
  },
  "digestMode": "DAILY",
  "excludedJobTaskTypes": [
    {
      "id": 56,
      "name": "brakes"
    }
  ],
  "excludedMakes": [
    {
      "id": 39,
      "name": "Oldsmobile"
    }
  ],
  "mecaDisabled": false,
  "mecaPassword": "my_password",
  "mecaUsername": "MyUsername",
  "mecaViaCrm": false,
  "mechanicOwnedFlowBookTimeUrl": "https://mechanicbooking.dk/dippels-testvaerksted/book",
  "mechanicOwnedFlowEnabled": true,
  "mechanicOwnedFlowTermsUrl": "http://dev.autobutler.dk:3000/dashboard/workshop_crm_terms",
  "mechanicOwnedFlowUrl": "https://mechanicbooking.dk/dippels-testvaerksted",
  "tolerancePassword": "my_password",
  "toleranceTWMName": "Tolerance TWM",
  "toleranceUsername": "MyUsername",
  "usingAutofrontal": false,
  "wantsGeneratorSms": true,
  "wantsSms": true,
  "wantsZeroJobsDigest": true
}
```

This endpoint returns settings for the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/settings`

### Response JSON

Attribute                                  | Type          | Can be blank? | Description
---------                                  | -------       | ------------- | --------------------------------------------------------
allowMail                                  | boolean       | no            | Weather or not we are allowed to send newsletters
bidSettings                                | object        | no            | An object representing the different bid settings
bidSettings.auto                           | object        | no            | An object representing the automatic bid settings
bidSettings.auto.active                    | boolean       | no            | Weather or not automatic bidding is enabled
bidSettings.auto.guaranteeOnParts          | integer       | yes           | The default warranty on spare parts in months for automatic bids
bidSettings.auto.guaranteeOnWork           | integer       | yes           | The default warranty on work in months for automatic bids
bidSettings.auto.hourlyRate                | float         | yes           | The default hourly rate for automatic bids
bidSettings.auto.nextFreeTimeDaysForward   | integer       | yes           | The default number of days until the next available time for automatic bids
bidSettings.auto.numberOfDaysValid         | integer       | yes           | The default number of days an automatic bid is valid
bidSettings.auto.priceOfCourtesyCar        | float         | yes           | The default price of courtesy car for automatic bids
bidSettings.auto.productDiscountPercent    | float         | yes           | The default discount percentage for spare parts in automatic bids
bidSettings.auto.qualityOfParts            | string        | yes           | The default quality of spare parts in automatic bids
bidSettings.auto.timeDiscountPercent       | string        | yes           | The default discount percentage for work in automatic bids
bidSettings.courtesyCar                    | boolean       | no            | Weather or not the workshop offers courtesy car
bidSettings.manual                         | object        | no            | An object representing the manual bid settings
bidSettings.manual.guaranteeOnParts        | integer       | yes           | The default warranty on spare parts in months for manual bids
bidSettings.manual.guaranteeOnWork         | integer       | yes           | The default warranty on work in months for manual bids
bidSettings.manual.hourlyRate              | float         | yes           | The default hourly rate for manual bids
bidSettings.manual.numberOfDaysValid       | integer       | yes           | The default number of days an manual bid is valid
bidSettings.manual.priceOfCourtesyCar      | float         | yes           | The default price of courtesy car for manual bids
bidSettings.manual.productDiscountPercent  | float         | yes           | The default discount percentage for spare parts in manual bids
bidSettings.manual.qualityOfParts          | string        | yes           | The default quality of spare parts in manual bids
bidSettings.manual.timeDiscountPercent     | string        | yes           | The default discount percentage for work in manual bids
digestMode                                 | string        | no            | Frequency of digest mail sendouts
excludedJobTaskTypes                       | array(object) | no            | A list of job task types that are unsupported
excludedJobTaskTypes.id                    | integer       | no            | The id of the job task type
excludedJobTaskTypes.name                  | string        | no            | The machine-readable name of the job task type
excludedMakes                              | array(object) | no            | A list of car makes that are unsupported
excludedMakes.id                           | integer       | no            | The id of the car make
excludedMakes.name                         | string        | no            | The name of the car make
mecaDisabled                               | boolean       | no            | Weather or not spare part ordering through Meca is disabled
mecaPassword                               | string        | yes           | The Meca password of the workshop
mecaUsername                               | string        | yes           | The Meca username of the workshop
mecaViaCrm                                 | boolean       | no            | If set to `true`, ordering og spare parts via Meca is configured to take place through their own CRM system
mechanicOwnedFlowBookTimeUrl               | string        | yes           | The unique Mechanicbooking book time URL for the workshop
mechanicOwnedFlowEnabled                   | boolean       | no            | Weather or not Mechanicbooking is enabled
mechanicOwnedFlowTermsUrl                  | string        | yes           | A url for the Mechanicbooking terms
mechanicOwnedFlowUrl                       | string        | yes           | The unique Mechanicbooking flow URL for the workshop
tolerancePassword                          | string        | yes           | The Tolerance password of the workshop
toleranceTWMName                           | string        | yes           | The Tolerance type used by the workshop
toleranceUsername                          | string        | yes           | The Tolerance username the workshop
usingAutofrontal                           | boolean       | no            | Weather or not the Autofrontal integration is enabled for the workshop
wantsGeneratorSms                          | boolean       | no            | Weather or not the workshop wants to receive Generator related sms messages
wantsSms                                   | boolean       | no            | Weather or not the workshop wants to receive Autobutler related sms messages
wantsZeroJobsDigest                        | boolean       | no            | Weather or not the workshop wants digest e-mails when he has no available jobs

## Update mechanic settings

> To update the settings for the workshop, use this code:

```shell
curl -X "PATCH" "https://www.autobutler.dk/api/v2/mechanics/settings" \
     -H "Authorization: token" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{\"bidSettings\":{\"auto\":{\"active\":true},\"manual\":{\"hourlyRate\":497},\"courtesyCar\":false},\"mecaViaCrm\":false,\"excludedJobTaskTypes\":[{\"id\":56},{\"id\":57}],\"excludedMakes\":[{\"id\":39},{\"id\":4}]}"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/settings",
  type: "PATCH",
  headers: {
    "Authorization": "token",
    "Content-Type": "application/json; charset=utf-8",
  },
  contentType: "application/json",
  data: JSON.stringify({
    "excludedJobTaskTypes": [
      {
        "id": 56
      },
      {
        "id": 57
      }
    ],
    "excludedMakes": [
      {
        "id": 39
      },
      {
        "id": 4
      }
    ],
    "bidSettings": {
      "auto": {
        "active": true
      },
      "manual": {
        "hourlyRate": 497
      },
      "courtesyCar": false
    },
    "mecaViaCrm": false
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
  "settings": {
    "allowMail": true,
    "bidSettings": {
      "auto": {
        "active": true,
        "guaranteeOnParts": 24,
        "guaranteeOnWork": 24,
        "hourlyRate": 479.0,
        "nextFreeTimeDaysForward": 3,
        "numberOfDaysValid": 30,
        "priceOfCourtesyCar": 179.0,
        "productDiscountPercent": 4.5,
        "qualityOfParts": "OEM",
        "timeDiscountPercent": 4.5
      },
      "courtesyCar": false,
      "manual": {
        "guaranteeOnParts": 48,
        "guaranteeOnWork": 48,
        "hourlyRate": 497.0,
        "numberOfDaysValid": 30,
        "priceOfCourtesyCar": 199.0,
        "productDiscountPercent": 5.0,
        "qualityOfParts": "ORIGINAL",
        "timeDiscountPercent": 5.0
      }
    },
    "digestMode": "DAILY",
    "excludedJobTaskTypes": [
      {
        "id": 56,
        "name": "brakes"
      },
      {
        "id": 57,
        "name": "car_care"
      }
    ],
    "excludedMakes": [
      {
        "id": 39,
        "name": "Oldsmobile"
      },
      {
        "id": 4,
        "name": "Toyota"
      }
    ],
    "mecaDisabled": false,
    "mecaPassword": "my_password",
    "mecaUsername": "MyUsername",
    "mecaViaCrm": false,
    "mechanicOwnedFlowBookTimeUrl": "https://mechanicbooking.dk/dippels-testvaerksted/book",
    "mechanicOwnedFlowEnabled": true,
    "mechanicOwnedFlowTermsUrl": "http://dev.autobutler.dk:3000/dashboard/workshop_crm_terms",
    "mechanicOwnedFlowUrl": "https://mechanicbooking.dk/dippels-testvaerksted",
    "tolerancePassword": "my_password",
    "toleranceTWMName": "Tolerance TWM",
    "toleranceUsername": "MyUsername",
    "usingAutofrontal": false,
    "wantsGeneratorSms": true,
    "wantsSms": true,
    "wantsZeroJobsDigest": true
  },
  "success": true
}
```

This endpoint updates the settings for the workshop. Please note that only the
parameters sent to the endpoint will be touched in the settings, Ie. if you for
instance don't want to change the `allowMail` setting, simply leave that value
out of the request body. Notice that empty strings are not ignored.

### HTTP Request

`PATCH https://www.autobutler.dk/api/v2/mechanics/settings`

### Request JSON

Attribute                                  | Type          | Required? | Description
---------                                  | -------       | ------------- | --------------------------------------------------------
allowMail                                  | boolean       | no            | Weather or not we are allowed to send newsletters
bidSettings                                | object        | no            | An object representing the different bid settings
bidSettings.auto                           | object        | no            | An object representing the automatic bid settings
bidSettings.auto.active                    | boolean       | no            | Weather or not automatic bidding is enabled
bidSettings.auto.guaranteeOnParts          | integer       | no            | The default warranty on spare parts in months for automatic bids
bidSettings.auto.guaranteeOnWork           | integer       | no            | The default warranty on work in months for automatic bids
bidSettings.auto.hourlyRate                | float         | no            | The default hourly rate for automatic bids
bidSettings.auto.nextFreeTimeDaysForward   | integer       | no            | The default number of days until the next available time for automatic bids
bidSettings.auto.numberOfDaysValid         | integer       | no            | The default number of days an automatic bid is valid
bidSettings.auto.priceOfCourtesyCar        | float         | no            | The default price of courtesy car for automatic bids
bidSettings.auto.productDiscountPercent    | float         | no            | The default discount percentage for spare parts in automatic bids
bidSettings.auto.qualityOfParts            | string        | no            | The default quality of spare parts in automatic bids
bidSettings.auto.timeDiscountPercent       | string        | no            | The default discount percentage for work in automatic bids
bidSettings.courtesyCar                    | boolean       | no            | Weather or not the workshop offers courtesy car
bidSettings.manual                         | object        | no            | An object representing the manual bid settings
bidSettings.manual.guaranteeOnParts        | integer       | no            | The default warranty on spare parts in months for manual bids
bidSettings.manual.guaranteeOnWork         | integer       | no            | The default warranty on work in months for manual bids
bidSettings.manual.hourlyRate              | float         | no            | The default hourly rate for manual bids
bidSettings.manual.numberOfDaysValid       | integer       | no            | The default number of days an manual bid is valid
bidSettings.manual.priceOfCourtesyCar      | float         | no            | The default price of courtesy car for manual bids
bidSettings.manual.productDiscountPercent  | float         | no            | The default discount percentage for spare parts in manual bids
bidSettings.manual.qualityOfParts          | string        | no            | The default quality of spare parts in manual bids
bidSettings.manual.timeDiscountPercent     | string        | no            | The default discount percentage for work in manual bids
digestMode                                 | string        | no            | Frequency of digest mail sendouts
excludedJobTaskTypes                       | array(object) | no            | A list of job task types that are unsupported
excludedJobTaskTypes.id                    | integer       | yes           | The id of the job task type
excludedMakes                              | array(object) | no            | A list of car makes that are unsupported
excludedMakes.id                           | integer       | yes           | The id of the car make
mecaDisabled                               | boolean       | no            | Weather or not spare part ordering through Meca is disabled
mecaPassword                               | string        | no            | The Meca password of the workshop
mecaUsername                               | string        | no            | The Meca username of the workshop
mecaViaCrm                                 | boolean       | no            | If set to `true`, ordering og spare parts via Meca is configured to take place through their own CRM system
mechanicOwnedFlowEnabled                   | boolean       | no            | Weather or not Mechanicbooking is enabled
tolerancePassword                          | string        | no            | The Tolerance password of the workshop
toleranceTWMName                           | string        | no            | The Tolerance type used by the workshop
toleranceUsername                          | string        | no            | The Tolerance username the workshop
usingAutofrontal                           | boolean       | no            | Weather or not the Autofrontal integration is enabled for the workshop
wantsGeneratorSms                          | boolean       | no            | Weather or not the workshop wants to receive Generator related sms messages
wantsSms                                   | boolean       | no            | Weather or not the workshop wants to receive Autobutler related sms messages
wantsZeroJobsDigest                        | boolean       | no            | Weather or not the workshop wants digest e-mails when he has no available jobs

### Response JSON

The endpoint responds with a status object with the updated settings nested within.
The JSON values in this nested object is the same as in the
<a href="#get-mechanic-settings">show</a> endpoint.
