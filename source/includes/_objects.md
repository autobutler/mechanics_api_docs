# Common JSON objects

## jobOverview

> Example:

```json
{
  "job": {
    "id": 123456,
    "acceptedAt": "2016-09-30T14:16:13.325+02:00",
    "acceptedOfferId": 1234,
    "cancelledAt": "2016-09-30T14:16:13.325+02:00",
    "closedAt": "2016-09-30T14:16:13.325+02:00",
    "createdAt": "2016-09-30T14:16:13.325+02:00",
    "completedAt": "2016-09-30T14:16:13.325+02:00",
    "deadlineBefore": "2016-10-14",
    "deadlineToggle": "NEXT_OPEN",
    "name": "Brakes",
    "priorityScore": 3310,
    "publicCommentsCount": 1,
    "referenceNumber": "ab123456",
    "rejectedAt": "2016-09-30T14:16:13.325+02:00",
    "reopenedAt": "2016-09-30T14:16:13.325+02:00",
    "state": "OPEN",
    "selected": false,
    "jobTasks": [
      {
        "jobTaskTypeId": 56,
        "name": "Brakes"
      }
    ],
    "car": {
      "id": 371762,
      "registrationNumber": "AB12345",
      "make": "Citroen",
      "year": 1997,
      "name": "Citroen Berlingo"
    },
    "carOwner": {
      "id": 343827,
      "ownerId": 1,
      "ownerType": "Partner",
      "mechanicOwned": false
    },
    "marketPrice": { }
  },
  "draftOffer": {},
  "offer": {
    "id": 12345,
    "draft": false,
    "priceDetails": {
      "totalPrice": 1234.56
    }
  }
}
```

Attribute                      | Type          | Can be blank? | Description
------------------------------ | ------------- | ------------- | ------------------------------------------------------------
job                            | object        | no            | A JSON object with details of the job
job.id                         | integer       | no            | The id of the job
job.acceptedAt                 | string        | yes           | A timestamp for when an offer for the job was accepted
job.acceptedOfferId            | integer       | yes           | The id of the accepted offer
job.cancelledAt                | string        | yes           | A timestamp for when the job was cancelled
job.closedAt                   | string        | yes           | A timestamp for when the job was closed
job.createdAt                  | string        | no            | A timestamp for when the job was created
job.completedAt                | string        | yes           | A timestamp for when the job was completed
job.deadlineBefore             | string        | no            | The latest date that the car owner requested when the job was created
job.deadlineToggle             | string        | no            | When the car owner would like the job to be done:<br>`"NEXT_OPEN"`: Next free time before the deadline<br>`"URGENT"`: The job is urgent
job.name                       | string        | no            | A label that reflects the type of tasks included in the job
job.priorityScore              | integer       | yes           | Undocumented - For internal use only
job.publicCommentsCount        | integer       | yes           | The number of comments on the job
job.referenceNumber            | string        | no            | The reference number of the job. Usually a two letter code followed by the id of the job
job.rejectedAt                 | string        | yes           | A timestamp for when the job was rejected - Only applicable for Mechanic Booking jobs
job.reopenedAt                 | string        | yes           | A timestamp for when the job was re-opened
job.state                      | string        | no            | The current state of the job - Mostly for internal use
job.selected                   | boolean       | no            | A boolean indicating weather or not the workshop was explicitly selected by the car owner during the job creation flow
job.jobTasks                   | array(object) | no            | An array of job tasks included in the job
job.jobTasks.jobTaskTypeId     | integer       | no            | The id of the job task type for this task
job.jobTasks.name              | string        | no            | A label describing the type of the task
job.car                        | object        | no            | A JSON object with details of the car
job.car.id                     | integer       | no            | The id of the car
job.car.registrationNumber     | string        | yes           | The registration number of the car
job.car.make                   | string        | yes           | The make of the car
job.car.year                   | string        | yes           | The registration date of the year
job.car.name                   | string        | no            | A label that identifies the car make, model and year
job.carOwner                   | object        | no            | A JSON object with details of the car owner
job.carOwner.id                | integer       | no            | The id of the car owner
job.carOwner.ownerId           | integer       | no            | The id of the car owners owner - Mostly for internal use
job.carOwner.ownerType         | string        | no            | The type of the car owners owner - Mostly for internal use
job.carOwner.mechanicOwned     | boolean       | no            | A boolean indicating weather or not this is a Mechanic Booking job
job.marketPrice                | object        | yes           | A <a href="#marketprice">marketPrice</a> object with market pricing details of the job
draftOffer                     | object        | yes           | A <a href="#draftofferoverview">draftOfferOverview</a> object
offer                          | object        | yes           | A JSON object with details of the existing offer from the workshop
offer.id                       | integer       | no            | The id of the offer
offer.draft                    | boolean       | no            | A boolean representing weather or not the offer is a draft
offer.priceDetails             | object        | no            | A JSON object with details of the offer pricing
offer.priceDetails.totalPrice  | float         | no            | The total price of the offer

