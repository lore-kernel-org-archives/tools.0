Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com [216.71.150.166])
 by mx.groups.io with SMTP id smtpd.web11.10568.1585313641109444605
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 05:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microchiptechnology.onmicrosoft.com header.s=selector2-microchiptechnology-onmicrosoft-com header.b=VmkfFbQ2;
 spf=pass (domain: microchip.com, ip: 216.71.150.166, mailfrom: ludovic.desroches@microchip.com)
IronPort-SDR: I9vLhdMsemRi+ycFrWMJXohiDv8T/qogxzcD0bo5oEUqWQ7l6fD4SB8ALXwiz/I4FIl0mTa4rL
 SY7i3UROcznd6KPFgcjQo2eWt1EAoIn0cSd6JGXdQdBsp9s1p6bj6tsvP0G89NdZsbnX++mrH1
 sUqNV6SpH0w4yuogcMNAMfdjFHD//gl9n1OwFG8PiyVWbd83bbmktekEYBZwXnxIIB1rYiRY20
 3LkByLt4OsdGbk0KZDsoVEqA1PUqnCHOO4uh2IgHWKr0F9YnRYHz2hYF4d6GvYJqtliDMfqfGd
 oI8=
X-IronPort-AV: E=Sophos;i="5.72,312,1580799600"; 
   d="scan'208";a="70485423"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Mar 2020 05:53:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Mar 2020 05:53:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 27 Mar 2020 05:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nag+foCzh4/T8btQQ7o7ivkTpShjCkKHL8rucMiKQwlSGI0IRX/wnWTa9r790xGSfY5QVnC1ZrI57Z1WvAx4kbNlEDdbDIVtBAtcvC2GGAJ0niVkdDPnI/GLoAfSH2HPigQyPlFwN+OVVQo+o6n2VCHQhOKJejOpB4gmz4zauUCuRtWPsjosnqvWvCkyqcd91trQrSvAGLnKw7JnOsmLVmfvTRljCDGe3BNIuANoEYWnC2gGsVp0fUy22PtRvylYponi9f1avxfCOPubk9T+dyhtmZ3R9p3OoJSavXvZkNhsfy/j3xU/sKpCm3x2iIq/W0ro3L9tjOZgE5BMT3HvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x89UZoYqVRdj6Wui71Czy0HdJWpErGXveR0fJ/RPr+M=;
 b=GG24zWSXcEDBVccWKRsM6bwXNyOw8MIYfN2jdcytCgx66N1zu4Rz8LgpN28hXiDJuAXy9i6HHZ8FeuRDZicHVKXSfvTQfhfqOeVXrpS0JEQRmxK4Ocx3L11wQ5k+vk75Myu1jyN1mtXkn2I/alp2JoBiAIEDep2IgEhpePP22y4xlGhrPB19qkCvMsVf8YjmidCLmBcOUYVxrg/DvdugkHPKXZh92gJf74hkrer6kPEgjbisneGixIZcdCKVR3+Po0SOUXFgA0Q5ubxrIT+mHC5WSKNQMnfGbdjpYk0B04JrJfLTj1E3pDuc1fZL0bBcakBafHFFVfLuDA2yv8gwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x89UZoYqVRdj6Wui71Czy0HdJWpErGXveR0fJ/RPr+M=;
 b=VmkfFbQ2YtzYImqll5/vendIUaZE5ajpSfbYT+wRTFppW6CVmZquDgmKAA3DsEvlB94F78RKIE/M/5pEqvIEqFE8A5vHx9sXM2wo/LV50e6SHkfmAgJZ8iPOsMM7wUP8j0tpVLIrMKTYE00ETh+5Che+XiacX/HsSsVN8NZAaOM=
