Received: from JPN01-OS2-obe.outbound.protection.outlook.com (JPN01-OS2-obe.outbound.protection.outlook.com [40.107.141.97])
 by mx.groups.io with SMTP id smtpd.web09.12958.1608651468564686771
 for <tools@linux.kernel.org>;
 Tue, 22 Dec 2020 07:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesasgroup.onmicrosoft.com header.s=selector2-renesasgroup-onmicrosoft-com header.b=By+yvtVH;
 spf=pass (domain: renesas.com, ip: 40.107.141.97, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqoX7BEWA+mxxdFqSbGjjRWYPetWAF3LDMKEQX9z9a5XqhQaaRy+iNuC3mENEYstI0TB8WbnP4WoM5MXkIVAy3TwJj2770FCwcOeKvovBSwKwbyt7BWbZ7C7nCVCacFpSbIUi01ZfCPvBSqgEwDZL92uyen4QjGBBLbfhBnFpklytcAwFl7TnvR4XVse5mPEAY7NUo3of50WXc81KdVQbfY3bAw39ps1rgPUZ/LfZeLZ658E38cjOWVy2kK+7sSpw3sGxHArv9+C0wi0MfVJNa/EUkGEZ/C7la3WkuQjgwVv5p9lRVE7TAmwnkZ+SXRVH/2/YaWint76XGyg3Op6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMxbHjGyqmzxvPYtTcU7D7VCAgBScBo7W0lL16IMO3s=;
 b=Cw3I151khzthxl2r5Vqz4q2a2dTTDYEzRzLIHRhrChQHgTA3iSAyA7QkeN30qY0nRAgW+BBNNgjJpP42qjcTqvZv+3DxLNJ1isOgU16Nym7+AEZD/5X6taDosFz0EkTGh0F9pdNO7cn7vzibFw1qsQ93wb5dv137z50xJAq16hPd0XQ1j70VVyqNqtENQ33kVAn8SIDXhEhHtGoej6vUevodJgN2KzQVzKXjJhfLpvgm7ESAiu9R0oFADqSuPUbqPCx01JcU1GggNExTjBAi5jp1yvKgLJFDUlhP0GDJwZKH4x7G8Dd2W8rTO7opsrWzT0u3lJwwL+b4zsiJJ2ZbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMxbHjGyqmzxvPYtTcU7D7VCAgBScBo7W0lL16IMO3s=;
 b=By+yvtVHlGcRN+v08Ufw9GEsRw5bVjR7PyUfdyZcVIx0ps/VsRPeCWSMPzWXnQkfTYPL9+I3ayv1ipTwlcZl/XnNqy3m5YYOx1JJJx1thTCFpRa9yq4JtiRhpQsFRvvC4dCPsNfMoHJ4bfBSiJxxk/TblSG8vSb3FRSC97r/uKY=
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com (2603:1096:603:37::20)
 by OSAPR01MB3090.jpnprd01.prod.outlook.com (2603:1096:604:4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 15:37:44 +0000
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::89ef:c893:5ca0:260b]) by OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::89ef:c893:5ca0:260b%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 15:37:43 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: "khilman@baylibre.com" <khilman@baylibre.com>,
	"automated-testing@lists.yoctoproject.org"
	<automated-testing@lists.yoctoproject.org>, "kernelci@groups.io"
	<kernelci@groups.io>
CC: "tools@linux.kernel.org" <tools@linux.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
Subject: Re: [Automated-testing] RFC: dashboards, visualization and analytics for test results
Thread-Topic: [Automated-testing] RFC: dashboards, visualization and analytics
 for test results
Thread-Index: AQHWnNHy5nLQTL/V9UyZBPDXbiTNEaoDtK+A
Date: Tue, 22 Dec 2020 15:37:43 +0000
Message-ID: 
 <OSAPR01MB238522F29BB2F3FF21668445B7DF0@OSAPR01MB2385.jpnprd01.prod.outlook.com>
