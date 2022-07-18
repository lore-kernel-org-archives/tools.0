Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3D2F22;
	Mon, 18 Jul 2022 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658169242; x=1689705242;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b6ev1szWqQm66NJMPMU1LxSwvIlfILu2gKHvtHSteOo=;
  b=V2Pyrmkj8s07e8jJpA8qyqZITy4/eKEhQw4f3kVIGDrifSAusorRW99i
   erm8TEb3WTPGGDCSjB/LPBEawUOghfr5TbVF7UwPTGc6u9SjPsfHuVeOt
   wTpKLbIrEdc73ARZ8Bpd4smpXss61/lVVAw3YrIlj99CAboDutiL+H1vZ
   qN9y6/uMITU6SySDs6TSus/kiuHCb9ZUUiXB87LXs0CZL8TE4dFUm0YIN
   2Kjf5bTI+aN+c4C+umJhEg8Lt5EeX18VOoacmoTQB/QtpRgGjfC2e2dBJ
   hHeS4V149R1OWMS83opJuMC4t33ik+Md8b6ZeqQS+a0OG6CN5k+WbAy0Q
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269316581"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="269316581"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="547603954"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga003.jf.intel.com with ESMTP; 18 Jul 2022 11:34:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 11:34:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 11:34:00 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Mon, 18 Jul 2022 11:34:00 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Konstantin Ryabitsev
	<konstantin@linuxfoundation.org>
CC: Conor Dooley <mail@conchuod.ie>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, "users@linux.kernel.org"
	<users@linux.kernel.org>, "tools@linux.kernel.org" <tools@linux.kernel.org>
Subject: RE: b4 submit ready for beta testing
Thread-Topic: b4 submit ready for beta testing
Thread-Index: AQHYmSCNinb/c7VF7EuEr0riPOOcz62Bh9yAgAADuwCAACExAIAABV2AgAF48ACAAbx6gP//jvIw
Date: Mon, 18 Jul 2022 18:34:00 +0000
Message-ID: <685efc725a554f008fbff3165f3e5abd@intel.com>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <d611454a-6a23-eb09-c8ec-84f1b4b49746@conchuod.ie>
 <20220717154344.jnbmklayhjgdekdu@meerkat.local>
 <20220718181435.GB5049@ziepe.ca>
In-Reply-To: <20220718181435.GB5049@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

> The empty commit scheme also lets you make multi-series branches and
> reliably share them in a way that other people can understand the
> structure.

What's the advantage of an empty commit?  Couldn't you start with a commit
that creates a "cover-letter" file in the root of the project? Then users c=
ould add
as they go along by editing and committing changes to the cover letter (nee=
d
to take care not to have a commit that touches both the cover letter and ot=
her
"real" files ... but I expect tools could figure out how to fix that if it =
happened).

-Tony