Received: from DM6PR11MB2777.namprd11.prod.outlook.com (2603:10b6:5:bf::31) by
 DM6PR11MB2555.namprd11.prod.outlook.com (2603:10b6:5:c5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 12:53:57 +0000
Received: from DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::3903:ed89:1141:fca6]) by DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::3903:ed89:1141:fca6%5]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 12:53:57 +0000
From: "Ludovic Desroches" <ludovic.desroches@microchip.com>
To: <jgg@ziepe.ca>, <konstantin@linuxfoundation.org>
CC: <users@linux.kernel.org>, <tools@linux.kernel.org>
Subject: Re: [kernel.org users] B4 and gmail integration features
Thread-Topic: [kernel.org users] B4 and gmail integration features
Thread-Index: AQHV/wDvFJeEL++wMEOUuuvlIbtxq6hWG7YAgAZT4QA=
Date: Fri, 27 Mar 2020 12:53:57 +0000
Message-ID: <9d4c04a2-be5c-2fad-2513-dc2bcc052f3d@microchip.com>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
 <20200323121620.GX20941@ziepe.ca>
In-Reply-To: <20200323121620.GX20941@ziepe.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ludovic.Desroches@microchip.com; 
x-originating-ip: [92.150.97.227]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c6cbeac-ee2e-4724-febd-08d7d24dea26
x-ms-traffictypediagnostic: DM6PR11MB2555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB25552454ED6977A0010C83E0EFCC0@DM6PR11MB2555.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(376002)(396003)(366004)(39860400002)(966005)(54906003)(66446008)(4326008)(110136005)(91956017)(186003)(8676002)(8936002)(66476007)(76116006)(66946007)(478600001)(31696002)(26005)(31686004)(86362001)(64756008)(66556008)(316002)(53546011)(6486002)(36756003)(5660300002)(81166006)(6506007)(2616005)(71200400001)(81156014)(6512007)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB2555;H:DM6PR11MB2777.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a/Mt9coPSHQ2Ltm9OsqmWWR6tT/9jYDydX6dlS/hci7Fhjrc7Yn/uzfynVc7lpcuF62Oiq0x3W5FfCBv/CrxMF7fBodksrMaMNHXelKIKw+dIvzX+6fORwzSh6Vol7isu/8pauk2uZC8ombTc6s5fKef4W3nWtfkH2ILTjHZaGTWqnkifgztP1GcO3OqHSBBhIOQdgelJB2gZCVRU7hP8u45q+Tm7U1NMZzocue+150x5pzyTLm7Mrw9lQwmPiopJyEPsZ+n9e63M3MIWb68owITXXeuYhKNeQyEXg+E8aZEtjjEX3TIi01iHWBOjsK3eD+Uq+YaqYgQenZtyV/j/7WmhrkNoR6pmG+bQPBmvAGWRMIVMC4xygZxA6DM2gbt2O7BMHbSXRolZPKMDwEIsWU8AIo1rucKgx2wCzXLlzM592vB20Pafvj3yjm5vZVHmwfF8Xle42G58RBREsu92zA1RPPhmxoCLXfdeIxK81+cWCUmUV8MVBrVzDloYiHf96vxNQrayRXJ0PijsNcaNg==
x-ms-exchange-antispam-messagedata: T2raqN2F55fQHohDmwnK24fqTn1ElfvS7u6Qifyzw0jItLTkfaTzzYTzL6TPA+a0TVRJyUvLLWTJW+AiK9l8KP++/JVwh9Z4nqwkbL03xboNMGsKLC5WqMn/74AlII/l6/YsV+JZSjqjXjHrIQm2wQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6cbeac-ee2e-4724-febd-08d7d24dea26
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 12:53:57.7454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGOiOyUa+BG9nTNCeZyk3YI2KC8BVsY/Yo01ptOjZrUHvi6N0m9fW1hd3IOt1K62k6APTCL1Afk/QWm8X6VWyt6mc4Hi9WwhbdIPNH/+Myk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2555
Return-Path: Ludovic.Desroches@microchip.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <728CBFC43D4DEE47980D281B04B21DFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMy8yMy8yMDIwIDE6MTYgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAw
NTo0NTozMlBNIC0wNDAwLCBLb25zdGFudGluIFJ5YWJpdHNldiB3cm90ZToNCj4+IEhpLCBhbGw6
DQo+Pg0KPj4gRm9yIG15IG5leHQgQjQgdHJpY2ssIEkgcGxhbiB0byBhZGQgc29tZSBiYXNpYyBn
bWFpbCBpbnRlZ3JhdGlvbiAtLQ0KPj4gc2luY2UgSSBrbm93IG1hbnkgb2YgeW91IGRvIHVzZSBn
bWFpbC4NCj4gDQo+IEZXSVcsIEkndmUgZG9uZSBzb21lIHdvcmsgb24gdGhpcyBoZXJlIHRvIGF2
b2lkIHRoZSAnT0FVVEggQXBvY2FseXBzZScNCj4gdGhhdCBpcyBjb21pbmcuIFlvdSBtYXkgZmlu
ZCB0aGUgb2F1dGggY29kZSBoZWxwZnVsOg0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL2pndW50
aG9ycGUvY2xvdWRfbWRpcl9zeW5jDQoNClRoYW5rcyBhIGxvdCBmb3IgdGhpcyB0b29sLiBXZSBo
YXZlIGFuIEV4Y2hhbmdlIHNlcnZlciB3aXRoIElNQVAgc3VwcG9ydCANCmRpc2FibGVkIHJlY2Vu
dGx5LiBJdCBoYXMgYnJva2VuIG15IG1haWwgd29ya2Zsb3cuDQoNCkkgZGlkbid0IHBsYXkgbXVj
aCB5ZXQgd2l0aCB5b3VyIHRvb2wgYnV0IGZpcnN0IHRlc3RzIGFyZSBlbmNvdXJhZ2luZyB0byAN
CmJlIGFibGUgdG8gdXNlIG5vdG11Y2ggYW5kIG11dHQgYWdhaW4uDQoNClJlZ2FyZHMNCg0KTHVk
b3ZpYw0KDQo+IA0KPiBHZXR0aW5nIGFuIG9hdXRoIGFwcGxpY2F0aW9uIGZyb20gR29vZ2xlIGlz
IGEgYml0IGhhcmQgdW5mb3J0dW5hdGVseS4NCj4gDQo+PiAzLiBPcHRpb25hbGx5LCBhbHNvIHNl
bmQgYSAidGhhbmtzLCBhcHBsaWVkIiB0ZW1wbGF0ZWQgcmVwbHkgYWZ0ZXIgeW91DQo+PiAgICAg
ZG8gImI0IGFtIg0KPj4NCj4+ICgjMyB3aWxsIGFsc28gYmUgYXZhaWxhYmxlIGlmIHdlIGZpbmQg
YSBzZW5kZW1haWwuc210cHNlcnZlci4pDQo+IA0KPiBJZiB5b3UgaGF2ZSBhIGdtYWlsIGNyZWRl
bnRpYWwgdGhlbiBzZW5kIGVtYWlsIGNhbiBiZSBkb25lIG92ZXIgUkVTVA0KPiB0b28uDQo+IA0K
PiBJIHdvdWxkIHNlY29uZCB3aGF0IG90aGVyIHBlb3BsZSBzYXksIG15IHVzdWFsIHdvcmsgZmxv
dyBpcyB0byBhcHBseQ0KPiB0byBnZXQsIGV2YWx1YXRlIGFuZCB0aGVuIGFjayB0aGUgbWVzc2Fn
ZXMuIFRvZGF5IEkgaGF2ZSBhIHNtYWxsDQo+IHNjcmlwdCB0byBvcGVuIHRoZSB0aHJlYWQgY292
ZXJpbmcgdGhlIHBhdGNoZXMgaW4gZ2l0IGluIE11dHQgc28gSSBjYW4NCj4gZmlkZGxlIGFzIEkg
bGlrZS4NCj4gDQo+IFdvdWxkIGVuam95IGEgYjQgY29tbWFuZCB0byBtYXJrIGdpdCBjb21taXRz
IGFzIGFwcGxpZWQgaW4gcGF0Y2h3b3Jrcw0KPiBiYXNlZCBvbiB0aGVpciBMaW5rOiBoZWFkZXIg
OikNCj4gDQo+IEphc29uDQo+IA0KPiANCj4gDQo+IA0KDQo=
