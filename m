Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2127.outbound.protection.outlook.com [40.107.239.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DBC19BB4
	for <tools@linux.kernel.org>; Wed,  9 Aug 2023 15:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP9Me3EHMXZB/qlhkRfbbKlyWmN+y6YSzbClRb7wh32MgsrQP/QTS5Losnf7Y/NlZWv+hZ4L8AKxVuORGH3RqskzKPQ1iUeNQMftZUQajyGITmoH4oR/CSSeqVR92W74PAgge0X5cb6leXddcFgjxUKj9hh8hHraGORk1hByD1h42guhFzFsNIOMvwVku3yk7XeMtscY4H+bQ+fT/iDXlLe5rSIMjiBXni2AmFscnWuxDLyHETcsG+Yait8pMJskX6YFEQuFHZGQmWR057NGbmAmpHyLgIck8KORX6667DgOwSxsnUSIsZVbgFn7Z2/tcEmo5w184ijdz1FNW8olmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5uQdaiZIVbvzZLTmLNh2ZN98Df0VBbtn3ZSv5lZSkk=;
 b=G6cZR/h76ZnS8rkDPzAZ+A7Rk4coOSF4CnfhUufXmpaiiamTuP6zqlS6SW7IL0mH7CJoQj3NULjWYkZi9NMSfw4kxcbLraZh+Ln86UFI1uXGOzfxbk5qCbN7acDx/FnlWiAO/n8gHQRsupl6GefDVH+Y1EluSIKhw50hCb9o0t5tzLfHZ/wJS6OaV4FO6d6OS5YMm+qcP1ZZGLYx3E44ya80vZxdzr/XXtTNbEDdSjMqAg/RbbdBKSmg8ePSJsi0CyfKb058Bpdg6hdDDT9kMLBoNRvVisy0bznAbLI9KZq4YQIDc4neui09++85VgVc/KNGKKtuN32wrB25CqRJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marketsdatainfousa.onmicrosoft.com; dmarc=pass action=none
 header.from=marketsdatainfousa.onmicrosoft.com; dkim=pass
 header.d=marketsdatainfousa.onmicrosoft.com; arc=none
Received: from MA0PR01MB9577.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c2::14)
 by MA0PR01MB5867.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:48::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 15:42:52 +0000
Received: from MA0PR01MB9577.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::71f:c549:39b4:bf4]) by MA0PR01MB9577.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::71f:c549:39b4:bf4%4]) with mapi id 15.20.6652.029; Wed, 9 Aug 2023
 15:42:52 +0000
From: Claire Davis <Claire.Davis@marketsdatainfousa.onmicrosoft.com>
To: "tools@linux.kernel.org" <tools@linux.kernel.org>
Subject: Re: linux Learning & Training decision makers
Thread-Topic: linux Learning & Training decision makers
Thread-Index: AQHZytgoP1A0oEn/XEmC1svjtkgDgw==
Date: Wed, 9 Aug 2023 15:42:52 +0000
Message-ID:
 <52ae0fa4-545a-88dc-3294-8ebc2314b4b1@marketsdatainfousa.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none
 header.from=marketsdatainfousa.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9577:EE_|MA0PR01MB5867:EE_
