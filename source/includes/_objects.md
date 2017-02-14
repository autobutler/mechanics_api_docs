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
  "priceDetails": {
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
}
```

Attribute                                          | Type          | Can be blank? | Description
-------------------------------------------------- | ------------- | ------------- | ------------------------------------------------------------
id                                                 | integer       | no            | The if of the draft offer
body                                               | string        | no            | The offer text for the car owner
createdAt                                          | string        | no            | A timestamp for when the draft offer was created
priceDetails                                       | object        | no            | An object representing the pricing details of the draft offer
priceDetails.pricing                               | string        | no            | The type of pricing used for the draft offer. Possible values are:<br>`"LINE_ITEMS"`: This offer contains order lines with individual prices<br>`"FIXED"`: This offer contains order lines but a single fixed price<br>`"HOURLY"`: This offer has no order lines but instead consists of an hourly rate and a fixed price for spare parts
priceDetails.totalNumberOfHours                    | float         | no            | The total number of working hours included in the draft offer
priceDetails.subtotal                              | float         | no            | The sub total of the draft offer
priceDetails.totalsExcludingVat                    | object        | no            | An object representing the totals of the draft offer excluding VAT
priceDetails.totalsExcludingVat.priceOfWork        | float         | no            | The total labour price of the draft offer
priceDetails.totalsExcludingVat.priceOfWorkPerHour | float         | no            | The total labour price of the offer divided by the total number of working hours
priceDetails.totalsExcludingVat.priceOfParts       | float         | no            | The total price of spare parts
priceDetails.totalsExcludingVat.priceOfCourtesyCar | float         | no            | The price of the courtesy car, regardless of weather it is included or not
priceDetails.totalsExcludingVat.serviceFee         | float         | no            | The Autobutler service fee
priceDetails.lineItems                             | array(object) | no            | An array of objects representing the individual order lines
priceDetails.lineItems.id                          | integer       | no            | The id of the order line
priceDetails.lineItems.articleNumber               | string        | yes           | An article number for the part
priceDetails.lineItems.category                    | string        | yes           | A metadata category label
priceDetails.lineItems.createdAt                   | string        | no            | A timestamp for when the line item was created
priceDetails.lineItems.description                 | string        | no            | The description of the item
priceDetails.lineItems.manufacturer                | string        | yes           | The manufacturer of the part
priceDetails.lineItems.partnerData                 | object        | yes           | An object with arbitrary partner metadata
priceDetails.lineItems.type                        | string        | yes           | Used to identify line items from third party integrations
priceDetails.lineItems.unit                        | string        | no            | The type of unit used for the item. Possible values:<br>`"pcs"`: Pieces<br>`"liter"`: Liters<br>`"gram"`: Grams<br>`"kg"`: Kilograms<br>`"meter"`: Meters<br>`"set"`: Sets<br>`"hours"`: Working hours
priceDetails.lineItems.customerPrice               | float         | no            | The price per unit that will be charged to the car owner
priceDetails.lineItems.discountPercent             | float         | no            | A discount percentage that will be deducted from the price that the car owner will be charged
priceDetails.lineItems.grossPrice                  | float         | no            | The listed sales price for the item
priceDetails.lineItems.netPrice                    | float         | no            | The purchase price for the workshop
priceDetails.lineItems.quantity                    | float         | no            | The number of units
priceDetails.lineItems.discountedCustomerPrice     | float         | no            | The customer unit price minus discount
priceDetails.lineItems.subtotal                    | float         | no            | The number of units multiplied by the discounted customer price

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
 