## jobDetails

> Example:

```json
{
  "id": 538984,
  "acceptedAt": "2016-11-17T18:00:11.613+01:00",
  "acceptedOfferId": 1234,
  "cancelledAt": "2016-11-17T18:00:11.613+01:00",
  "closedAt": "2016-11-17T18:00:11.613+01:00",
  "createdAt": "2016-11-17T18:00:11.613+01:00",
  "completedAt": "2016-11-17T18:00:11.613+01:00",
  "courtesyCarNeeded": false,
  "deadlineBefore": "2016-12-01",
  "deadlineToggle": "NEXT_OPEN",
  "name": "Servicing and Suspension / shock absorbers",
  "referenceNumber": "ab538984",
  "rejectedAt": "2016-11-17T18:00:11.613+01:00",
  "reopenedAt": "2016-11-17T18:00:11.613+01:00",
  "state": "OPEN",
  "selected": false,
  "jobTasks": [
    {
      "jobTaskTypeId": 50,
      "description": "Water pump and belts. Oil air and fuel filters. Points and plugs.",
      "name": "Servicing",
      "jobTaskFields": [
        {
          "id": 279851,
          "value": "dont_know",
          "human": "Don't know the milage since last service",
          "jobTaskField": {
            "id": 10,
            "humanName": "Mileage since at last service?"
          }
        }
      ],
      "jobFiles": [
        {
          "id": 1234,
          "name": "test.jpg",
          "url": "http://some.cdcn.domain.com/images/url_to_image.jpg",
          "image": true,
          "thumbUrl": "http://some.cdcn.domain.com/images/url_to_image_thumb.jpg",
          "largeUrl": "http://some.cdcn.domain.com/images/url_to_image_large.jpg"
        }
      ]
    },
    {
      "jobTaskTypeId": 72,
      "description": "Front and rear wishbones. Trackrod ends and antiroll droplinks",
      "name": "Suspension / shock absorbers",
      "jobTaskFields": [],
      "jobFiles": []
    }
  ],
  "car": {
    "id": 388148,
    "chassisNumber": "123456789",
    "fuelType": "UNKNOWN",
    "kilometres": 130000,
    "lastServiceDate": "2016-10-16",
    "make": "Volvo",
    "model": "S60",
    "series": null,
    "registrationNumber": "Y312PEV",
    "typeCode": "-",
    "vin": "",
    "variant": "S T",
    "year": 2001,
    "name": "Volvo S60"
  },
  "carOwner": {
    "id": 357727,
    "ownerId": 1,
    "ownerType": "Partner",
    "mechanicOwned": false,
    "name": "Alex",
    "email": null,
    "phoneNumber": null
  },
  "jobZip": {
    "areaId": 1643724,
    "city": "Hounslow, Greater London",
    "zip": "TW13 6AA",
    "latitude": 51.439627,
    "longitude": -0.389636,
    "maxDistance": 15
  },
  "marketPrice": { }
}
```

