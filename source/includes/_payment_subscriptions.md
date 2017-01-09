# Payment Subscriptions

## Get a list of active Payment Subscriptions

> To obtain a list of active Payment Subscriptions, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/payment_subscriptions" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/payment_subscriptions",
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
  "paymentSubscriptions": [
    {
      "accountNumber": "0002064483",
      "activatedAt": "2013-02-04T19:11:05.159+01:00",
      "createdAt": "2013-02-04T13:34:43.577+01:00",
      "id": 752,
      "registrationNumber": "4169",
      "type": "nets_ls"
    },
    {
      "activatedAt": "2013-01-24T14:11:44.139+01:00",
      "cardNumber": "XXXXXXXXXXXX7335",
      "createdAt": "2013-01-24T14:11:44.130+01:00",
      "id": 735,
      "type": "credit_card"
    },
    {
      "activatedAt": "2013-01-24T12:04:05.191+01:00",
      "createdAt": "2013-01-24T12:04:05.171+01:00",
      "id": 732,
      "type": "unknown"
    }
  ]
}
```

This endpoint returns a list of active payment subscriptions for the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/payment_subscriptions`

### Response JSON

Attribute                               | Type          | Can be blank? | Description
--------------------------------------- | ------------- | ------------- | --------------------------------------------------------------------
paymentSubscriptions                    | array(object) | no            | An array of objects representing the individual active subscriptions
paymentSubscriptions.activatedAt        | string        | no            | A timestamp for when the subscription was activated
paymentSubscriptions.createdAt          | string        | no            | A timestamp for when the subscription was created
paymentSubscriptions.id                 | integer       | no            | The id of the payment subscription
paymentSubscriptions.type               | string        | no            | The type of subscription:<br>`"credit_card"`: A credit card subscription<br>`"nets_ls"`: A Nets Leverandørservice subscription<br>`"unknown"`: An unknown subscription
paymentSubscriptions.registrationNumber | integer       | yes           | The registration number for the associated bank account. Only available if `type` is `"nets_ls"`
paymentSubscriptions.accountNumber      | string        | yes           | The account number for the associated bank account. Only available if `type` is `"nets_ls"`
paymentSubscriptions.cardNumber         | string        | yes           | The masked credit card number. Only available if `type` is `"credit_card"`

## Cancel an active Payment Subscription

> To cancel an active Payment Subscription, use the following code:

```shell
curl -X "DELETE" "https://www.autobutler.dk/api/v2/mechanics/payment_subscriptions/752" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/payment_subscriptions/752",
    type: "DELETE",
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
  "success": true
}
```

This endpoint cancels the specified active Payment Subscription belonging to the
workshop.

### HTTP Request

`DELETE https://www.autobutler.dk/api/v2/mechanics/payment_subscriptions/{id}`

### URL Parameters

Parameter | Default | Required? | Description
--------- | ------- | --------- | ----------------------------------
id        | nil     | yes       | The id of the Payment Subscription

### Response JSON

Attribute | Type    | Can be blank? | Description
--------- | ------- | ------------- | -----------------------------------------------------
success   | boolean | no            | `true` if the subscription was successfully cancelled

### Potential Errors

Error Code | Meaning
---------- | -----------------------------------------------------------------------------------------
404        | The Payment Subscription with the specified id could not be found or is already cancelled
