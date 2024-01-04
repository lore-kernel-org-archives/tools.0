Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A959D328A6;
	Thu,  4 Jan 2024 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbcil8kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704388541; x=1735924541;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7SXzZR1ImOSMNXvJDcmVYJr9Afh4y9729OM6FcaBTpI=;
  b=Gbcil8kcJ2X4p7DqkaAZPfdKTNx+JjOQ+LNJycNEqT8B35KB1SQ9WDt9
   SJovlr+g07mIvqBLiz2NGythI6D+H9iWj7ipsFl8z9RkD3IACPHq0905K
   I7553I015B25/EHgyandbDbBcDcN//YRvqseM9clS902nn1LgItib14ST
   ZG2+Olg2mQhrM+09nYikcU6POgbOQ5QFpZcguwC9fr0RgZNiq8LYqyVLE
   9A0yKE6WRiAHP8xN+GMjfwZJuDQLj5MlMJB4q+FgaHHJ/Dl4ZHJUFrml/
   PwYgXZaHIT/fyj/hnF4HSdpA0i/TovWKRmwnBygM7FJgtgOMpG/wy8Qxq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4411508"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4411508"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 09:14:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756684255"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="756684255"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jan 2024 09:14:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 09:14:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 09:14:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 09:14:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 09:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBAyYAevymPOxTU7Jd4d6L5ESRezfbfpBVu6qBYifxKhT1xRFORDoUACvx4aeyya/kNwp2g90OCdGD3eQ/W/LuyzD8KnMxMxwa8BsLNaDBfsN+O5bQaqfn2/aXT5bVqnCE06M3W1RdGjmoduQDaCgQJki8GJHuLRgvmL/IFEm1lUEyhKMFHypsrlebz+dKtjPv3PH/XIE3aeTrBDxvuKxwH1HSANe/+0LlvWEiirdLjpuSq59i7o3jZ2G/AhL6mjmtpXrTu4zCccKcgFdky156J6mZEJdzOuU9RljGEAuLOB3OrWciWsXNMiKnf/dRCILhltPaV0UHfMUxn30zmUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SXzZR1ImOSMNXvJDcmVYJr9Afh4y9729OM6FcaBTpI=;
 b=S7cbeSWzdOwHgMTWTsb00vfKY7RJZ+mWVpES07kyQsVVivc9baq4nhMhyoeaSsrQwMUl/ugp2fq9qhUadK5ZRoL5VUf4EDXnjN5KFvB68BAjsVdGHvoLHbiiIPIgA+iRlpPgccmK+D6XFqmrjSjS4CEGHIbzJYP/B6/UC7liCKmOS11bKbngVFrpVO3JgqCG8WMa9DE5s+UX+bkgd3D8hV8m20Qa50yaJYLTnMvuwOgel0QKd8Nuw2PjXdiohsCc8AzK7IpCq0u4jikDhrcuLsQPMhrK5jrKKtZg82PpycKGmtJRKnyazlJhU/krQel8uAkkOlX+wN2R9YF7Xttz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 17:14:00 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::a136:fb19:acde:7670]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::a136:fb19:acde:7670%6]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 17:14:00 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>, Linus Torvalds
	<torvalds@linuxfoundation.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, users <users@linux.kernel.org>,
	"tools@linux.kernel.org" <tools@linux.kernel.org>
Subject: RE: b4 modifying Cc-tags
Thread-Topic: b4 modifying Cc-tags
Thread-Index: AQHaPqjSFwZoSoY5oEyg5ZdrGtNKxLDJ5Ezg
Date: Thu, 4 Jan 2024 17:14:00 +0000
Message-ID: <SJ1PR11MB6083F54F7550AA820AE32A4DFC672@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com>
 <20240102-exuberant-glaring-dalmatian-d62bc5@lemur>
 <CAHk-=wg607GVe6NYrM6wi+ByKdVZASqHnWSOO-ij0f07b2ke1Q@mail.gmail.com>
 <20240104005556.4zxuv3qzkq66vtln@pali>
