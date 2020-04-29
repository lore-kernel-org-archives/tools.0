Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web12.674.1588133791617600309
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 21:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@ellerman.id.au header.s=201909 header.b=jK57+ill;
 spf=pass (domain: ellerman.id.au, ip: 203.11.71.1, mailfrom: mpe@ellerman.id.au)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 49BlZM2cPqz9sSb;
	Wed, 29 Apr 2020 14:16:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
	s=201909; t=1588133788;
	bh=oRVqCykfZ/grjqDlcnelgLQ2qglIqPc9kjOL3Ro/4AM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=jK57+illF5SMR44DWZWzs94CNlmL5sgcbuRovZvRStOVcjUtTR/UpZCVwjnYI8bCU
	 78fcnkmq64qxmOkDlwF0G8WpFc9kbJ8KqqZYaZ/Q8MrJBk7J8HJHVJ95TZvMOjYibL
	 B1Q4Ai6M0ld2NztrpP1Kq0p3KZxomY8E7CmxB9XOx0rxEz6/0x4/9eP3f6aV34MQnF
	 qcZEIQk8YddDctRYof8ktuTnc1g2LWWZ7nGMJu7ozZ42EdFj8SmNoQ9Q3PJ8L03FrB
	 SOAWCVdkfegadiZLVNhPAC77wt9KfTN5gYWCUUE8k9kj2aaN0rYQrnKNnaQGZHjGVo
	 qzWoNFxO2i5bw==
From: mpe@ellerman.id.au
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
In-Reply-To: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
Date: Wed, 29 Apr 2020 14:16:41 +1000
Message-ID: <87sggnexjq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain

"Konstantin Ryabitsev" <konstantin@linuxfoundation.org> writes:
> Hi, all:
>
> What would be a useful way to quickly do a "show me what changed" 
> between two versions of the same patch series? Especially considering 
> that:
>
> - there may be a different number of patches in the series
> - new revisions will likely be based on newer trees
> - subjects/commit messages/trailers may be vastly different between two 
>   series, even if the code is very similar (e.g. someone broke down a 
>   single large commit into several smaller ones or vice-versa)
>
> In my mind, the best way to approach this would be:
>
> 1. Create a single unified diff file from all patches in each series 
>    (using combinediff)
> 2. Remove all context, leaving only -/+ lines (using interdiff -U0)
> 3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
> 4. Add commit information on top of the diff
>
> In the end, we get two summary documents that can be compared using 
> regular diffing tools like vimdiff/meld/etc and actually show a fairly 
> succinct "how are these two series different" view.
>
> The goal is not to replace code review, obviously, but to give a way for 
> a maintainer to do a quick sanity-check of a series they've reviewed 
> before.
>
> I ran this scenario on a random patch series that I found 
> (https://lore.kernel.org/lkml/b2b9cb06-b0eb-3e94-b83a-e58467069ae2@gmail.com/) 
> and attached are two summary files:
>
>  - phy_v2.summary
>  - phy_v3.summary
>
> Here's how diffing them looks in vimdiff and meld:
>
>  - https://mricon.com/misc/phy-summary-vimdiff-fs8.png
>  - https://mricon.com/misc/phy-summary-meld-fs8.png
>
> So, questions for you are:
>
> 1. Is this is a useful way to present an "at-a-glance" view?

Yes, I think in a lot of cases it would be.

It's fairly common I think for a series to not change a lot in later
versions. So eg. the series might be 10 patches with 1000 lines changed
total but a new revision might only change 10 lines. For cases like that
this would be very useful compared to trawling through 10 patches
individually.

And even for a larger delta between the series I think this will often
work quite well, as long as there isn't too much code movement.

Where this will fall down is a series that is undergoing large sweeping
changes, but that case is just plain hard to visualise well.

> 2. If yes, how would you change it to be more useful?

There will be cases where the diff of the whole series is going to be
too big and/or busy. So having a way to drill down would be awesome.

The easiest to implement would be limiting it to a single file, which
would be useful in some cases.

Harder to implement but possibly more useful would be showing the diff
between the two series up to some point, so eg. show me the changes
between the series but only patches 1-5.

cheers
