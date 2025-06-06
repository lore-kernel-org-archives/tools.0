Received: from dcvr.yhbt.net (public-inbox.org [173.255.242.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4BE24DD0E
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.242.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749233344; cv=none; b=m+HMdxDT04lCJ/TfVWWxais5Bp+PRH3xkMbOorRXD0sdoJLBhIGmI/hndFlFYBT2c/IG/kR4jLDAfZNln9cgkND358qjMu46J4J7UXuk6cvOEygBMeows+cmI9QRXBa2G8TSRKyEc9BZZ0iR0P2/qqZ3O2caFY2D0L7aJx9dcRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749233344; c=relaxed/simple;
	bh=69rkWNbgv9Zc8tXIV51NVKlOCFqAv1VvA/kzsuefJcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7ffWh4Yx1q5ii4PqZOwUqUb5Tdv6cW9MQGbfv91gE3H0AZtyzAaUvyFdcEHTrQHUZLu8YFQIZ3I0MNU0JounwCz29bJUlxjssVJfBcozMtNFwwayFUwfFzWy16N1AetwHX3eTYJVSvD6tjwi41ownKG9lrOLFzk7YtPFbHPhGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=80x24.org; spf=pass smtp.mailfrom=80x24.org; dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b=Ns0w7Tik; arc=none smtp.client-ip=173.255.242.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=80x24.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=80x24.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="Ns0w7Tik"
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id A197E1F4E6;
	Fri,  6 Jun 2025 18:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1749232938;
	bh=69rkWNbgv9Zc8tXIV51NVKlOCFqAv1VvA/kzsuefJcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ns0w7TikB2qSNSggQG9YoBJK1Oeb/bRReL03o8dl5vMKsHK4kgutUuSORVezeWEvO
	 YOz4N91JwGkOXiqkvEQox+oXNefBTyAwb9b5T1fmJhw5djIljpFKMSdyWEylO7UcMs
	 OO5rtNIb2GhSCP499EXArAMKb/Pzt6MXO4dkhUHI=
Date: Fri, 6 Jun 2025 18:02:18 +0000
From: Eric Wong <e@80x24.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: tools@linux.kernel.org, users@kernel.org, meta@public-inbox.org
Subject: Re: Does anyone have any tips for efficient lei and dovecot
 integration?
Message-ID: <20250606180218.M374829@dcvr>
References: <0bb9762f3bcee7b185f1eabc6c88859c0bf6f4ac.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0bb9762f3bcee7b185f1eabc6c88859c0bf6f4ac.camel@HansenPartnership.com>

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> This will only interest the diminishing number of you actually running
> your own email server (or possibly if you have a shell login to the
> actual dovecot system).

+Cc: meta@public-inbox.org

Fwiw, lei can output directly to IMAP and not just Maildir.  The
main problem is Mail::IMAPClient is awful on high-latency links
due to a lack of pipelining right now.

> The next problem I have is that I don't really want to use double the
> storage, so I need to use my dovecot maildir backend as the only
> storage.  This leads to trying to use the --no-import-remote on the
> queries, but it doesn't seem to work: I still get allocations in the
> store greater in size than the contents of the existing mailbox ... so
> if anyone has a fix for that, I'm all ears?

I think that's answered below...

> The command I'm using (after unsubscribing from a list) is:
> 
> lei q --augment --no-import-remote --dedupe=mid -o <maildir list location> -I <lore list location> "d:<currentdate>.."
 
> Don't forget --augment (I did once and it destroyed my entire mailbox).
> Then I have to get dovecot to index it:

Oops, yeah, --augment being off by default is a mairix behavior
I imitated :x.  Unless you used --no-import-before, lei imported
your mailbox into ~/.local/share/lei/store before writing to
the -o destination; so you could dump everything it imported
back out: lei q --augment -o OUTPUT z:0..
(z:0.. means message size >= 0)

> doveadm force-resync -u jejb <maildir list location>

AFAIK, dovecot uses inotify||kevent to detect changes to its
Maildirs.  I never needed to run `doveadm force-resync' after
writing with 3rd-party tools (e.g. lei, mutt) to Maildirs used
by dovecot.

> So far I've been converting over my lists slowly (especially as it
> takes this lei shard command ages to run over a large existing mbox)
> but it seems to be working.

Yeah, performance is pretty awful but have some long-term goals
to work on, there (a separate discussion later/elsewhere).

> Actually the most annoying issue now is
> the confirmation round trip to unsubscribe from every list ...

Probably easier to set up bounces on your MTA and let the
mailing list software auto-unsubscribe you :>
