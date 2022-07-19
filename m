Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E81C04;
	Tue, 19 Jul 2022 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1658235699;
	bh=rSZaouvNalY70zAOvYVWnldNuRr56OQf9XJqBtUZ6OQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HB8CSDKGufMsx2hlTR1k3uuMe5fbfLbASQdALNgHT4IFMYoSbxqlqjDg3uZhgALVH
	 ccUiQLwFdRoPHm2lsW5Kyo5B1feJ6iYY5CJOtlis6xzSatZKAEtjkaoP5mECwDDnxY
	 hCnfisEagogkG0V4D/FddorZq9ifRSyTq7blHcRs=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 521F7128692C;
	Tue, 19 Jul 2022 09:01:39 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wa6xdPcYGCBw; Tue, 19 Jul 2022 09:01:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1658235699;
	bh=rSZaouvNalY70zAOvYVWnldNuRr56OQf9XJqBtUZ6OQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HB8CSDKGufMsx2hlTR1k3uuMe5fbfLbASQdALNgHT4IFMYoSbxqlqjDg3uZhgALVH
	 ccUiQLwFdRoPHm2lsW5Kyo5B1feJ6iYY5CJOtlis6xzSatZKAEtjkaoP5mECwDDnxY
	 hCnfisEagogkG0V4D/FddorZq9ifRSyTq7blHcRs=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B448A1281C2B;
	Tue, 19 Jul 2022 09:01:38 -0400 (EDT)
Message-ID: <d99a81d4f725eda056722b17c8749e8b96735e75.camel@HansenPartnership.com>
Subject: Re: b4 submit ready for beta testing
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Tue, 19 Jul 2022 09:01:36 -0400
In-Reply-To: <20220718181732.GC5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
	 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
	 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
	 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
	 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
	 <20220718181732.GC5049@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2022-07-18 at 15:17 -0300, Jason Gunthorpe wrote:
> On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:
> 
> > Perhaps, but I also have other reasons to like using an empty
> > commit for this. For example, it makes it very easy to mark where
> > exactly our series starts.
> 
> It is a good point, but it is backwards to how alot of people have
> been doing things already for a long time..
> 
> Putting the commit last makes it work a lot more like the usual
> merge-commit approach to preserve the cover letter. Particularly if
> you open the branch in any of the web viewers for git, or gitk you
> get a very nice view of the cover letter explaining the branch
> followed by the usual code in reverse patch order.
> 
> It would be nice to use merge commits to mark the series boundary,
> but IMHO, the tooling is poor for this.

The problem with empty commit is that a lot of the projects I
contribute to can be pains about only taking one or two commits in a
series, which means I use rebase to figure out the exactness of what
they've done and drop included commits.  I can't keep this behaviour
and work with empty commits.

James


