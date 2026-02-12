Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8311D2C08CB
	for <tools@linux.kernel.org>; Thu, 12 Feb 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892658; cv=none; b=bXPplh2jnkWC62DZ/rXTR/EnD6d3o4Bq3Iju2og5x3ZWLMCZ5CQM6QODOpPW/mjtoTbtCIB/bv8ukUmDwFejtQfBO4Sd4TOb/n5/RSye+DpfVsIiQtCmhtt3R2z+W5koZYXGrvrKpuIqWOYux25FF4MHrzHd45YXLqDPFnsVJek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892658; c=relaxed/simple;
	bh=mI8Z/wKOyCjDbrPSe7eg9+Ln0NvgPdvaVE9ekJItxkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGL3oPFelfkr3xKQDDaL87UifqdJQ/VkMCBneEJstiMuNdEPt8Eq2u9Ol/0vG6TWLl1nW9XCR3+uZ6xqZFBOifYTrJz/Flulrp5X7CxaxqI1Y1PW+j7SyP5rcSwC0dLAa+93FVf3OsPXvya3XpkK0fyc+nT4smMrUlP+T9WKPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RzAMRs7p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RzAMRs7p"
Received: by smtp.kernel.org (Postfix)
	id 4CCBEC16AAE; Thu, 12 Feb 2026 10:37:38 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D650FC2BC86;
	Thu, 12 Feb 2026 10:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D650FC2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7167440E0367;
	Thu, 12 Feb 2026 10:37:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XVZMrvNA4k48; Thu, 12 Feb 2026 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1770892642; bh=bhIhhqFpJ9O1P+MbMCFt5oHLRWXlLHtuihYpV6rMw9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzAMRs7pkrm+/9gAENGOWKRtUaBHdRmSs8rRnIoxFuerj/zDTqEQAJaucuX66sDNE
	 M58+ceN3eheSLY9PoEZHxNHb14t1igMyG+kPpWmcyH7u5K/e9LRnw2znhBWoQvOyDc
	 hrOPpsmhkHfCyaDF0lDnRiQtFWhZhBjo3HPTNriAs9sjsRxnqflgcGm3FhP+w7ZSLz
	 gK2Wbnyjl6vBfQvGIvg6+4JYzDlttQIQ6Qo8fLVjFbLoMxrghj9s0iTahZz56dV99O
	 /04Edf9vwDyOvY7oFD0jqIgeRotxj1XP4MORSQluyEaU9u0KCNTjFEiAKg7w37VPal
	 IRlwAoZ0eSKtPQ0QQrKAbSqGUJnS1Lt/Pu3nHIIlg8+iT9AtANSTh7awoOFoQ6HqNh
	 OOk6v7pQrjqXv8vY0GZx9nPBgjY3yKKV3uQRFygDenvtxsZl5OsbNbe9QHXiOtBnE0
	 JMytEZnfVPKLYGB6uXy7yephednrX7YQWB0yHiI8m98e8oLwp4wHqQuzewMYj4kdzb
	 ebULxToLiVfljqbx8FtcR6sZCe99VmYTO2OLALH42pKziSWLn8qXjPplHwM9Wyvrow
	 299V7ErLpBwpIH6YDmJQHEJJJGZhKtxwTRJlDIfe+Xi7SnPva57lXlwQRHkvV0212f
	 vAs5OKPw/BRGM+NEqcylDn80=
Received: from zn.tnic (pd95306e3.dip0.t-ipconnect.de [217.83.6.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id AE5D340E02FA;
	Thu, 12 Feb 2026 10:37:19 +0000 (UTC)
Date: Thu, 12 Feb 2026 11:37:12 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.5.2 now available
Message-ID: <20260212103712.GAaY2tWLUUTBNZCYU6@fat_crate.local>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
 <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
 <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
 <9305e0e4-b6e6-4cb2-ad71-a929bf282565@app.fastmail.com>
 <20260211193320.GFaYzZgMJ2jHuYbHpl@fat_crate.local>
 <20260211-enchanted-cicada-of-aurora-105bd9@lemur>
 <20260211205111.GHaYzrv792wmWdAUMM@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211205111.GHaYzrv792wmWdAUMM@fat_crate.local>

Btw,

while at it - and this is perhaps really not important but - perhaps those
error messages could be made more human-friendly.

Yeah, I dunno. Maybe it is good to see the exception traceback or maybe you
wanna handle it properly. I usually try to handle it properly and issue
a good-enough message but this is just me...

Anyway, just a suggestion if I may...

Thx.

Updating feeds
Traceback (most recent call last):
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/lore_feed.py", line 47, in get_manifest
    response.raise_for_status()
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/requests/models.py", line 1026, in raise_for_status
    raise HTTPError(http_error_msg, response=self)
requests.exceptions.HTTPError: 503 Server Error: Service Unavailable for url: https://lore.kernel.org/lkml/manifest.js.gz

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/boris/.local/bin/kgl", line 6, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/click/core.py", line 1485, in __call__
    return self.main(*args, **kwargs)
           ~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/click/core.py", line 1406, in main
    rv = self.invoke(ctx)
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/click/core.py", line 1873, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/click/core.py", line 1269, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/click/core.py", line 824, in invoke
    return callback(*args, **kwargs)
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/click/decorators.py", line 34, in new_func
    return f(get_current_context(), *args, **kwargs)
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/cli.py", line 1198, in pull
    changes, _ = perform_pull(ctx, no_update, force, delivery_name)
                 ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/cli.py", line 1079, in perform_pull
    updated_feeds, initialized_feeds = update_all_feeds(ctx, status_callback=status_callback)
                                       ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/cli.py", line 778, in update_all_feeds
    status = feed.update_feed()
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/lore_feed.py", line 151, in update_feed
    remote_epoch_info = self.get_manifest_epochs()
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/lore_feed.py", line 88, in get_manifest_epochs
    manifest = self.get_manifest()
  File "/home/boris/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/lore_feed.py", line 49, in get_manifest
    raise RemoteError(
        f"Failed to fetch manifest from {self.feed_url}: {e}"
    ) from e
korgalore.RemoteError: Failed to fetch manifest from https://lore.kernel.org/lkml: 503 Server Error: Service Unavailable for url: https://lore.kernel.org/lkml/manifest.js.gz

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