References: <7hk0w2c4i3.fsf@baylibre.com>
In-Reply-To: <7hk0w2c4i3.fsf@baylibre.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.219.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab14eae5-6459-4102-d1c8-08d8a68f867a
x-ms-traffictypediagnostic: OSAPR01MB3090:
x-microsoft-antispam-prvs: 
 <OSAPR01MB30904710CB68A8CDDE20C5C2B7DF0@OSAPR01MB3090.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YP5ULKynV8AjX0LTf7UMueHeC/ePK+6fYt/Ri+rzaMxKnRR+vANFRDhUVxD5Weh3s4xxtmM6ZCHzPi6NRf1SnuRPOgqrWLG6CXmX+YbOVALcksfH2zNRY+U/BgYC3tHf2G885hKe+mLiyPz2+grRz6mpCXImAdVUldzLEHQKgfGUY+CV8QrwRgrvTFXYgiZM/Gus9zvRQb1GP7vC01RU4OteD00TcyeRKtyZcS4ArulAacFmhGGzU6Xwa0kfveizjkn3A/P+mrkhIG4QWAUnjcaKPSKK4r6/SI4HfAw5A7gRSvO/+D1BKcc2FPqmTJoGmJ8MUbhO0pDMKi/8z0Ipot42Ds7I+v873tQ2vGMy9BO6YHaS6kdqeQMPXvy3a3V/mrIkd3m5wFk5YASSkTIqIw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2385.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(186003)(54906003)(26005)(2906002)(4326008)(110136005)(6506007)(478600001)(316002)(64756008)(66476007)(66556008)(66446008)(52536014)(8936002)(66946007)(76116006)(7696005)(9686003)(55016002)(86362001)(33656002)(83380400001)(71200400001)(8676002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?Smo1WnFzV2dvMG05VGMySlhVZHdMTkNDak1FVEtRRVdvYVl6VjB2by96ZjRO?=
 =?utf-8?B?OVlMbjdNQjRsVjNOU0tmVjUxOUsrNGliY3NzYmFtbk1HOW84VlZZOUlwRzJm?=
 =?utf-8?B?S1ZjMXY2eWhOeTBRclFGc1BZOEhLYURZL25rMXhrZlp1NVZQeTdzSzJSR05S?=
 =?utf-8?B?U0FYUlNuKzBWZHpuNEQ2dEdwVlBEeE9YZUx4MWVEbXljai9XZHFwKzVVbEZo?=
 =?utf-8?B?K0c5TWhYR05kaHM0eHlrQkREamJZdTN6Rk1BU2RGdjJGVEV0eDN1N2RISVNE?=
 =?utf-8?B?S1o5UGhzR2ltMUViRkJ5ZnhNV0ZRSjZZc2sxZ0xMSE1LYjg5ZUk3OTEwam9Q?=
 =?utf-8?B?VEpVcHA4UkNSUVlPbVJrV2ZWdWExK2F3cHdidE1MbnV1bHJQRG8renhIWWI2?=
 =?utf-8?B?SEZhNzRrcFZJaHI2N0srT2lFdVJKTjR0a0RTQkF0S0RFWmxBQm9jS29QY3lJ?=
 =?utf-8?B?T3RuQTRCZWgzSWEyUEh5M3c3aE5hLzMrbVoyZ1E3Z1ptT0lLRUVDZEtaR0M0?=
 =?utf-8?B?bWMvOWhTQURQNXNTcXNFQUFaOGZ3bGhudHlvZkgyd2NCcHB1aFBhOUlGVDZF?=
 =?utf-8?B?V1ZVc2VrWGtRWUsvVHM4WVhORU5LN0E0YjF5TTMwTyt6TzgxY2hkYXV5T1Vz?=
 =?utf-8?B?ZlV1MlpWU1BrYXZnd3UyVEZIcFRXRGppQzBxU2JGZG1ieGFvYk0xRlBvT3dr?=
 =?utf-8?B?OXI2TGFtOHFXMmRIcitxNCsrUVl3bVNOVU9mT01EWGtBK0crZlNFOWYrVWg1?=
 =?utf-8?B?aDF5Mjl5MG1aTjNDUWc0RUlCRU9VT1hGZlNsN015dDdvK3RmVytDWUt0S1NU?=
 =?utf-8?B?eE1sL2RuUWtWZGdkU1VJUUo3amFHRVZNdUV6TXFYOE45UTdIbEo5Y1hUQUQ1?=
 =?utf-8?B?ZW1qRDFCZGMxc2hUbkZSNmlnV2tubGJxYm1mR0c2dTF1Ym1jSmU0a1JPVEpp?=
 =?utf-8?B?N0R0ZERyVXhydy9JMlNoWlhrVlpaeUJ0M3hML0VpSGlrWEZjTkwyZU52amdp?=
 =?utf-8?B?MmdNdWg1QmlKK091d1lkNmhHS1MvSFMzTDZuM2JQc2p6dkJwcUdSdDkrVFVJ?=
 =?utf-8?B?UFM2Z0x1NjBTby9McFIxS2NiU1RBbVBlRU9YUWNxend1MDA1UFNVVk1UTGFu?=
 =?utf-8?B?ZEtEU1BQMzYvRmIvZXpWRThYeGdwZ1dzS1V2VzZ6M3N6YmdnMkk3TExJVWJU?=
 =?utf-8?B?TWdOTithelJjcXVrNy9MWkVWUi90WVlNU0s5TW5MS0ZlbGI3eWR5WnArWGN6?=
 =?utf-8?B?Q21SQ0xpUmw3MVZzelN4ckRpZ3BkckVlaXZlV0RXMGJFcXhUQjRUTmN6cFZC?=
 =?utf-8?Q?d2GsKdqGrnjPk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2385.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab14eae5-6459-4102-d1c8-08d8a68f867a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 15:37:43.9025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1P9ogNI/wXGyYvSfYEh64rz4h5tTELoek9c+NF84jxwgP00QH6Untopnro/HclP/I8gmKBY9/N2ETQvhOcsbrlh9JXBS37CMTGP5eKMoa6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3090
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gS2V2aW4sDQoNCj4gRnJvbTogYXV0b21hdGVkLXRlc3RpbmdAbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8YXV0b21hdGVkLQ0KPiB0ZXN0aW5nQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9u
IEJlaGFsZiBPZiBLZXZpbiBIaWxtYW4gdmlhDQo+IGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4g
U2VudDogMDcgT2N0b2JlciAyMDIwIDE4OjQ4DQoNClsuLi5dDQoNCj4gDQo+IEJlbG93IGlzIHRo
ZSBzdGFydCBvZiBhIGxpc3Qgb2YgdXNlciBzdG9yaWVzWzJdLCBidXQgd2Ugd2FudCB0byBncm93
DQo+IHRoaXMgbGlzdCB3aXRoIHlvdXIgaWRlYXMsIHNvIHBsZWFzZSBzaGFyZSB0aGVtIG9uIHRo
aXMgdGhyZWFkLg0KPiANCg0KWy4uLl0NCg0KPiANCj4gWzJdIEV4YW1wbGUgdXNlciBzdG9yaWVz
DQo+IA0KPiBBIGtlcm5lbCBkZXZlbG9wZXIgaGFzIHNlbnQgYSBwYXRjaCB3aGljaCBjYXVzZWQg
YSByZWdyZXNzaW9uDQo+ICAgIC0gRmluZCB0aGUgZGV0YWlscywgaG93IHRvIHJlcHJvZHVjZSwg
Y2hlY2sgd2hlbiBpdOKAmXMgZml4ZWQNCj4gDQo+IEEgbWFpbnRhaW5lciBpcyBnZXR0aW5nIGEg
YnJhbmNoIHJlYWR5IGZvciB0aGUgbmV4dCBtZXJnZSB3aW5kb3cNCj4gICAtIENvbXBhcmUgcmVz
dWx0cyBhZ2FpbnN0IG1haW5saW5lLCBlbnN1cmUgYWxsIHRlc3RzIHdlcmUgcnVuIGNvcnJlY3Rs
eQ0KDQpBcyBwYXJ0IG9mIHRoaXMsIGl0IG1heSBiZSBnb29kIHRvIGhpZGUgdGhlIGZhaWx1cmVz
IHJlcG9ydGVkIHRoYXQgYXJlIGFsc28gcmVwb3J0ZWQgb24gbWFpbmxpbmUsIHNvIHRoZSBtYWlu
dGFpbmVyIGtub3dzIHRoZSByZWdyZXNzaW9ucyBkaXJlY3RseSBjYXVzZWQgYnkgdGhlaXIgdHJl
ZS4NClBlcmhhcHMgdGhpcyBjaGFuZ2UgY291bGQgYWxzbyBiZSBtYWRlIGZvciB0aGUgZW1haWwg
cmVwb3J0cy4NCg0KU3VnZ2VzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KDQpLaW5kIHJlZ2FyZHMsIENocmlzDQoNCj4gDQo+IEFuIE9FTSBvciBT
b0MgdmVuZG9yIG5lZWRzIHRvIHVwZ3JhZGUgdGhlaXIga2VybmVsIG9yIG1vdmUgdG8gdXBzdHJl
YW0NCj4gICAtIFNlZSBhbGwgcmVzdWx0cyBmb3IgYSBwYXJ0aWN1bGFyIHBsYXRmb3JtIG9uIHZh
cmlvdXMgc3RhYmxlIHJlbGVhc2VzDQo+IA0KPiBSZWd1bGFyIHZpc2l0b3JzIHdobyB3YW50IHRv
IGtub3cgaG93IHRoZSBrZXJuZWwgaXMgZG9pbmcNCj4gICAtIEhpZ2hsaWdodCBuZXcgcmVncmVz
c2lvbnMsIHNob3cgdHJlbmRzIGZvciBwYXNzL2ZhaWwgYW5kIHBlcmZvcm1hbmNlDQo+ICAgLSBE
b2VzIGtlcm5lbCBYIHdvcmsgb24gbXkgaGFyZHdhcmU/DQo+IA0KPiBEaXN0cm8gdmVuZG9yIHdh
bnRzIHRvIGtub3cNCj4gICAtIElzIHRoZSBsYXRlc3Qga2VybmVsIHN0YWJsZSBlbm91Z2ggZm9y
IG15IGRpc3Rybz8NCj4gICAtIFdoeSBkb2VzIHRoaXMgdGVzdCBmYWlsIG9uIG15IGRpc3RybyBr
ZXJuZWwgYnV0IG5vdCBzdGFibGUga2VybmVsPw0KPiANCj4gU3RhYmxlIGtlcm5lbCBtYWludGFp
bmVyIHdhbnRzIHRvIGtub3cNCj4gICAtIElzIHRoaXMga2VybmVsIHN0YWJsZSBlbm91Z2ggdG8g
cmVsZWFzZT8NCj4gDQo+IEtlcm5lbCAvIHN1YnN5c3RlbSBtYWludGFpbmVyIHdhbnRzIHRvIGtu
b3cNCj4gICAtIElzIG15IGNvZGUvc3Vic3lzdGVtIGJlaW5nIHRlc3RlZD8gIEhvdyBtdWNoIGNv
dmVyYWdlPw0KPiAgIC0gSXMgdGhlIGtlcm5lbCBzaXplIGdyb3dpbmc/ICBXaHk/ICBXaGljaCBz
dWJzeXN0ZW1zDQo+ICAgLSBJcyBib290IHRpbWUgLyB0ZXN0IGV4ZWN1dGlvbiB0aW1lIGluY3Jl
YXNpbmcvZGVjcmVhc2luZz8gIFdoYXQgYXJlIHRoZQ0KPiBoaXN0b3JpY2FsIHRyZW5kcz8NCj4g
DQoNCg==