x-ms-office365-filtering-correlation-id: 1221256f-19e0-4fd5-3627-08db98ef4aff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 963ouDciIug/z40e+Jfue17XlbXHNXBjRLe9uB+hz3gHK3tw/05hanHtfhBlwjPGrBcVAMjTj8jxg05nFt6PUyH2zRVO3FREdrs7urX1EavJC9+fQ0oIUWSOJ4tSP6EBuxvd0H1KMwD79LxuJ1UiHXk/8WuhZq7VcaqIrOKl9YF0qHAxWE3qWOuKuURh6nrhIuxK6SplIPirEBDxoKmRWkNuXq5WC7HpQe1k0djHBZvNxF3PrYpTmPtvWPEg2WVwzMIWhspBdqD7pwtdya01jYB2V26cw/+WuWxu5Z2/irmAb5Z3hP+wX1mCcbRCNBNiXMsC/6ssERi2sjzntdX0fcwJDaOtdQtAIjz5ztQ5Z/0qhi/8LO1cB/KEaNFju46ksFq+Fp3grejWbMmNb0m0auT4e/XVxLdwKU4PBV3YjUVnoVPTFhi8gTvrdXwKHpPl+jvZolazPBc2qsw3MM4RZWvCxXZQ88dFdaZ/IFw3fjM7llTqBqVaQIUP/IWpnG4L+2pvoZwS3p4reMj2SERp/QsW8AVKQu1E7tBpOP1alvDjYzhtJLVSQFhzAEKh4EWntQR6cK39HZK4aqIRh4jD+fFyQ9StorRljcr3PPPKW/kSjBU2/CIP3KnV4NdR5RFwpu43YFeIHMI5xtopu7wrjGIb/lh0NZmff/6OhrHft40HsUbnoTMROHnIbTa5SzEnayYiMb6qBInhdp21+sJA13aTvQoSKOTSXJzWeQeuOlelqbuEeJkZSCSSbwpiUDe+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9577.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(136003)(366004)(346002)(396003)(451199021)(186006)(1800799006)(6512007)(6506007)(66899021)(66556008)(76116006)(38070700005)(38100700002)(86362001)(5660300002)(64756008)(8676002)(31696002)(2906002)(6916009)(66476007)(316002)(66446008)(41300700001)(66946007)(8936002)(71200400001)(122000001)(478600001)(6486002)(2616005)(31686004)(83380400001)(13220200016)(437434003)(581174003)(6396002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGMwY0F2L1ZyTlZTTHpuZ3pkT2I2bHNTS3FCOG5zSGR2NEE3U0xaUDdEbCtL?=
 =?utf-8?B?UmJiODhkNjVJUHJ0NnRKMFRGZ244RVd3OXNFbk9POGVmdWhMWnpYdnNGcjJB?=
 =?utf-8?B?WHZPZFB0RG9USjJmUHlkdkMydHloT0RFb0NxY3lkWlFLSG1UeC9zRWlsV2pM?=
 =?utf-8?B?MWVqeVdoc09jbEFxZEdyR2lLeHF1SmxVUGszeEJSRWNlb2JNcmZuRU50Nmxr?=
 =?utf-8?B?bWQrRWhVeVllVW00emFPaUVDZnZLOHY3S2RudkNWTXB4T3ZRK09tS1pOdldE?=
 =?utf-8?B?WlNINGgraTQ5ekZaM3o5c2hKbU13a0xuSGk0QnJQNmxCdVZrZWwyd05uV3ZO?=
 =?utf-8?B?QlhCV3R4SHRpOVdCREQ1RXJEVXZrMmVGZTJDaDUzOWJXS0V0MWt0cVRIUHdT?=
 =?utf-8?B?Rzl1RlZiUEluZnFCQXByUFFxUnArZFdIMzhJYm5KNStnVzd1UWkvWTVlZUFR?=
 =?utf-8?B?VFpHbVNLU1pLSk01US91MnRXa2NQSmdsTHZ0UlNmUkhHVUVhTXUxQTRuMTFB?=
 =?utf-8?B?OFVZNC9MaEE1ZzVxYW1nbTl6MWdoSnBlZVM1SzRybzRudzlYQ1YvQWFPVURw?=
 =?utf-8?B?WlNzakF3T1R0NmNmZ3FJZFpyQ0Y2Ui9PRkRpRkRMOXpGR2RNZGIxR0VHM2g1?=
 =?utf-8?B?QmJmdGdKTkNCc1liYXhPMlk5M1BPM3k5alVzSldmS3lLSTgxaFNFWmVRUS85?=
 =?utf-8?B?dFdMYzYzeWhSRTErTXJiTjdjclBoeXhxM1g3cTc3UkcxeWZlTnhBSTdBdnZW?=
 =?utf-8?B?WkYyQXc5SGw2MHZJUlpqMEJaQ0VGWkg5cjNqSmV0enkwRkI5ZlRTU3J0MElZ?=
 =?utf-8?B?MGRDYnZMZUJxR0xkWFlzLzlCRHRReTd4bG9oVjVtZVlzei92VnArdHM3S090?=
 =?utf-8?B?RXpURGFsNVFXUm9oanFYYWFaLzYvR2dYYzhGQmFIUnhUQ2EyeCtCZ3R2Wmw0?=
 =?utf-8?B?aHd1N0tTdS92WGZCbjcwQm0wSnI0S1F1cFRnYkRXRGVyUEZERlBtTVZ5bFF1?=
 =?utf-8?B?OFNDY0UxaTFNT3NGaGczaEV6RUtxSnhUbVlaalk3Y2pydk5ROFhmaXhlSWlT?=
 =?utf-8?B?ajR5cmsrNy9GQzU2ZW5YQld5V1ljZnlVeGZPUGlUbFR4U3NLekY3TGJsc2xk?=
 =?utf-8?B?Q0pFNE93ejR6WHcrd3I0aGJEWCt5ZGQvako0WUMxY2ZPZ1gyYlZJeC8vUWxv?=
 =?utf-8?B?dStLdUZRRXViR2JLaHo1aTZLOEJMSXdHK2JyY2xvbEg4cVZiQWR2dGVWYThP?=
 =?utf-8?B?aWFwRDhNRWVyWW8vaUpNcVFKeHFDbjc2UTc0Sk9XL1p4ODFTZHB4R1NLQ21G?=
 =?utf-8?B?RkRLVFpwYlVVQXdOQnJIY00wZHo3VUhGU1RiR3NMN3dnSDB6ckxuZFBZNzU5?=
 =?utf-8?B?Z3dFRCtxVnZiU2F3MWZSd2hsVWhlbHlNK3V3OXZzWjN1TXIyODRuenBzNGkr?=
 =?utf-8?B?akxScVFFblhoM2FOWExERXFGTlJWVmxoYm5HMVFwSDBNeUZzWGZWSlg1ekZY?=
 =?utf-8?B?cmQ1Ri85ZXVjcTEyQlUwSmh2T1dMY3lrWEdHV3VtRisyVnVoNllFUUdWQ08y?=
 =?utf-8?B?ZWNyaGt1TS9FdkJoUFRWclhTMUs1RnIwWnBKMTFZalAvK1JKWEFXdzlkYjd1?=
 =?utf-8?B?ZTA2VTQ5UTZ1dytjNGE5NW5iQ2xtNWFXNkQyUXA2dG5sdGVuamZVVm5CNkhZ?=
 =?utf-8?B?a2dENTNKenFaSlNGOFl4S3lXVE5naXdjZkh3OGdQZ1J0RE9DREVSMUpWQW5M?=
 =?utf-8?B?Wko0eGxIamFJZXpWZGoreHg1a0Z2MDZoeUczWFcrQmhpZkpYZkRVallBeldY?=
 =?utf-8?B?eHJseE5OY2VPM082T096SDdaWElTc1ZGTW1zaUNNT0IvY1FXRGVZbVlMcGxi?=
 =?utf-8?B?ME1hanpPSWZYTk4weG9iKzBhb3NmNXA0NFJvSXlHbEpoSGMxR05xTmNucWNJ?=
 =?utf-8?B?TzFrTEFIR1RxUzF1WGZ5RGhCMHNEQWk3Ymg3TWNpeFUwR3g0MGVtVzcyQ2ZG?=
 =?utf-8?B?Y08zZnZBbld4TnNKOFNzc1l3eHRNL0FGMUtUVmNuTGsrVG1pT2FJa3RLSTlk?=
 =?utf-8?B?VHgweXQ5dXhVZExkUjM4b1lFTTY2VzJ6ckhzK1dWazhuY1lPVHlGeFdaeTZt?=
 =?utf-8?B?K1VRN2RmZDlvTUhqeXBnelJnWWV3TVR0a2lRREkzMzFubkFaQkVQcTl6OGU4?=
 =?utf-8?B?MGlRSDlpNEtuU1pQRkQ5MXBFaTlGUkNxYUgwWnpoM0EvQzNYSEdBUUV2REkx?=
 =?utf-8?B?akFRblRVenRBbHNzYWNQME13M0FoWEwvUnJadkV5NEkrQmRtd2ZsSVN4Ny9P?=
 =?utf-8?Q?ugICsDBbX227V1cKeW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30326BC0ADCEEB45AE29ADB5BE247A52@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marketsdatainfousa.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9577.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1221256f-19e0-4fd5-3627-08db98ef4aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 15:42:52.5578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 62dfda68-9244-4547-9a56-5a49125b28f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OO7hqIEdFQi2gGQMEN6cGfifLj+X+Xstit3zj0Vs0s0NzuBPnr+3S930NFjar7FuPV005O9AyYsnpjV06I/ijOh9Jg37DNWoGeJZTjNQQLKmwBlUERsRrKx2atlCEMKPZzQSScTGeeSoo8QwBToXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5867

SGksDQoNCkp1c3Qgd2FudGVkIHRvIG1ha2Ugc3VyZSB5b3UgcmVjZWl2ZWQgbXkgbGFzdCBlbWFp
bCByZWdhcmRpbmcgYSANCmN1c3RvbWl6ZWQgbGlzdCBvZiBMZWFybmluZywgVHJhaW5pbmcsIFRh
bGVudCBEZXZlbG9wbWVudCwgQ29ycG9yYXRlIA0KVHJhaW5pbmcgZXRjIGNvbnRhY3RzLiBJ4oCZ
bSBsb29raW5nIHRvIGZpbmQgdGhlIHJpZ2h0IHBlcnNvbiB3aG8gbG9va3MgDQphZnRlciB5b3Vy
IHByb3NwZWN0aW5nIGFuZCBsZWFkIGdlbmVyYXRpb24uDQoNCldlIGhlbHAgY29tcGFuaWVzIGdy
b3cgc2FsZXMgd2l0aCBvdXIgaGlnaGx5IHRhcmdldGVkIGVtYWlsIGxpc3RzLg0KDQpQbGVhc2Ug
bGV0IHVzIGtub3cgeW91ciB0YXJnZXQgaW5kdXN0cmllcyBhbmQgam9iIHRpdGxlcyBzbyB3ZSBj
YW4gc2VuZCANCnlvdSB0aGUgbnVtYmVycyBvZiBjb250YWN0cy4NCg0KUmVnYXJkcywNCkNsYWly
ZQ0KDQpPbiBUdWUsIDI3LTA2LTIwMjMgMTE6NDMgQU0sICJDbGFpcmUgRGF2aXMiIHdyb3RlOg0K
DQpIaSwNCg0KV291bGQgeW91IGJlIGludGVyZXN0ZWQgaW4gcmVhY2hpbmcgb3V0IHRvIHRvcCBs
ZXZlbCBkZWNpc2lvbnMgbWFrZXJzIHRvIA0KcHJvbW90ZS9zZWxsIHlvdXIgc2VydmljZXM/DQoN
CkxlYXJuaW5nL1RyYWluaW5nL1RhbGVudCBEZXZlbG9wbWVudA0KQ1ZEIEh1bWFuIFJlc291cmNl
DQpDVkQgTGVhcm5pbmcNCkNvcnBvcmF0ZSBUcmFpbmluZw0KTWVldGluZyAmIEV2ZW50cw0KT3du
ZXJzLCBDRU8sIFByZXNpZGVudHMgZXRjDQoNCldlIHdvdWxkIGJlIGhhcHB5IHRvIGN1c3RvbWl6
ZSB5b3VyIGxpc3QgYWNjb3JkaW5nbHkgZm9yIGFueSBvdGhlciANCnJlcXVpcmVtZW50cyB0aGF0
IHlvdSBoYXZlLg0KDQpJbmR1c3RyaWVzOg0KSW5mb3JtYXRpb24gVGVjaG5vbG9neSB8RmluYW5j
ZSB8QWR2ZXJ0aXNpbmcgJiBNYXJrZXRpbmcgfENvbnN0cnVjdGlvbiANCmFuZCBSZWFsIGVzdGF0
ZSB8Q2hhcml0eSBhbmQgTkdP4oCZcyB8RWR1Y2F0aW9uIHxQdWJsaXNoaW5nIHxSZXRhaWwgfCAN
CkNvbnN1bWVyIHwgTWFudWZhY3R1cmluZyB8R292ZXJubWVudCAmIHB1YmxpYyBhZ2VuY2llcyB8
RWxlY3Ryb25pY3MgYW5kIA0KVGVsZWNvbW11bmljYXRpb25zIHxJbmR1c3RyeSBhc3NvY2lhdGlv
bnMgfEhlYWx0aGNhcmUgfCBIb3NwaXRhbGl0eSANCnxMZWdhbCBTZXJ2aWNlcyB8Rm9vZCAmIEJl
dmVyYWdlcyB8TWVkaWEgJiBFbnRlcnRhaW5tZW50IHxFbmVyZ3kgYW5kIA0KY2hlbWljYWxzIHxB
ZXJvc3BhY2UgYW5kIERlZmVuc2UgfFRyYW5zcG9ydGF0aW9uIGFuZCBMb2dpc3RpY3MgRVRDLg0K
DQpBcHByZWNpYXRlIHlvdXIgcmVzcG9uc2UuDQoNClJlZ2FyZHMsDQpDbGFpcmUNCg0KQ2xhaXJl
IERhdmlzIHwgTWFya2V0aW5nIENvbnN1bHRhbnQNCg0KUmVwbHkgb25seSBvcHQtb3V0IGluIHRo
ZSBzdWJqZWN0IGxpbmUgdG8gcmVtb3ZlIGZyb20gdGhlIG1haWxpbmcgbGlzdC4NCg0K