Attribute                                     | Type          | Can be blank? | Description
--------------------------------------------- | ------------- | ------------- | ------------------------------------------------------------
id                                            | integer       | no            | The id of the job
acceptedAt                                    | string        | yes           | A timestamp for when an offer for the job was accepted
acceptedOfferId                               | integer       | yes           | The id of the accepted offer
cancelledAt                                   | string        | yes           | A timestamp for when the job was cancelled
closedAt                                      | string        | yes           | A timestamp for when the job was closed
createdAt                                     | string        | no            | A timestamp for when the job was created
completedAt                                   | string        | yes           | A timestamp for when the job was completed
deadlineBefore                                | string        | no            | The latest date that the car owner requested when the job was created
deadlineToggle                                | string        | no            | When the car owner would like the job to be done:<br>`"NEXT_OPEN"`: Next free time before the deadline<br>`"URGENT"`: The job is urgent
name                                          | string        | no            | A label that reflects the type of tasks included in the job
referenceNumber                               | string        | no            | The reference number of the job. Usually a two letter code followed by the id of the job
rejectedAt                                    | string        | yes           | A timestamp for when the job was rejected - Only applicable for Mechanic Booking jobs
reopenedAt                                    | string        | yes           | A timestamp for when the job was re-opened
state                                         | string        | no            | The current state of the job - Mostly for internal use
selected                                      | boolean       | no            | A boolean indicating weather or not the workshop was explicitly selected by the car owner during the job creation flow
jobTasks                                      | array(object) | no            | An array of job tasks included in the job
jobTasks.jobTaskTypeId                        | integer       | no            | The id of the job task type for this task
jobTasks.description                          | string        | no            | The text provided by the car owner to describe the things expected from the workshop for this task
jobTasks.name                                 | string        | no            | A label describing the type of the task
jobTasks.jobTaskFields                        | array(object) | no            | An array of objects containing details about the dynamic options provided by the car owner for the task
jobTasks.jobTaskFields.id                     | integer       | no            | The id of the selected option record
jobTasks.jobTaskFields.value                  | string        | no            | The machine readable value selected by the car owner
jobTasks.jobTaskFields.human                  | string        | no            | The human readable value selected by the car owner
jobTasks.jobTaskFields.jobTaskField           | object        | no            | An object representing the details of the job task field
jobTasks.jobTaskFields.jobTaskField.id        | integer       | no            | The id of the job task field
jobTasks.jobTaskFields.jobTaskField.humanName | string        | no            | The title of the option that the car owner was asked to select
jobTasks.jobFiles                             | array(object) | no            | An array of objects representing the files that the car owner uploaded with the job
jobTasks.jobFiles.id                          | integer       | no            | The id of the uploaded file
jobTasks.jobFiles.name                        | string        | no            | The name of the file
jobTasks.jobFiles.url                         | string        | no            | The url for the uploaded file
jobTasks.jobFiles.image                       | boolean       | no            | `true` if the uploaded file is an image, otherwise `false`
jobTasks.jobFiles.thumbUrl                    | string        | yes           | The url for a thumbnail version of the file. Only available for images
jobTasks.jobFiles.largeUrl                    | string        | yes           | The url for a large version of the file. Only available for images
car                                           | object        | no            | An object representing the details of the car
car.id                                        | integer       | no            | The id of the car
car.chassisNumber                             | string        | yes           | The chassis number of the car
car.fuelType                                  | string        | no            | The type of fuel used by the car: `"UNKNOWN"`, `"PETROL"`, `"ELECTRIC"`, `"HYBRID"`, `"GAS"`
car.kilometres                                | integer       | no            | The current milage of the car (in kilometers)
car.lastServiceDate                           | string        | yes           | A date for when the car was last serviced
car.make                                      | string        | yes           | The make of the car
car.model                                     | string        | yes           | The model of the car
car.series                                    | string        | yes           | The series identifier of the car
car.registrationNumber                        | string        | yes           | The registration number of the car
car.typeCode                                  | string        | yes           | The type approval of the car
car.vin                                       | string        | yes           | The VIN number of the car
car.variant                                   | string        | yes           | The model variant identifier of the car
car.year                                      | integer       | yes           | The registration year of the car
car.name                                      | string        | yes           | A label containing information about both make and model
carOwner                                      | object        | no            | An object representing details about the car owner
carOwner.id                                   | integer       | no            | The id of the car owner
carOwner.ownerId                              | integer       | no            | The id of the car owners owner - Only for internal use
carOwner.ownerType                            | integer       | no            | The type of the car owners owner - Only for internal use
carOwner.mechanicOwned                        | boolean       | no            | `true` if the job is a Mechanic Booking job, otherwise `false`
carOwner.name                                 | string        | no            | The name of the car owner. Please note that the full name of the car owner is only returned for Mechanic Booking jobs or jobs that are accepted but not completed
carOwner.email                                | string        | yes           | The e-mail address of the car owner. Only returned for Mechanic Booking jobs or jobs that are accepted but not completed
carOwner.phoneNumber                          | string        | yes           | The phone number of the car owner. Only returned for Mechanic Booking jobs or jobs that are accepted but not completed
jobZip                                        | object        | no            | An object representing details about the geolocation of the job
jobZip.areaId                                 | integer       | no            | The id of the area selected by the car owner
jobZip.city                                   | string        | no            | The city name of the area selected by the car owner
jobZip.zip                                    | string        | no            | The zip code of the area selected by the car owner
jobZip.latitude                               | float         | no            | The latitude of the area selected by the car owner
jobZip.longitude                              | float         | no            | The longitude of the area selected by the car owner
jobZip.maxDistance                            | integer       | no            | The maximum driving distance selected by the car owner
job.marketPrice                               | object        | yes           | A <a href="#marketprice">marketPrice</a> object with market pricing details of the job

