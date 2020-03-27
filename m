Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com [216.71.150.166])
 by mx.groups.io with SMTP id smtpd.web12.11579.1585316082490855836
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 06:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microchiptechnology.onmicrosoft.com header.s=selector2-microchiptechnology-onmicrosoft-com header.b=M6xtSJ77;
 spf=pass (domain: microchip.com, ip: 216.71.150.166, mailfrom: ludovic.desroches@microchip.com)
IronPort-SDR: O2i0teYZa+4q+rnTdazvNFQ4cMkUhYAQQDECq49mSW4g2MSaoPnuKVkvWSvuWiYC0EdJ8IUG4g
 ftMlDgwkWsS6AuyNJbsHNSVKyhi4/jMX/SSFVyH6/3ZNQBTiVYFpC9mjAmcFKEjARiwct/QXX+
 62sEfTEcWt2FZ05UUj/jhCc2TNmMu3yV5h4wuPvbL7CedgVL3Pp6ZrMXS89hqSuFANfIBXJ5MQ
 Zv1/2jYd8fX/myca0ONhSSr7Ggoxq3wVYyJCNAxJoW3CDnbAS9Oyi471pNHBPFAbp0jKCMLbwg
 CBI=
X-IronPort-AV: E=Sophos;i="5.72,312,1580799600"; 
   d="scan'208";a="70492373"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Mar 2020 06:34:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Mar 2020 06:34:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 27 Mar 2020 06:34:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEZxhVw5ZLX/spGXanzLDoomSDxkpFP92fb4/1fe+K1LERrOJ2E70sDoTZxmADZwEDNKqjcbPf2M5veEiOMzy1AwW6xBgWLuyEAp+i9XPm29nJia0Xn88IfUX4CuIYagYAVEdk3NjFrNw2RLSxa70F7CMgk9k/YNEC0A/TkX235+CeNUKZe5Qlscc3QbWdBoTR0MM8mAEokZEPsMF/RcIKnnMLgu0OY9rPoST55I0YYiAUpGEtDFQf9O9aNcmIVLgl1EhVwjj6wtBLixYM+RIdLucIDT9lwndca9Si9IPH0moBYSgdUDAS03de3HMtTYsASXGuU+ykt4/u25b8KiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D5ZzsKkB84CoYOAdZIQSWyLIq74TMcgdWTG/Wz/Idc=;
 b=WxhmMXdKnVc1S9VpQhYZMOvYAjeJR3ooBcxLepprRTucDiHSNTLB9LzJHfoyqTJm1ImqkyD0K34p7nRq0s3PtDojn5FmR9/OSDeA/Nu5O8CfMsEU6pYfDPYoY585f6KlNanZY5v0Gfkj/YTpd0RZTlV95Fd0AquKpYEmT031yLT0FxpBrqWTpUdNCrGGRaNuOkGgkCjwxa/lMwO577aY+Wi1el2ylRmKN4WtbmQlrNZXWXr6QAFGAOMrorBQlGUj2zdjNzRntAF7lu5l/VqcRhtqPFegXdV7s0hz6e+xV80WgUoShXu8jWeTFesrQKTZSRZ7M3aumYkT94EfoLXzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D5ZzsKkB84CoYOAdZIQSWyLIq74TMcgdWTG/Wz/Idc=;
 b=M6xtSJ77o2vBXg8RdOz9Y5f7YOfzfBfCaVBLBMDKqpNqKEh1Kxyy2WzynnSJCZUkBR+t4XpT8mcV0I767CG3d7NYGb6CBZopc9hcHA8C47LddyNBpP/sXZ8wfCwjQzWbHww/2nQ5BxXHrM5hCrxyDfH2MF5ZN6+AVvA7K4ES7/U=
Received: from DM6PR11MB2777.namprd11.prod.outlook.com (2603:10b6:5:bf::31) by
 DM6PR11MB3737.namprd11.prod.outlook.com (2603:10b6:5:144::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 13:34:39 +0000
Received: from DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::3903:ed89:1141:fca6]) by DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::3903:ed89:1141:fca6%5]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 13:34:39 +0000
From: "Ludovic Desroches" <ludovic.desroches@microchip.com>
To: <jgg@ziepe.ca>
CC: <konstantin@linuxfoundation.org>, <users@linux.kernel.org>,
	<tools@linux.kernel.org>
