Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2C393;
	Sat, 16 Jul 2022 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1657990528;
	bh=4x+RVGfxVzL7aXN1ja+EfGUeX8qsZXf0Ga4m5lZPEuI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dDO5BPGc5MisDqa0j9eR1x+obVgVylytw9ikey1MxBgRD65mc5h231U4+4YOZ05eF
	 HEgvqV0og/6H0qKAqwMZ56uqLK4fpvTjUTc3kFXDWXL3eoJESxm52BKp5/jSbdjpK4
	 TJaXPxRWvd04+JjDINIdKmRRdK0Km/fWeimkoCqo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B46E81280DD3;
	Sat, 16 Jul 2022 12:55:28 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-DRLReiKd10; Sat, 16 Jul 2022 12:55:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1657990528;
	bh=4x+RVGfxVzL7aXN1ja+EfGUeX8qsZXf0Ga4m5lZPEuI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dDO5BPGc5MisDqa0j9eR1x+obVgVylytw9ikey1MxBgRD65mc5h231U4+4YOZ05eF
	 HEgvqV0og/6H0qKAqwMZ56uqLK4fpvTjUTc3kFXDWXL3eoJESxm52BKp5/jSbdjpK4
	 TJaXPxRWvd04+JjDINIdKmRRdK0Km/fWeimkoCqo=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3DB8B1280DB8;
	Sat, 16 Jul 2022 12:55:28 -0400 (EDT)
Message-ID: <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
Subject: Re: b4 submit ready for beta testing
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Sat, 16 Jul 2022 12:55:26 -0400
In-Reply-To: <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
	 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
	 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sat, 2022-07-16 at 10:56 -0400, Konstantin Ryabitsev wrote:
[...]
> I hear you, but branch descriptions are confined to your local
> repository and can't be pushed to a remote.

Yes, I accept this, but:

>  So, if you work on a series, send it off, and then pick it up again
> two weeks later from a different workstation, that's no good for most
> of what b4 submit needs to do. :(

Are you so sure that's the common case.  For me, to connect to an SMTP
server, I need to be on a system running my VPN, which is only my
laptop.  Thus however much I transfer the series around for testing
etc., it always comes back to the same system for submission, so
keeping the cover letter in the branch description of that system works
just fine.

The point is you're introducing a divergence between b4 and git for
this ... are you so sure most developers submit from arbitrary systems
and that's the use case we need to optimize for even at the expense of
the incompatibility?

> So, it was either using notes (which almost everyone forgets to push
> anyway), or using an empty commit. I agree it's hurky, but it
> currently the only thing that fits in the "least likely to end up
> lost on a rebase or workstation switch" category.

I get what problem you're solving, but it isn't my problem and is never
likely to be because I'm not going to increase my attack surface by
running a VPN on anything but a single system where the TPM that holds
my cryptographic keys is.

James