## offerDetails

> Example:

```json
{
  "acceptanceText": null,
  "acceptedToCompleteAt": null,
  "availableOn": "2017-05-10",
  "body": "Here is your offer...",
  "cancelComment": null,
  "cancelledAt": null,
  "carPickupAt": null,
  "completionNote": null,
  "completionTimeOfDay": null,
  "completionOverdue": false,
  "courtesyCar": true,
  "createdAt": "2017-05-08T09:55:06.322+02:00",
  "declinedAt": null,
  "draft": false,
  "expirationDate": "2017-06-05",
  "guaranteeOnParts": 36,
  "guaranteeOnWork": 36,
  "id": 1234567,
  "jobWillBeCompletedOn": null,
  "lost": false,
  "marketPrice": null,
  "mechanicIntegrationData": {},
  "pickupTimeOfDay": null,
  "priceDetails": {
    "lineItems": [],
    "pricing": "FIXED",
    "subtotal": 2732.2,
    "totalNumberOfHours": 0.0,
    "totalPrice": 3415.25,
    "totalsExcludingVat": {
      "priceOfCourtesyCar": 1.0,
      "priceOfParts": 0.0,
      "priceOfWork": 2700.0,
      "priceOfWorkPerHour": 0.0,
      "serviceFee": 31.2
    },
    "totalsIncludingVat": {
      "priceOfCourtesyCar": 1.25,
      "priceOfParts": 0.0,
      "priceOfWork": 3375.0,
      "priceOfWorkPerHour": 0.0,
      "serviceFee": 39.0
    },
    "vat": 683.05,
    "vatFactor": 0.25
  },
  "qualityOfParts": "OEM",
  "rejectedExplanation": null,
  "rejectedReason": null
}
```

Attribute               | Type    | Can be blank? | Description
----------------------- | ------- | ------------- | ------------------------------------------------------------
acceptanceText          | string  | yes           | An optional description of why the car owner chose this offer
acceptedToCompleteAt    | string  | yes           | The date that the car owner requested the job to be completed on
availableOn             | string  | no            | The next available date that the workshop specified when the offer was sent
body                    | string  | no            | The description that the workshop sent with the offer to the car owner
cancelComment           | string  | yes           | A comment about why the offer was cancelled
cancelledAt             | string  | yes           | A timestamp for when the offer was cancelled
carPickupAt             | string  | yes           | The date at which the car owner can pick up his car from the workshop
completionNote          | string  | yes           | An optional comment that was given when the job was completed
completionOverdue       | boolean | no            | Whether or not the deadline (the date the job will be completed + 7 days) has been met
completionTimeOfDay     | string  | yes           | When during the day was the offer completed
courtesyCar             | boolean | no            | Wether or not the offer includes a courtesy car
createdAt               | string  | no            | A timestamp for when the offer was sent
declinedAt              | string  | yes           | A timestamp for when the offer was declined
draft                   | boolean | no            | Wether or not this offer is a draft offer
expirationDate          | string  | no            | The date on which this offer expires
guaranteeOnParts        | integer | no            | The number of months of guarantee offered on spare parts
guaranteeOnWork         | integer | no            | The number of months of guarantee offered on labour
id                      | integer | no            | The id of the offer
jobWillBeCompletedOn    | string  | yes           | The date on which the job will be carried out by the workshop
lost                    | boolean | no            | Wether or not the job was lost to a competing offer
marketPrice             | float   | yes           | The typical market price for a similar offer on the job
mechanicIntegrationData | object  | no            | Integration metadata
pickupTimeOfDay         | string  | yes           | The time at which the car owner can pick up his car from the workshop
priceDetails            | object  | no            | A <a href="#pricedetails">priceDetails</a> object
qualityOfParts          | integer | no            | The quality of the spare parts included in the offer
rejectedExplanation     | string  | yes           | An freehand explanation of why the offer was rejected
rejectedReason          | string  | yes           | The selected reason for why the offer was rejected

