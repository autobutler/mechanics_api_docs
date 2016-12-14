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
  "additionalChains": [
    {
      "id": 12,
      "name": "Bosch Car Service"
    },
    {
      "id": 20,
      "name": "Dinitrol"
    }
  ],
  "affiliations": [
    {
      "id": 61,
      "name": "Dæktryg"
    },
    {
      "id": 11,
      "name": "Michelin Quality Dealer"
    }
  ],
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
  "competencies": [
    {
      "id": 60,
      "name": "Audio/Stereo/Navigation"
    },
    {
      "id": 63,
      "name": "Beklædning/polstring "
    }
  ],
  "contactName": "Foo Bar",
  "countryBilling": "",
  "cvr": "12345678",
  "description": "Test",
  "digestMode": "DAILY",
  "email": "foo@bar.dk",
  "emailBilling": "",
  "emailJobRelated": "",
  "emailPublic": "",
  "employees": 1,
  "establishedDate": "",
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
  "faxNumber": "",
  "invoiceReference": "",
  "makes": [
    {
      "id": 60,
      "name": "Alfa Romeo"
    },
    {
      "id": 66,
      "name": "BMW"
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
  "mobilePhoneNumber": "",
  "name": "Dippels Testværksted",
  "nameBilling": "Dippels Testværksted",
  "openingHours": {
    "1_begin": "",
    "1_end": "",
    "2_begin": "",
    "2_end": "",
    "3_begin": "",
    "3_end": "",
    "4_begin": "",
    "4_end": "",
    "5_begin": "",
    "5_end": "",
    "6_begin": "",
    "6_end": "",
    "7_begin": "",
    "7_end": ""
  },
  "organisation": "FREE",
  "ownerName": "Thomas Dippel",
  "phoneNumber": "77343221",
  "place": "København S",
  "placeBilling": "København S",
  "properName": "Dippels Testværksted",
  "showEmail": false,
  "showPhoneNumber": true,
  "specialties": [
    {
      "id": 60,
      "name": "Alfa Romeo"
    },
    {
      "id": 66,
      "name": "BMW"
    }
  ],
  "streetName": "Njalsgade",
  "streetNameBilling": "Njalsgade",
  "streetNumber": "21 G, 1.",
  "streetNumberBilling": "21 G, 1.",
  "tolerancePassword": "my_password",
  "toleranceTWMName": null,
  "toleranceUsername": "MyUsername",
  "usingAutofrontal": false,
  "vatNumber": "DK32891799",
  "wantsGeneratorSms": false,
  "wantsSms": true,
  "www": "www.foo.bar",
  "zip": "2300",
  "zipBilling": "2300"
}
```

This endpoint returns settings for the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/settings`

### Response JSON

Attribute                                  | Type          | Can be blank? | Description
---------                                  | -------       | ------------- | --------------------------------------------------------
additionalChains                           | array(object) | no            | A list of objects representing the workshop chains that the workshop is part of
additionalChains.id                        | integer       | no            | The id of the chain
additionalChains.name                      | string        | no            | The name of the chain
affiliations                               | array(object) | no            | A list of objects representing the different organisations that the workshop is a member of
affiliations.id                            | integer       | no            | The id of the organisation
affiliations.name                          | string        | no            | The name of the organisation
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
competencies                               | array(object) | no            | A list of objects representing the different competencies of the workshop
competencies.id                            | integer       | no            | The id of the competency
competencies.name                          | string        | no            | The name of the competency
contactName                                | string        | yes           | The name of the contact person at the workshop
countryBilling                             | string        | yes           | The country of the billing address for the workshop
cvr                                        | string        | yes           | The VAT-number of the workshop
description                                | string        | yes           | A short description of the workshop
digestMode                                 | string        | no            | Frequency of digest mail sendouts
email                                      | string        | no            | The e-mail address of the workshop. Also doubles as the Autobutler username for the workshop
emailBilling                               | string        | yes           | A separate billing e-mail address for the workshop
emailJobRelated                            | string        | yes           | A separate e-mail address for receiving job-related notifications
emailPublic                                | string        | yes           | A separate e-mail address for the workshop that will be shown publically on the workshops profile page
employees                                  | integer       | yes           | The number of employess at the workshop
establishedDate                            | string        | yes           | A date for when the workshop was established
excludedJobTaskTypes                       | array(object) | no            | A list of job task types that are unsupported
excludedJobTaskTypes.id                    | integer       | no            | The id of the job task type
excludedJobTaskTypes.name                  | string        | no            | The machine-readable name of the job task type
excludedMakes                              | array(object) | no            | A list of car makes that are unsupported
excludedMakes.id                           | integer       | no            | The id of the car make
excludedMakes.name                         | string        | no            | The name of the car make
faxNumber                                  | string        | yes           | The fax number of the workshop
invoiceReference                           | string        | yes           | An identifier that will be printed on all invoices
makes                                      | array(object) | no            | A list of objects representing the different makes that the workshop is officially authorized to service
makes.id                                   | integer       | no            | The id of the make
makes.name                                 | string        | no            | The name of the make
mecaDisabled                               | boolean       | no            | Weather or not spare part ordering through Meca is disabled
mecaPassword                               | string        | yes           | The Meca password of the workshop
mecaUsername                               | string        | yes           | The Meca username of the workshop
mecaViaCrm                                 | boolean       | no            | If set to `true`, ordering og spare parts via Meca is configured to take place through their own CRM system
mechanicOwnedFlowBookTimeUrl               | string        | yes           | The unique Mechanicbooking book time URL for the workshop
mechanicOwnedFlowEnabled                   | boolean       | no            | Weather or not Mechanicbooking is enabled
mechanicOwnedFlowTermsUrl                  | string        | yes           | A url for the Mechanicbooking terms
mechanicOwnedFlowUrl                       | string        | yes           | The unique Mechanicbooking flow URL for the workshop
mobilePhoneNumber                          | string        | yes           | The mobile phone numer of the workshop
name                                       | string        | no            | The name of the workshop
nameBilling                                | string        | yes           | The name of the workshop that will be printed on invoices
openingHours                               | object        | no            | An object representing the opening hours of the workshop
openingHours.1_begin                       | string        | yes           | The opening hour for Mondays
openingHours.1_end                         | string        | yes           | The closing hour for Mondays
openingHours.2_begin                       | string        | yes           | The opening hour for Tuesdays
openingHours.2_end                         | string        | yes           | The closing hour for Tuesdays
openingHours.3_begin                       | string        | yes           | The opening hour for Wednesdays
openingHours.3_end                         | string        | yes           | The closing hour for Wednesdays
openingHours.4_begin                       | string        | yes           | The opening hour for Thursdays
openingHours.4_end                         | string        | yes           | The closing hour for Thursdays
openingHours.5_begin                       | string        | yes           | The opening hour for Fridays
openingHours.5_end                         | string        | yes           | The closing hour for Fridays
openingHours.6_begin                       | string        | yes           | The opening hour for Saturdays
openingHours.6_end                         | string        | yes           | The closing hour for Saturdays
openingHours.7_begin                       | string        | yes           | The opening hour for Sundays
openingHours.7_end                         | string        | yes           | The closing hour for Sundays
organisation                               | string        | no            | `"FREE"`: The workshop is not an authorized car make workshop<br>`"AUTHORISED"`: The workshop is an authorized car make workshop
ownerName                                  | string        | yes           | The name of the workshop owner
phoneNumber                                | string        | yes           | The phone number of the workshop
place                                      | string        | no            | The city where the workshop is located
placeBilling                               | string        | yes           | The city where invoices should be sent
properName                                 | string        | yes           | The legal name of the workshop
showEmail                                  | boolean       | no            | Weather or not the e-mail address of the workshop can be shown publically
showPhoneNumber                            | boolean       | no            | Weather or not the phone number of the workshop can be shown publically
specialties                                | array(object) | no            | A list of objects representing the different job task types that the workshop specilises in
specialties.id                             | integer       | no            | The id of the job task type
specialties.name                           | string        | no            | The name of the job task type
streetName                                 | string        | no            | The street name where the workshop is located
streetNameBilling                          | string        | yes           | The street name where invoices should be sent
streetNumber                               | string        | no            | The street number where the workshop is located
streetNumberBilling                        | string        | yes           | The street number where invoices should be sent
tolerancePassword                          | string        | yes           | The Tolerance password of the workshop
toleranceTWMName                           | string        | yes           | The Tolerance type used by the workshop
toleranceUsername                          | string        | yes           | The Tolerance username the workshop
usingAutofrontal                           | boolean       | no            | Weather or not the Autofrontal integration is enabled for the workshop
wantsGeneratorSms                          | boolean       | no            | Weather or not the workshop wants to receive Generator related sms messages
wantsSms                                   | boolean       | no            | Weather or not the workshop wants to receive Autobutler related sms messages
www                                        | string        | yes           | The website address of the workshop
zip                                        | string        | no            | The zip code where the workshop is located
zipBilling                                 | string        | yes           | The zip code where invoices should be sent

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
competencies                               | array(object) | no            | A list of objects representing the different competencies of the workshop
competencies.id                            | integer       | yes           | The id of the competency
contactName                                | string        | no            | The name of the contact person at the workshop
countryBilling                             | string        | no            | The country of the billing address for the workshop
cvr                                        | string        | no            | The VAT-number of the workshop
description                                | string        | no            | A short description of the workshop
digestMode                                 | string        | no            | Frequency of digest mail sendouts
email                                      | string        | no            | The e-mail address of the workshop. Also doubles as the Autobutler username for the workshop
emailBilling                               | string        | no            | A separate billing e-mail address for the workshop
emailJobRelated                            | string        | no            | A separate e-mail address for receiving job-related notifications
emailPublic                                | string        | no            | A separate e-mail address for the workshop that will be shown publically on the workshops profile page
employees                                  | integer       | no            | The number of employess at the workshop
establishedDate                            | string        | no            | A date for when the workshop was established
excludedJobTaskTypes                       | array(object) | no            | A list of job task types that are unsupported
excludedJobTaskTypes.id                    | integer       | yes           | The id of the job task type
excludedMakes                              | array(object) | no            | A list of car makes that are unsupported
excludedMakes.id                           | integer       | yes           | The id of the car make
faxNumber                                  | string        | no            | The fax number of the workshop
invoiceReference                           | string        | no            | An identifier that will be printed on all invoices
mecaDisabled                               | boolean       | no            | Weather or not spare part ordering through Meca is disabled
mecaPassword                               | string        | no            | The Meca password of the workshop
mecaUsername                               | string        | no            | The Meca username of the workshop
mecaViaCrm                                 | boolean       | no            | If set to `true`, ordering og spare parts via Meca is configured to take place through their own CRM system
mechanicOwnedFlowEnabled                   | boolean       | no            | Weather or not Mechanicbooking is enabled
mobilePhoneNumber                          | string        | no            | The mobile phone numer of the workshop
name                                       | string        | no            | The name of the workshop
nameBilling                                | string        | no            | The name of the workshop that will be printed on invoices
openingHours                               | object        | no            | An object representing the opening hours of the workshop
openingHours.1_begin                       | string        | yes           | The opening hour for Mondays
openingHours.1_end                         | string        | yes           | The closing hour for Mondays
openingHours.2_begin                       | string        | yes           | The opening hour for Tuesdays
openingHours.2_end                         | string        | yes           | The closing hour for Tuesdays
openingHours.3_begin                       | string        | yes           | The opening hour for Wednesdays
openingHours.3_end                         | string        | yes           | The closing hour for Wednesdays
openingHours.4_begin                       | string        | yes           | The opening hour for Thursdays
openingHours.4_end                         | string        | yes           | The closing hour for Thursdays
openingHours.5_begin                       | string        | yes           | The opening hour for Fridays
openingHours.5_end                         | string        | yes           | The closing hour for Fridays
openingHours.6_begin                       | string        | yes           | The opening hour for Saturdays
openingHours.6_end                         | string        | yes           | The closing hour for Saturdays
openingHours.7_begin                       | string        | yes           | The opening hour for Sundays
openingHours.7_end                         | string        | yes           | The closing hour for Sundays
ownerName                                  | string        | no            | The name of the workshop owner
password                                   | string        | no            | A new password for the workshop
phoneNumber                                | string        | no            | The phone number of the workshop
place                                      | string        | no            | The city where the workshop is located
placeBilling                               | string        | no            | The city where invoices should be sent
properName                                 | string        | no            | The legal name of the workshop
showEmail                                  | boolean       | no            | Weather or not the e-mail address of the workshop can be shown publically
showPhoneNumber                            | boolean       | no            | Weather or not the phone number of the workshop can be shown publically
specialties                                | array(object) | no            | A list of objects representing the different job task types that the workshop specilises in
specialties.id                             | integer       | yes            | The id of the job task type
streetName                                 | string        | no            | The street name where the workshop is located
streetNameBilling                          | string        | no            | The street name where invoices should be sent
streetNumber                               | string        | no            | The street number where the workshop is located
streetNumberBilling                        | string        | no            | The street number where invoices should be sent
tolerancePassword                          | string        | no            | The Tolerance password of the workshop
toleranceTWMName                           | string        | no            | The Tolerance type used by the workshop
toleranceUsername                          | string        | no            | The Tolerance username the workshop
usingAutofrontal                           | boolean       | no            | Weather or not the Autofrontal integration is enabled for the workshop
wantsGeneratorSms                          | boolean       | no            | Weather or not the workshop wants to receive Generator related sms messages
wantsSms                                   | boolean       | no            | Weather or not the workshop wants to receive Autobutler related sms messages
wantsZeroJobsDigest                        | boolean       | no            | Weather or not the workshop wants digest e-mails when he has no available jobs
www                                        | string        | no            | The website address of the workshop
zip                                        | string        | no            | The zip code where the workshop is located
zipBilling                                 | string        | no            | The zip code where invoices should be sent

### Response JSON

The endpoint responds with a status object with the updated settings nested within.
The JSON values in this nested object is the same as in the
<a href="#get-mechanic-settings">show</a> endpoint.
