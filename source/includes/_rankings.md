# Rankings

## Get mechanic rankings

> To get the rankings for a mechanic, use this code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/rankings?statisticName=jobOffersSent" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
  url: "https://www.autobutler.dk/api/v2/mechanics/rankings?statisticName=jobOffersSent",
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
[
  {
    "id": 359527,
    "name": "Hillerød Autocenter ApS - AutoPlus",
    "position": 9,
    "change": -5
  },
  {
    "id": 6642,
    "name": "Hildebrandts Auto",
    "position": 10,
    "change": 3
  },
  {
    "id": 23107,
    "name": "Nordsjællands Automekanik ApS - Bosch Car Service",
    "position": 11,
    "change": -4
  },
  {
    "id": 6411,
    "name": "Grome Automobiler ApS",
    "position": 12,
    "change": 0
  },
  {
    "id": 444984,
    "name": "Byens Autocenter Powerleasing A/S",
    "position": 13,
    "change": 2
  }
]
```

This endpoint returns the rankings of a mechanic for a particular statistic specified by the `statisticName` which can be `jobOffersSent`, `jobOffersWon`, `jobsCompletedRevenue`.

An array of objects describing a mechanics position and ranking change is returned. The ranking is limited to mechanics able to bid within 15km of the logged in mechanic. Only up to 5 mechanics adjacent in the rankings table are returned.