## draftOfferOverview

> Example:

```json
{
  "id": 123,
  "priceDetails": {
    "totalPrice": 1234.56
  }
}
```

Attribute               | Type    | Can be blank? | Description
----------------------- | ------- | ------------- | ------------------------------------------------------------
id                      | integer | no            | The id of the draft offer
priceDetails            | object  | no            | A JSON object with details of the draft offer pricing
priceDetails.totalPrice | float   | no            | The total price of the draft offer

## draftOfferDetails

> Example:

```json
{
  "id": 123456,
  "body": "Hi Peter, here is an offer for the job that you requested.",
  "createdAt": "2016-11-17T18:00:11.613+01:00",
  "priceDetails": {}
}
```

Attribute    | Type          | Can be blank? | Description
------------ | ------------- | ------------- | ------------------------------------------------------------
id           | integer       | no            | The if of the draft offer
body         | string        | no            | The offer text for the car owner
createdAt    | string        | no            | A timestamp for when the draft offer was created
priceDetails | object        | no            | A <a href="#pricedetails">priceDetails</a> object

## priceDetails

> Example:

```json
{
  "pricing": "LINE_ITEMS",
  "totalNumberOfHours": 2.0,
  "subtotal": 1539.0,
  "totalsExcludingVat": {
    "priceOfWork": 500.0,
    "priceOfWorkPerHour": 250.0,
    "priceOfParts": 1000.0,
    "priceOfCourtesyCar": 0.0,
    "serviceFee": 39.0
  },
  "lineItems": [
    {
      "id": 1234,
      "articleNumber": "0001",
      "category": null,
      "createdAt": "2016-11-17T18:00:11.613+01:00",
      "description": "Working hours",
      "manufacturer": null,
      "partnerData": null,
      "type": null,
      "unit": "hours",
      "customerPrice": 250.0,
      "discountPercent": 0.0,
      "grossPrice": 250.0,
      "netPrice": 250.0,
      "quantity": 2.0,
      "discountedCustomerPrice": 250.0,
      "subtotal": 500.0
    },
    {
      "id": 1235,
      "articleNumber": "BOSCH-BC00345",
      "category": "brakes",
      "createdAt": "2016-11-17T18:00:11.613+01:00",
      "description": "Brake Calipers",
      "manufacturer": "Bosch",
      "partnerData": {
        "some": "arbitrary",
        "data": true
      },
      "type": "MecaOfferLineItem",
      "unit": "pcs",
      "customerPrice": 500.0,
      "discountPercent": 0.0,
      "grossPrice": 500.0,
      "netPrice": 400.0,
      "quantity": 2.0,
      "discountedCustomerPrice": 500.0,
      "subtotal": 1000.0
    }
  ]
}
```

