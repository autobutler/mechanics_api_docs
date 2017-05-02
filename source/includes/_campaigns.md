# Conversations

## Get a list of campaigns relevant for current mechanic

> To obtain a list of campaigns, use the following code:

```shell
curl -X "GET" "https://www.autobutler.dk/api/v2/mechanics/campaigns" \
     -H "Authorization: token"
```

```javascript
jQuery.ajax({
    url: "https://www.autobutler.dk/api/v2/mechanics/campaigns",
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
  "currentCampaignPages": [
    {
      "id": 12,
      "name": "ven",
      "title": "<p>marketing.campaign_pages.ven.card_headline</p>",
      "backgroundUrl": "https://d2bythind2nctn.cloudfront.net/marketing/campaign_pages/12/bg_default_original.jpg",
      "link": "/marketing/campaign_pages/ven",
      "lineItemPrice": null,
      "shortDescription": null,
      "fullDescription": null,
      "startDate": "2017-04-28",
      "endDate": "2017-06-09",
      "signupType": null,
      "isNew": true,
      "benefits": [],
      "conditions": []
    }
  ],
  "comingCampaignPages": [
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
  ]
}
```

This endpoint returns a list of campaigns relevant for the workshop.

### HTTP Request

`GET https://www.autobutler.dk/api/v2/mechanics/campaigns`


Attribute                                                            | Type          | Can be blank? | Description
-------------------------------------------------------------------- | ------------- | ------------- | ----------------------------------------------------------------------------------------------------
campaigns                                                            | object        | no            | An object representing the individual campaigns
campaigns.currentCampaignPages                                       | array(object) | yes           | The array of ongoing <a href="#campaigndetails">campaignDetails</a> objects, relevant for a mechanic
campaigns.comingCampaignPages                                        | array(object) | yes           | The array of future <a href="#campaigndetails">campaignDetails</a> objects, relevant for a mechanic