Subject: Re: [kernel.org users] B4 and gmail integration features
Thread-Topic: [kernel.org users] B4 and gmail integration features
Thread-Index: AQHV/wDvFJeEL++wMEOUuuvlIbtxq6hWG7YAgAZT4QCAAAW8AIAABaKA
Date: Fri, 27 Mar 2020 13:34:39 +0000
Message-ID: <93abb185-edc7-6edb-11e8-a1bd0b2b6bbe@microchip.com>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
 <20200323121620.GX20941@ziepe.ca>
 <9d4c04a2-be5c-2fad-2513-dc2bcc052f3d@microchip.com>
 <20200327131438.GU20941@ziepe.ca>
In-Reply-To: <20200327131438.GU20941@ziepe.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ludovic.Desroches@microchip.com; 
x-originating-ip: [92.150.97.227]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbd910cc-9cf0-44ac-d719-08d7d2539945
x-ms-traffictypediagnostic: DM6PR11MB3737:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB373752DBDBEB72F7D07EB9E5EFCC0@DM6PR11MB3737.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(346002)(136003)(396003)(376002)(4326008)(66476007)(66556008)(64756008)(86362001)(71200400001)(66946007)(316002)(81166006)(186003)(81156014)(31686004)(76116006)(6486002)(54906003)(53546011)(8936002)(36756003)(6512007)(66446008)(5660300002)(91956017)(6506007)(2616005)(2906002)(478600001)(6916009)(31696002)(8676002)(966005)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB3737;H:DM6PR11MB2777.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: il/Dsa6LmQcYBST/zDxXlFV45YG5Oh3CzovRj+KNSIKZRJ3xX+29ZpXKetcERm3nZNGHZZZD0mjyRjRgpSp+X2mmCvGegH/u5ZW2zutoUBILedVyvi4EO2oDjnaf5SQlCdThmd/QJlm1s6aUZGR8XbOOe1RnMo5SF5kPZNnuyhbKygoD3P5dneTyaXY5lPcirieut1lRWvqE5ZIrf+OiUda5/Q/wJSAQ4DxInSwaxyjor6KRc7GjR62PtELoUlgQ4YWYGuRRdYGs207WoSql564MNZMlw98cMsZrsuJRQxKnkCTTKsoII6Crevj5H84uurYs3p/GwZNRaZTacFXkXO7bLVLM2nFGNzpyv3Wd7a2YOUB3Y+3OvXthP2EIhPYYxdBHqr5XLUjdAlM2Upkx6Vq48B3zKwvxWXAyGSvF0Twydhme+EZg9qhbw255uQrw6eQlkur7sm+oQ6bL/P0/H2EuStNHE1iNmdUojteP4R7vCrqTP0XY7mK8ePhZtYlzLdfe0OO5rC/jR9zFLG8w6g==
x-ms-exchange-antispam-messagedata: Y9seF66VTHLqleYY9pc7XVtftDBhqgN90/r9/qx7i+SsSRATwFTuU2pqCftAmU64Rr447hro2Wk89ZgOXrWwSzr1Adq6LGtympWCM6+DDISiBPThCY0avAo575YluQ/KKlK24n7H0pQ8Qi64MoGpqg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd910cc-9cf0-44ac-d719-08d7d2539945
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 13:34:39.0754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VyillQsPKzR67dxRlk0WGbwdVb+txcBer/79G06NaC+H2KsF1GibgVq0WgWk89ONtIIY6snx63MbwjxL0VFiVunn9jwcOIrTgcxGNl1xaRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3737
Return-Path: Ludovic.Desroches@microchip.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <47B734E35BA0CC4385DA67BACEBFC640@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMy8yNy8yMDIwIDI6MTQgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAx
Mjo1Mzo1N1BNICswMDAwLCBMdWRvdmljLkRlc3JvY2hlc0BtaWNyb2NoaXAuY29tIHdyb3RlOg0K
Pj4gT24gMy8yMy8yMDIwIDE6MTYgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4+PiBPbiBG
cmksIE1hciAyMCwgMjAyMCBhdCAwNTo0NTozMlBNIC0wNDAwLCBLb25zdGFudGluIFJ5YWJpdHNl
diB3cm90ZToNCj4+Pj4gSGksIGFsbDoNCj4+Pj4NCj4+Pj4gRm9yIG15IG5leHQgQjQgdHJpY2ss
IEkgcGxhbiB0byBhZGQgc29tZSBiYXNpYyBnbWFpbCBpbnRlZ3JhdGlvbiAtLQ0KPj4+PiBzaW5j
ZSBJIGtub3cgbWFueSBvZiB5b3UgZG8gdXNlIGdtYWlsLg0KPj4+DQo+Pj4gRldJVywgSSd2ZSBk
b25lIHNvbWUgd29yayBvbiB0aGlzIGhlcmUgdG8gYXZvaWQgdGhlICdPQVVUSCBBcG9jYWx5cHNl
Jw0KPj4+IHRoYXQgaXMgY29taW5nLiBZb3UgbWF5IGZpbmQgdGhlIG9hdXRoIGNvZGUgaGVscGZ1
bDoNCj4+Pg0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2Nsb3VkX21kaXJfc3lu
Yw0KPj4NCj4+IFRoYW5rcyBhIGxvdCBmb3IgdGhpcyB0b29sLiBXZSBoYXZlIGFuIEV4Y2hhbmdl
IHNlcnZlciB3aXRoIElNQVAgc3VwcG9ydA0KPj4gZGlzYWJsZWQgcmVjZW50bHkuIEl0IGhhcyBi
cm9rZW4gbXkgbWFpbCB3b3JrZmxvdy4NCj4gDQo+IFllcywgd2UgYXJlIGxvb2tpbmcgdG8gYSBz
aW1pbGFyIGZ1dHVyZS4NCj4gDQo+IEkgaG9wZSBpbiBhIG1vbnRoIG9yIHNvIEkgY2FuIHNob3cg
aG93IHRvIG1ha2UgSU1BUCB3b3JrIGFnYWluIHdpdGggYW4NCj4gT0FVVEggaGVscGVyLCBidXQg
dGhpcyB0b29sIHR1cm5lZCBvdXQgd2VsbCBhbmQgaXMgbmljZXIgdGhhbiBtdXR0J3MNCj4gYnVp
bHQgaW4gSU1BUCBvciBtYnN5bmMuLg0KPiANCj4+IEkgZGlkbid0IHBsYXkgbXVjaCB5ZXQgd2l0
aCB5b3VyIHRvb2wgYnV0IGZpcnN0IHRlc3RzIGFyZSBlbmNvdXJhZ2luZyB0bw0KPj4gYmUgYWJs
ZSB0byB1c2Ugbm90bXVjaCBhbmQgbXV0dCBhZ2Fpbi4NCj4gDQo+IENvbnNpZGVyIGl0ICdiZXRh
JyBhdCB0aGUgbW9tZW1lbnQsIHdvdWxkIGJlIGludGVyZXN0ZWQgaW4gZmVlZGJhY2sNCg0KU3Vy
ZS4gSSBhbHJlYWR5IGhhdmUgb25lIHF1ZXN0aW9uLiBJIG5vdGljZWQgdGhhdCBpZiBJIHJlbW92
ZSBhIG1haWwgDQpmcm9tIHRoZSBzZXJ2ZXIsIGl0IGlzIGFsc28gcmVtb3ZlZCBsb2NhbGx5LiBU
aGF0J3MgZ29vZCBhcyBJIGRlYWwgd2l0aCANCm15IG1haWxzIG9uIHR3byBjb21wdXRlcnMuIEkg
d29uZGVyIGhvdyBpdCB3aWxsIGJlaGF2ZSB3aXRoIGVtYWlsIA0KcmV0ZW50aW9uPyBJIGZlYXIg
aXQgcmVtb3ZlcyB0aGUgbWFpbHMgZnJvbSBteSBsb2NhbCBtYWlsZGlyLi4uDQoNClJlZ2FyZHMN
Cg0KTHVkb3ZpYw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBKYXNvbg0KPiANCg0K