Attribute                             | Type          | Can be blank? | Description
------------------------------------- | ------------- | ------------- | ------------------------------------------------------------
pricing                               | string        | no            | The type of pricing used for the draft offer. Possible values are:<br>`"LINE_ITEMS"`: This offer contains order lines with individual prices<br>`"FIXED"`: This offer contains order lines but a single fixed price<br>`"HOURLY"`: This offer has no order lines but instead consists of an hourly rate and a fixed price for spare parts
totalNumberOfHours                    | float         | no            | The total number of working hours included in the draft offer
subtotal                              | float         | no            | The sub total of the draft offer
totalsExcludingVat                    | object        | no            | An object representing the totals of the draft offer excluding VAT
totalsExcludingVat.priceOfWork        | float         | no            | The total labour price of the draft offer
totalsExcludingVat.priceOfWorkPerHour | float         | no            | The total labour price of the offer divided by the total number of working hours
totalsExcludingVat.priceOfParts       | float         | no            | The total price of spare parts
totalsExcludingVat.priceOfCourtesyCar | float         | no            | The price of the courtesy car, regardless of weather it is included or not
totalsExcludingVat.serviceFee         | float         | no            | The Autobutler service fee
lineItems                             | array(object) | no            | An array of objects representing the individual order lines
lineItems.id                          | integer       | no            | The id of the order line
lineItems.articleNumber               | string        | yes           | An article number for the part
lineItems.category                    | string        | yes           | A metadata category label
lineItems.createdAt                   | string        | no            | A timestamp for when the line item was created
lineItems.description                 | string        | no            | The description of the item
lineItems.manufacturer                | string        | yes           | The manufacturer of the part
lineItems.partnerData                 | object        | yes           | An object with arbitrary partner metadata
lineItems.type                        | string        | yes           | Used to identify line items from third party integrations
lineItems.unit                        | string        | no            | The type of unit used for the item. Possible values:<br>`"pcs"`: Pieces<br>`"liter"`: Liters<br>`"gram"`: Grams<br>`"kg"`: Kilograms<br>`"meter"`: Meters<br>`"set"`: Sets<br>`"hours"`: Working hours
lineItems.customerPrice               | float         | no            | The price per unit that will be charged to the car owner
lineItems.discountPercent             | float         | no            | A discount percentage that will be deducted from the price that the car owner will be charged
lineItems.grossPrice                  | float         | no            | The listed sales price for the item
lineItems.netPrice                    | float         | no            | The purchase price for the workshop
lineItems.quantity                    | float         | no            | The number of units
lineItems.discountedCustomerPrice     | float         | no            | The customer unit price minus discount
lineItems.subtotal                    | float         | no            | The number of units multiplied by the discounted customer price

## marketPrice

> Example:

```json
{
  "averagePrice": 1234.56,
  "highestPrice": 6543.21,
  "lowestPrice": 123.45,
  "mechanicsCount": 123
}
```

Attribute      | Type    | Can be blank? | Description
-------------- | ------- | ------------- | ------------------------------------------------------------
averagePrice   | float   | no            | The average market price for the job
highestPrice   | float   | no            | The highest market price for the job
averagePrice   | float   | no            | The lowest market price for the job
mechanicsCount | integer | no            | The number of mechanics used in the market price calculation

## userOverview

> Example:

```json
{
  "id": 2,
  "name": "Robert Auto",
  "city": "København Ø",
  "zip": "2100"
}
```

Attribute      | Type    | Can be blank? | Description
-------------- | ------- | ------------- | --------------------------
id             | int     | no            | id of the user
name           | string  | no            | Name of the user
city           | string  | no            | User's location - city
zip            | string  | no            | User's location - zip code

## campaignDetails

> Example:

```json
    {
      "id": 106,
      "name": "hjulskifteforaar17",
      "title": "<p>marketing.campaign_pages.hjulskifteforaar17.card_headline</p>",
      "backgroundUrl": "https://d2bythind2nctn.cloudfront.net/marketing/campaign_pages/106/Landingpage_tyre_bg2_original.jpg",
      "link": "/marketing/campaign_pages/hjulskifteforaar17",
      "lineItemPrice": 249,
      "shortDescription": "Short description",
      "fullDescription": "Full description",
      "startDate": "2017-10-01",
      "endDate": "2017-11-01",
      "signupType": "signed_up_autobid",
      "isNew": false,
      "benefits": [
        "Benefit 1",
        "Benefit 2",
        "Benefit 3"
      ],
      "conditions": [
        "Condition 1",
        "Condition 2",
        "Condition 3"
      ]
    }
```

