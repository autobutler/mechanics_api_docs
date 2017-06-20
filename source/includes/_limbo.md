# Limbo
## Get limbo details

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/limbo" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/limbo",
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
    "display": true,
    "needsToAcceptSubscriptions": false,
    "subscriptionsToAccept": [],
    "needToAcceptTerms": false,
    "needToAcceptGeneratorTerms": false,
    "needToAcceptPartnerTerms": false,
    "termsToAccept": [],
    "needToSetPaymentMethods": false,
    "needToFillInFields": false,
    "requiredFields": {},
    "requiredMechanicFields": {},
    "requiredMechanicConfigFields": {},
    "leadsAreHidden": false,
    "haveOverdueInvoices": true,
    "hasOverdueJobs": true
}
```

This endpoint returns actions the mechanic needs to perform in order for the account to be valid.
Used to show notifications about new product subscriptions, terms, overdue invoices, overdue jobs etc.


### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/limbo`

### Response JSON

Attribute                    | Type           | Can be blank? | Description
-----------------------------| -------------  | ------------- | ---------------------------------------------
needsToAcceptSubscriptions   | boolean        | no            | Whether the mechanic needs to accept product subscriptions
subscriptionsToAccept        | array(object)  | yes           | A list of product subscriptions the mechanics has yet to accept
needToAcceptTerms            | boolean        | no            | Whether the mechanic needs to accept terms
needToAcceptGeneratorTerms   | boolean        | no            | Whether the mechanic needs to accept related to Generator
needToAcceptPartnerTerms     | boolean        | no            | Whether the mechanic needs to accept related to of Autobutler's partners
termsToAccept                | array(object)  | yes           | A list of terms the mechanic needs to accept
needToSetPaymentMethods      | boolean        | no            | Whether the mechanic needs to set payments methods
needToFillInFields           | boolean        | no            | Whether the mechanic needs to fill in fields to make the account valid
requiredFields               | hash           | yes           | A list of the required fields the mechanic needs to fill in to make the account valid
requiredMechanicFields       | hash           | yes           | A list of the required fields from the users table the mechanic needs to fill in to make the account valid (for internal use)
requiredMechanicConfigFields | hash           | yes           | A list of the required fields from the mechanic_configs table the mechanic needs to fill in to make the account valid (for internal use)
leadsAreHidden               | boolean        | no            | Whether leads are hidden from the mechanic
haveOverdueInvoices          | boolean        | no            | Whether the mechanic has any overdue invoices
hasOverdueJobs               | boolean        | no            | Whether the mechanic has any Autobutler jobs that has surpassed the completion date by 7 days