In-Reply-To: <20240104005556.4zxuv3qzkq66vtln@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ2PR11MB8472:EE_
x-ms-office365-filtering-correlation-id: 5dde258c-14e7-4268-b38c-08dc0d488b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sjQZBbIoUN7XSPTuOJZtLS16C9AFA9GxQY6uyxL2KxpvvB3vfym9QbmMxCSHYuBmfdsXjTen41ARd1/tsTEF0QA332XMAHMvR2RBoEYlrHoqvrWPvf0AfWQ1EMINesMK051LanTpkycPhBnXWil8GkVNOfA85APcIX58uD6tfxe9FK19RDJyEymS9E7Nv1VHBXNOxJKNap390KcVhcBSzwMdlLhM2/lbJqomapi5cYKO061stNXZ7myNNOdO22xMR1bY9mkoP3RhGeXDZ4o0O01ySs9R35gJ6HIBLBmUpI4e3ckepLgctKawEwiCHwUwnjYOcZz0PhKrEs4aeehHy6Kb5hlitlhU6AdgXrfi5ovNCYoVzqFtvxHWUJDB3UChWSwAg6yOA8gNa05qCIKiEwXj4kBv41FIeOI/0gcV6PSA9fVOX+1TBj/cNMbmmLU2rZqrKzzdfNiHieC/+J7AWoXbJih0Re64E0VFsCKMx4BWCC1ecDmGOXz7mKcAMwipDrHdRWgc4pvm2D4mrL1zkkle9roFUoCd/XfJHJBNuzXQr570Wgz29E8FQ/Xqm8eNMthHCcgpA1sz5DDiBPQQM7dZi32yhut0O2bYG49AES15RdmMd0rm9ozGEmPMf3R5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(55016003)(33656002)(9686003)(86362001)(6506007)(66476007)(66446008)(66556008)(66946007)(76116006)(64756008)(38070700009)(4744005)(38100700002)(82960400001)(122000001)(71200400001)(41300700001)(26005)(2906002)(478600001)(7696005)(4326008)(5660300002)(54906003)(8936002)(52536014)(8676002)(110136005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Zfy4ZxS79f6QrXJXTxIfDzDA8EMXB6K1n6oIjdIcKKvna00ksO9hxz95BP?=
 =?iso-8859-1?Q?zhqx4OXV1+QKNcwwaVmC7MI+HAFio9MXz1IDmeHnzf9PzAzVXuEqhG5Eis?=
 =?iso-8859-1?Q?fLt8hZruj4Bb3CD0E3xlHA0neRk5OY3dqYo3pLXLyMXlHDPIWxWgliG8qQ?=
 =?iso-8859-1?Q?wpMMXjADJe9hUh3AuaWPcCJ5bE4Y3+WSgzrzn0SnjDsYnT6nUXBlo7C0B1?=
 =?iso-8859-1?Q?YoGJUGFaO5xkOXW6ZyfVu0BBovuBD9r2q0ebjQPn5F5o3zbV6KqhQSTdnv?=
 =?iso-8859-1?Q?M2uy8GZMRPQ8oiOijykuEo+QT1yyAtvV/ba1uibetZm7ps9o7rVMd4EVCc?=
 =?iso-8859-1?Q?2Afc983W4NYJdzjAKcNuYF+Q/pe+30H9lx3UxDMJ67LEIJFYIJH6PpWfvt?=
 =?iso-8859-1?Q?HAb3WY708pTCGDCSPOAmN1BfHkqCYzuxWN1YEXijI8wOh9Pj9QZL1ShQrC?=
 =?iso-8859-1?Q?J4MVK8KOkb3fNPcBPXRol2RTfdpMhlgOZiwBjhG+Y+mGt8arQsAalZqnB7?=
 =?iso-8859-1?Q?CmuT7TImpvowsmgVBYQbcZa03cdYgQudBKFnDrQwr8lfk9v90NJykF5gqF?=
 =?iso-8859-1?Q?tsxNupsO/DM/WYzhf4ta5DPU2MBy/mCs5Fo+py4uvs2E2p2F7gnO7d/zEp?=
 =?iso-8859-1?Q?3vGhXGF8PNthZDqo53bv/RI2eq3e19F9hszHf7w0xkuM2MHh61sCwPi3+e?=
 =?iso-8859-1?Q?rC5ZFS12FJCWGMlgzifaFEPv889UvAzPwon470/JbosiQlYv3VsXTuIe/J?=
 =?iso-8859-1?Q?06UvjJEvB5fwOAMKUQH9Zm+MjQGF61xIypVtoO+X/bOTwcheT99jIPS51M?=
 =?iso-8859-1?Q?CUvDPcPEHXF3bIvEKMF1JvtjNqX33TS3F9PIcEng4U6v8f2TWho/d182bE?=
 =?iso-8859-1?Q?HzSrN+DchXWpZFvPDYBQeL509lVM/KNl3sVVj6hBEhA6MWNvVc5E6wcQg9?=
 =?iso-8859-1?Q?koey5GXjkuo9hKa/5Ub3WSsKL4siHvm6glLnNaqtqWQuaBl02ov0tkE6+z?=
 =?iso-8859-1?Q?00qmKuncjWk/gQOKTMgDcyisfk/4dR3iMbs8L7o5wD+84TQZA4cuecEOqF?=
 =?iso-8859-1?Q?NVRre0P0JHhCHsKVU79jUlCIMYvRGr8ReGg/Zg87u/ic1w2LizmWvq2HOz?=
 =?iso-8859-1?Q?WfPu5qxDTWAmHRZskRkgvSetDiFdtmqAyhXc/RQq0T9+h725DIPBDkaCYZ?=
 =?iso-8859-1?Q?zimvaho0PcT4hGjRV7IHbhuyj+Xd9q4QCeqQUuK5bsyFRNHfCBnRk9xhbu?=
 =?iso-8859-1?Q?DrLQIlT715EPEdSfoJhdAYzAx0p8d3gEDSGCLBWXThZRQRIH/CRWrMi/Xs?=
 =?iso-8859-1?Q?pX+KfhPo02Vmx20vHQUiS47OIB4QfHTUXky4IZbchoyql3317Dx0cN8sZP?=
 =?iso-8859-1?Q?JCMhWxQd4pBnjiTaMzKytKCU4Z91tL/iimFAjnlg0eP7xgYhzNolzkj356?=
 =?iso-8859-1?Q?ZTE4dCHCqWnbWg96zZ/gj9watzEJu2VtXucTTzRomUGzuMM5X25Ir4dfkC?=
 =?iso-8859-1?Q?c3IWc/5SADYBQqEGTzOtjkwOLyxiAVbvwQhRbNsuY9u//UG6ORX/REfe34?=
 =?iso-8859-1?Q?cO8EmrI1Nwd3KEWNjo41Pp67TSxhNYImYMvLr9Hg73rsJ5y73Bef3ODL5u?=
 =?iso-8859-1?Q?yHLwz2hQgCNuHx1ZJevvtOgOH6S1QQJZ1l?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dde258c-14e7-4268-b38c-08dc0d488b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 17:14:00.5878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQ6pj5A+jl0s3v6oCJGVfEj2hGYO6fIZahlitqLv5G+vvUkRHsIzWmtm3sJGe5pj3ewAq8HoJcfNWcodvAYG6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
X-OriginatorOrg: intel.com

> I guess that recent SMTP software would not have "line too big" issue
> and would not do rewrapping. But maybe that MS Exchange (or something
> else) was doing it...

MS Exchange from ~2012 used to swap tabs for spaces, and wrapped long lines
(where "long" was somewhere just over 100). MSFT dropped support
for that version a few years ago. Newer versions of exchange don't do this =
(so
I can apply patches that have been through Exchange).

-Tony