Attribute        | Type          | Can be blank? | Description
---------------- | ------------- | ------------- | -----------------------------------------------------------------------------
id               | integer       | yes           | The campaign id
name             | string        | yes           | The campaign internal name
title            | string        | yes           | The campaign title that is shown on the frontend
backgroundUrl    | string        | yes           | The campaign background url that is shown on the frontend
link             | string        | no            | The link to the campaign page on Autobutler
lineItemPrice    | integer       | yes           | The line item price for jobs, related for current campaign
shortDescription | string        | yes           | The short description text for current campaign
fullDescription  | string        | yes           | The full description text for current campaign
statDate         | string        | no            | The start date of the first campaign's online period
endDate          | string        | no            | The end date of the first campaign's online period
signupType       | string        | yes           | The signup type for current mechanic on current campaign
isNew            | boolean       | no            | The boolean representing if current campaign is new for current mechanic
benefits         | array(string) | yes           | The array of strings representing benefits of current campaign
conditions       | array(string) | yes           | The array of strings representing conditions for current campaign

## pagination

> Example:

```json
{
  "currentPage": 1,
  "entriesPerPage": 20,
  "totalEntries": 606,
  "totalPages": 31
}
```

Attribute        | Type          | Can be blank? | Description
---------------- | ------------- | ------------- | -----------------------------------------------------------------------------
currentPage      | integer       | no            | The page of the results that was returned
entriesPerPage   | integer       | no            | How many entries that are returned per page
totalEntries     | integer       | no            | How many entries there are in total
totalPages       | integer       | no            | How many pages there are in total

## jobFilter

> Example:

```json
{
  "attributes": {
    "jobTaskTypeId": null,
    "makeId": null
  },
  "search": null
}
```

Attribute                | Type          | Can be blank? | Description
------------------------ | ------------- | ------------- | -----------------------------------------------------------------------------
attributes               | object        | no            | An object representing the direct attribute filters that were applied to the result
attributes.jobTaskTypeId | integer       | yes           | The id of the job task type that was used to filter the results
attributes.makeId        | integer       | yes           | The id of the car make that was used to filter the results
search                   | string        | yes           | The search string that was used to filter the results

## review

> Example:

```json
{
  "id": 70116,
  "author": "Lars Larsen",
  "createdAt": "2017-05-01T15:45:25.852+02:00",
  "comment": "",
  "additionalComment": "",
  "rating": 3,
  "reviewRatings": [
    {
      "rating": null,
      "category": "Test 3"
    },
    {
      "rating": null,
      "category": "Test 2"
    },
    {
      "rating": null,
      "category": "Test 1"
    }
  ]
}
```


Attribute                    | Type          | Can be blank? | Description
---------------------------- | -------       | ------------- | -----------------
review                       | object        | no            | The review object
review.id                    | integer       | no            | The id of the review
review.author                | string        | no            | Author of the review
review.createdAt             | string        | no            | A timestamp for when the review was created
review.comment               | string        | yes           | A comment the author wrote for the review
review.additionalComment     | string        | yes           | An additional comment the author wrote for the review
review.rating                | integer       | no            | A number from 1-5 the author gave
review.reviewRatings         | array(object) | no            | An array of ratings included in the review
review.reviewRatings.rating  | integer       | yes           | A number from 1-5 for additional ratings
review.reviewRatings.category| string        | no            | A description of the additional rating

## reviewRequest

> Example:

```json
{
  "id": 1,
  "name": "Foo",
  "email": "foo@example.com",
  "phoneNumber": "12345678",
  "registrationNumber": "AB12345",
  "make": "Renault",
  "model": "2598",
  "comment": "Hello..."
}
```

Attribute          | Type    | Can be blank? | Description
------------------ | ------- | ------------- | ------------------------------------------
id                 | integer | no            | The id of the Review Request
name               | string  | yes           | The name of the car owner
email              | string  | yes           | The email of the car owner
phoneNumner        | string  | yes           | The phone number of the car owner
registrationNumber | string  | yes           | The registration number of the car
make               | string  | yes           | The make of the car
model              | string  | yes           | The model of the car
comment            | string  | yes           | The comment for the review requst
