# Vehicle Info

## Get information about a vehicle

> To obtain information about a vehicle, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/vehicle_infos/AB12345"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/vehicle_infos/AB12345",
    type: "GET"
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
  "registrationNumber": "AB12345",
  "state": "LOADED",
  "chassisNumber": "VF12RFL1H49621453",
  "regDate": "2013-08-28",
  "errorResponse": null,
  "makeAndModelId": 2598,
  "inspectionDate": "2015-09-10",
  "make": "Renault",
  "model": "Captur",
  "variant": "1.5 dCi 90 Authentique 5d"
}
```

This endpoint returns information about a vehicle.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/vehicle_infos/{registration_number}`

### Response JSON

Attribute          | Type       | Can be blank? | Description
------------------ | ---------- | ------------- | --------------------------------------------------------------------
registrationNumber | string     | no            | Registration number of the vehicle
state              | string     | no            | State of this vehicle info. Can be one of QUEUED, PROCESSING, LOADED, NOT_FOUND, ERROR
chassisNumber      | string     | yes           | Chassis number of the vehicle
regDate            | string     | yes           | Registration date of the vehcile
errorResponse      | string     | yes           | Error message from external data provider (if state is ERROR)
makeAndModelId     | integer    | yes           | Make and model id of the vehicle
inspectionDate     | string     | yes           | Inspection date of the vehicle
make               | string     | yes           | Make of the vehicle
model              | string     | yes           | Model of the vehicle
variant            | string     | yes           | Variant of the vehicle
