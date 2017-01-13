# Product Subscriptions

## Get a list of active Product Subscriptions

> To obtain a list of active Product Subscriptions, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/product_subscriptions" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/product_subscriptions",
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
  "productSubscriptions": [
    {
      "productSubscription": {
        "id": 1,
        "acceptedAt": null,
        "createdAt": "2017-01-02T10:43:24.043+01:00",
        "expires": "2018-01-01",
        "price": 0.0,
        "readyToAccept": false,
        "rebate": 0.0,
        "recurring": true,
        "renewedAt": "2017-01-02",
        "type": "AreaProductSubscription",
        "totalPrice": 0.0,
        "daysLeft": 365,
        "comment": null,
        "childSubscriptions": [
          {
            "productSubscription": {
              "id": 1,
              "acceptedAt": "2015-06-22T07:20:47.785+02:00",
              "createdAt": "2016-11-24T01:10:26.170+01:00",
              "expires": "2017-11-22",
              "price": 0.0,
              "readyToAccept": false,
              "rebate": 0.0,
              "recurring": true,
              "renewedAt": "2016-11-23",
              "type": "ProductSubscription",
              "totalPrice": 0.0,
              "daysLeft": 365,
              "comment": null,
              "commissionRate": 0.0
            },
            "subscriptionPeriod": {
              "id": 1,
              "name": "Pro Bono",
              "interval": 1,
              "intervalType": "years",
              "trial": false
            },
            "product": {
              "id": 1,
              "name": "Autobutler.dk ",
              "basic": true,
              "core": true,
              "fleet": false,
              "generator": false
            }
          }
        ]
      },
      "subscriptionPeriod": {
        "id": 1,
        "name": "Pro Bono",
        "interval": 1,
        "intervalType": "years",
        "trial": false
      },
      "product": {
        "id": 1,
        "name": "Premium",
        "basic": false,
        "core": false,
        "fleet": false
      },
      "area": {
        "id": 1,
        "name": "København K",
        "zip": "1100"
      }
    }
  ]
}
```

This endpoint returns a list of active product subscriptions for the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/product_subscriptions`

### Response JSON

Attribute                                                   | Type          | Can be blank? | Description
----------------------------------------------------------- | ------------- | ------------- | --------------------------------------------------------------------
productSubscriptions                                        | array(object) | no            | An array of nested objects representing the individual active subscriptions
productSubscriptions.area                                   | object        | yes           | An object representing the area the subscription belongs to
productSubscriptions.area.id                                | integer       | no            | The id of the area
productSubscriptions.area.name                              | string        | no            | The name of the area
productSubscriptions.area.zip                               | string        | no            | The zip of the area
productSubscriptions.product                                | object        | no            | An object representing the product the subscription belongs to
productSubscriptions.product.basic                          | boolean       | no            | Is the product a basic product?
productSubscriptions.product.core                           | boolean       | no            | Is the product a core product?
productSubscriptions.product.fleet                          | boolean       | no            | Is the product a fleet product?
productSubscriptions.product.generator                      | boolean       | no            | Is the product a generator product?
productSubscriptions.product.id                             | integer       | no            | The id of the product
productSubscriptions.product.name                           | string        | no            | The name of the product
productSubscriptions.productSubscription                    | object        | no            | An object representing the product subscription
productSubscriptions.productSubscription.acceptedAt         | string        | yes           | The date and time when the prduct subscription was accepted
productSubscriptions.productSubscription.childSubscriptions | array(object) | yes           | An array of nested objects representing the individual active subscriptions
productSubscriptions.productSubscription.comment            | string        | yes           | A comment for the product subscription that will be on the invoice
productSubscriptions.productSubscription.commissionRate     | string        | no            | The commission rate for the product subscription
productSubscriptions.productSubscription.createdAt          | string        | no            | The time stamp for when the product subscription was created
productSubscriptions.productSubscription.daysLeft           | integer       | yes           | How many days left the product subscription is locked for
productSubscriptions.productSubscription.expires            | string        | no            | The date when the product subscription will expire
productSubscriptions.productSubscription.id                 | integer       | no            | The id of the product subscription
productSubscriptions.productSubscription.price              | float         | no            | The price of the product subscription
productSubscriptions.productSubscription.readyToAccpet      | boolean       | no            | Is the product subscription ready to accept by the workshop?
productSubscriptions.productSubscription.rebate             | float         | no            | The rebate of the product subscription
productSubscriptions.productSubscription.recurring          | integer       | no            | Is the product subscription recurring?
productSubscriptions.productSubscription.renewedAt          | string        | no            | The date for when the product subscription starts
productSubscriptions.productSubscription.totalPrice         | float         | no            | The total price of the product subscription
productSubscriptions.productSubscription.type               | string        | no            | The type of product subscription. Can be "AreaproductSubscription" or "ProductSubscription"
productSubscriptions.subscriptionPeriod                     | object        | no            | An object representing the period the subscription belongs to
productSubscriptions.subscriptionPeriod.id                  | integer       | no            | The id of the subscription period
productSubscriptions.subscriptionPeriod.interval            | integer       | no            | Default number of periods the subscription is locked for
productSubscriptions.subscriptionPeriod.intervalType        | string        | no            | Inter val type of the subscription period. Can be "years", "months" or "days"
productSubscriptions.subscriptionPeriod.name                | string        | no            | The name of the subscription period
productSubscriptions.subscriptionPeriod.trial               | boolean       | no            | Is the subscription period a trial
