Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53A5346776
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762374505; cv=none; b=WAcFGPhdU9dvs2RIZtrXDgiMu3/7X3lopi5bf7WyEoC5Jc7tB7VzsODpYG+CRmsU0q2laeLlcjoDb9M48QgMxaWFjF5Q/yauW7a/apqDHgm28/nRO0rbgjljSreyi+rXdgk0tOV95mFHGqdk73eihSfJW9v4t4pzb+asOzn9Nfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762374505; c=relaxed/simple;
	bh=siNaFJNq2krejQZEveqGZ0R+w4gP2MTobO9JM52kxgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LsGuhdOXTQ59NlVyTiri9DN/P8QYk+mZqhI2XAXx9qIBA9k8JGMFtwZDlvIPPILLjSY4dcXKjyRDOc/ipTgQcS2i/BH6BivkzBZDmC3/YpRai5pbe8oW52/ss2UTXAuNQ7YdLtmee9Ywzfz3c67xr6QzC97l6b73ctHBl4GeUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqPtSYOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqPtSYOf"
Received: by smtp.kernel.org (Postfix)
	id 433A0C16AAE; Wed,  5 Nov 2025 20:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 942B9C4CEF5;
	Wed,  5 Nov 2025 20:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 942B9C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762374503; x=1793910503;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=siNaFJNq2krejQZEveqGZ0R+w4gP2MTobO9JM52kxgw=;
  b=PqPtSYOfIdYXVlVSzfrYqfp33Aeoj5Xmscs2RmGzoC9BgZtr85KSmXuc
   E5P5r/T4R6Ymmf7EdVpFH2CKOXGjFaonK4IM/x6m9OtpNZ3v/KOwzGsOa
   m68Pw0y8ldYFuM55Gdey2Ej3LiSS7kukxYqORPljnxmsSPEewoPlS7w0A
   tp20SitMchGI5zc2D2iwd0aBkuhc+bNlhPfCIX8Eku53A4gC8OP1nAhV2
   1hINDF+aUKQKC7ZuiJPOokPRpKvHpgynR8UNMHqTU5lcMTYwoM6vpjNCQ
   kaDlsCzNOmMxq2iIfxDg8zuHq6Hzcwhwu/pRD9i2Ev2+GZ5Fko1KiGYKY
   w==;
X-CSE-ConnectionGUID: QB1QQnueT2OgL/Ru4T+IwA==
X-CSE-MsgGUID: tBdku76YQ42JiszkF/syjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68340300"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68340300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 12:28:23 -0800
X-CSE-ConnectionGUID: 8Yk+NzD6TNqv+8PQnuqciw==
X-CSE-MsgGUID: 0xMWpVLsSqyEc/T17gmsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="224804300"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 12:28:23 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  users@kernel.org,  tools@kernel.org
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
In-Reply-To: <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>
	(Paul Moore's message of "Wed, 5 Nov 2025 14:12:44 -0500")
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
	<CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>
Date: Wed, 05 Nov 2025 12:28:17 -0800
Message-ID: <m25xbow7fi.fsf@C02X38VBJHD2mac.jf.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Wed, Nov 5, 2025 at 1:38=E2=80=AFPM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:

>> It's mind-blowing how hostile Google is to the idea of people using
>> their own gmail account for something as straightforward as accessing
>> their own inbox.

I suspect you dropped an important keyword: "...hostile to accessing
their own inbox _programmatically_". Just a guess. Also: paranoid
security? Gmail is the passwords and identity manager for many Android
users.


Paul Moore <paul@paul-moore.com> writes:

> Often I don't want to subscribe, pull, or otherwise consume an entire
> list, but I do want to comment on a specific thread or patch.  With
> lore it is easy to read the discussion, but difficult to reply with
> gmail as there is no reply-to header support.  I have my own hacky way
> of handling this that I don't particularly love, but if I had simple
> tool that I could run, e.g. 'kgl pull -M <msgid>', which would import
> a specific message-id into my gmail inbox, I would be very happy.

This problem has been solved by NNTP in 1986 - and maybe UUCP even
before that? I just did exactly that thanks to:
https://subspace.kernel.org/subscribing.html#subscribing-via-nntp
Thank you SO MUCH kernel.org for it!

Mailing-lists are just not fine-grained enough. The LKML is actually a
database in email disguise. That's probably the most understated reason
why forges have been successful: because it's extremely easy to
participate at the _thread level_. Fine-grained (un)subscribe buttons
everywhere. The debates about web interfaces obscure this critical
point. We live in the era of information overload and attention
merchants, so this matters a lot.

Unfortunately, NNTP clients have become rare. I can't understand why
because it's the right tool for the job. I mean your problem statement
above is literally the design rationale of NNTP (and why I could not
resist replying). Also, NNTP still works. I know because I just used it to
fetch this message. Brief reality check, you never know.
Note I am not using NNTP to post this reply, just regular SMTP.

Thunderbird still does NNTP but it's a bit heavy and slow. I just
started using "gnus" again, it's fast and crazy powerful cause it runs
in EmacsOS but... it runs in EmacsOS which means everything freezes when
there is a network or proxy glitch, a very large download or some
bug. So I also just started running two Emacs instances as a workaround,
yuck :-( Also, don't even think about it if you're not already familiar
with Emacs.

If I really depended on mailing lists a lot then I would probably look
into "leafnode" or similar. "Airplane mode": check. Could something like
leafnode "bridge" NNTP and email so everyone can keep using their
favorite email client? Not an expert but I don't see why not.  Bonus
points for: vendor-neutral RFCs and no hard dependency on any cloud
provider.


PS:
https://lars.ingebrigtsen.no/2020/01/06/whatever-happened-to-news-gmane-org/
