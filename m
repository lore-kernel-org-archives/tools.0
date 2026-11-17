Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794934399;
	b=k0oneHNsV1MoNXdaAxdafNmKHISzHmpaPqmGQ/Fq+UGn6vPhIW9QX9q+79Fin1c08ctT
	 mhBodQ9gp8MT/sVDQPZHUaSUwQ9rM4WyGfbb3ror/MSvRac5YFkvW4/WcUEG9Ate3qVU2
	 LzTt75vKqpgAKRXc8cg/mCxST4KqKhixiZ86wWIuEBkt2wVIn90oLEw+WGm50rnuOwvVS
	 IRfdKjPAsVnKNc1ph7B2p0MfG2BFYeQ7JnMseC70gLKtUwe/mXz9kChiUUL/14gOwCFr+
	 zcQcr34rUQI5Y53nbnIETSHvscftvgBm7wXvhS6IhjcynKF6RMMmdw216RfXEJ9H07Q==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934399;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J1JTfFeUKbl9A0Q46BKOrfZhB9Si5Fx/1tTYO1LUyj0=;
	b=WL2ytQ61Iugw6hdE4iV7IqrjaJq+3YusQwyr3LRiksbYXdVSFxpVW27NJgpQg0f9bzSm
	 h+uoomh05w7NmGKFf14lVfUG+C2GQx2q1PAJVkPcyE8QPho7GS5QQy/ysrv/pEivojo8M
	 cFWankyB16EM3qx+pU3WN+hD1aChvAA9Kb3241q6ZtsbZG9z42b584P7aFwxGAZ4n6RGK
	 iR6jtJdsqgFkjWJqQdRs0z5o9BZQ+VvcVyIs72c5h9W6ob2+4DGKTdpOLNcrqVP3mK+jZ
	 seo78qS62Q75fBTMu9W6Jc7n0e9FrH3fRL6jV/aB7XD1HaK7Fphw+XvQIOBbZzyCYpA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuoe+Jtg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88524606A884
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 16:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuoe+Jtg
Received: by smtp.kernel.org (Postfix)
	id 7ADB41F000C5; Tue, 17 Nov 2026 16:53:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794934399;
	b=PK74aBkYIlJu5s+EiJ46dcvbiZEIa0YxdCRxQSF6gCB+4tb+RTkNK99vHo/7cfYS7QSm
	 yswawNpw1aSFKq0zsHTjmALgyNEm5wnlMw1/mbzuA5CPZDIg9Iz6O1EQT5u1EvXCkk6N5
	 BuEAPhywi8s9vDnJLVNE8+R7eP3ba5N0xH+5Y3LYU+dHvCbF7Yyt3s3Wx01w16uuB5FNV
	 NislBfiKxGI9bo1MjAjahYyR71yUWP81G+9lI4jqktwTGyfkQoZ5DYM7iURUEhj4vLNZI
	 MSW06cpBLgnbfugZth1HWhlMdc9nnv7AypCiN4aDQh8TAvqjW4YS8YMnnW0TtxpaWJw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794934399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=J1JTfFeUKbl9A0Q46BKOrfZhB9Si5Fx/1tTYO1LUyj0=;
	b=Zbfrrhvx1yaLqUgd+BppnH0mhGtns+gKBCm9wuxidpbjGKhn3ARY9MLRlYtoMNHAqb4E
	 YrnDz3HNRj0y+UdU7DCB8ozJlBW1nqhkaU/JGsCkvvRjmLnvzJQ7ghxcFNpiWlgeaoSF8
	 1ZVOM+tGunfzHm6lXo7W6dRoQzqN8osX94auPbzRVmRn1FzB85QgxBIOWdWeRy6l5amjp
	 dGgDJKSw+8dvK80/ixq2Ykmd2BEtvDTyfTWdFbi+vcO10/4ihtK7jA9q5Y1hHFQOZX8sZ
	 rFBSj2VNz+JD2ZRc2+3mANa9oqIdB0+hfwO323H1ATytULAYBkQOXp0f0IwCX97jj4g==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuoe+Jtg;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E078E1F000C4
	for <tools@kernel.org>; Tue, 17 Nov 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuoe+Jtg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E078E1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2da166818so3534053137.0
        for <tools@kernel.org>; Tue, 17 Nov 2026 08:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794934398; cv=none;
        d=google.com; s=arc-20260327;
        b=j5s3+Gg/mgJ/k7IEJwG6/rwyA5HbulCtdkUt5Tu/FYrgK/IgaVuyvZsBgF9X1/9+CR
         OaRgdZpgaQysVGNqotw+u7FKLZ+KqSvn4Lo1tGzHYMDo28yNpUSgolGf7t06RShUEm6H
         LGFSSlFhnkyIHhJPzN5ou36M84SIS0kGY2OH4zKfUQwSs6Ioy4LaQXE3nEzRm62msK7w
         g4n4130rwLNPK5ZvbjWMVNjWcmFCwK70vrzojpMhGsS96DEG4wDltH+Nn2BrGeDsUAU0
         Rpgc0sk0zvl1Ozpoy+M/vdM+xeRAYZw+L9qDoV1shHU77+GSCV8sKeR/xdM6bcD9nu56
         EBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J1JTfFeUKbl9A0Q46BKOrfZhB9Si5Fx/1tTYO1LUyj0=;
        fh=IJqJYq/8aA5bZ5zN54OMKN21XKKG5OJ3sR8aAJnlCLI=;
        b=YrFTlPXNU+MMrHnzp9arOd4EU8CwFf04PrWIhSsihNlIskpLHzjfm8xZtS1DhA/k1g
         FpbJ9pu0jbMCFbkuwwknRKpFyrDc7WLRM/uyhKZeXuWZVi28LQmPI27vSJJY+Sw6y+Tc
         HEkTnV8dx/TFbgKNxjkvdHRSkPPViAKeEuqvwu2vg1IzbdbxO+PwHJL5upwhioZQFRNX
         k2Emh+yH0haTDTRsXxWgMV065g1uhzD2Xe7TvmerM82AKTiTD1eHJlgpXXsR5ZydSquq
         bdVcs9wT0Q+I8x8dSndueIDQ1VlYoOhCd3ve9B+ZbFja3yl1d0Xc6+kPbrZ0jkbWYQ8g
         S9zA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934398; x=1795539198; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1JTfFeUKbl9A0Q46BKOrfZhB9Si5Fx/1tTYO1LUyj0=;
        b=wuoe+Jtgw+X8UYsTfbLkIWIsLNRaVcsWvc5WcDB06JGHMz1FAs3q7ohoxuNBW/yUlv
         JxaczWU4PvKINTn2ktTwfalt164B7B3scJwsLuuKxDEsXSCp3eHvGvr4eExq7WoAhabc
         x4uXU6KWecvU1BpPBurfeW1NgpR2r9yoi22fjIZBApFi113B/XlaiMww58q2LkQ8Gxur
         GwoKUvlNWx4Is3k81lnMEUsHCzmJNMVh74Q5H8tWm5z2sCLDdaeSebkFdWSPYzDW54l9
         8Wi9FdVMjpMakq7pMYE/vRojPrQ0roQ42/M2Deu/CeCWwzNCNQupArLNkRzlsGf0jCXZ
         BBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934398; x=1795539198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1JTfFeUKbl9A0Q46BKOrfZhB9Si5Fx/1tTYO1LUyj0=;
        b=vbulV7BJvhV9FJrADbKQwCUsDGqWEzYMAy+J0Mqvu5rHLbP0A0g2PculFWz9JbrvjY
         5s8mZ/r1S2+tm1bsYBQLegGk9Z5tBIhHLSUfmV197FkrmF7jT5/NedDSNYqGcgpNxxjB
         XIhSz6WJsz936+Lg2xPzHoBmcA7KGye7oY3Tu3WiTUOxHzNOWP+ZmMrneJKnGFIF2noy
         IlaPBkFaC22FY2yudhhdBVk7YlQbfR1qxs0sEKjfubU5mN9LAmoEf/txK3h75BDZdmR8
         aH2xqQoiH5S2xLElGQuhR1FmtAoJidNk+scqzl3gucZkOEqlfAZO5TBtLl8UVUjPcRyk
         OxDg==
X-Gm-Message-State: APuU4Z8JAKMRVs4ypqnia+NGPd0rP6QqZ1c0lS6/WPGm7kjR4SJGMgXi
	hBygaDpmZ4v4AN1fh7J9zXbrPeyLZJZ4ppLRHlRrZkwmUhM31ZIeiQq8n7EgDA08vbtkCTel41F
	kjs9u2RqpT3iFw7wfmM/5mq9kp0jqaJn2s+y4
X-Gm-Gg: AYBFou3QboiKK7NRDC/WyIY3hsRJI8UmndD7uMjCDz0Keb0Dy5LZ+mUj9mO87zPHsGD
	AwnYnVW3OSYzaeDBtAWhlhd98oKsf3lzTrYSUwzM9F4Mqlfodi0MbNWaEpRgYgDo4MXu6gI8wMY
	AWha2IHSMxquyCSC5LdJaJBlbArQsC/1pItMk89Dvo8elx9iZjOWprS/bmQLbpIxarABscb58u/
	6s18141QPjS6GmgEjzwnjVH/JLb9wTlk4RII0xPxl56W68t0xnqwFeNlJ+WEQy5wU+UkYKzTGS3
	3pNHiYzcEmFJMSV7BJuzf4cAr5dA+2g3mUteDVUY5B+znnwa1YGf5jcXKFHJjvsaOINxjKFp3OE
	VSNB65QPa0NByzoLZMZvmx3CqQ8LoaNSrjARwUeHI/LjdIBtNWfqaadCsLS21WfNYF7JoydfkOH
	OGcnJNs+brjEjYKRz8bYWKEVoU22OP/ECJtC3vES9mOLA6KTPZYctXSF+fm/lG9qVmYzERD1sh0
	fjBtW7T6XAOMMJmIzFGC1JE+jEu6Q==
X-Received: by 2002:a05:6102:604b:b0:7c1:7ca9:94bf with SMTP id
 ada2fe7eead31-7d64d78d499mr4640656137.19.1794934397770; Tue, 17 Nov 2026
 08:53:17 -0800 (PST)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
 <179451279186.1693101.3646569244001837281.b4-review@b4> <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>
 <20261116-authentic-attentive-cricket-b046cf@toolbx> <CADvTj4qr0A0c8DpsNhWK3aV=Lh1bJL4knMjkG8rDaM=Qa01fsg@mail.gmail.com>
 <20261117-dinosaur-of-fabulous-skill-17ca6a@toolbx>
In-Reply-To: <20261117-dinosaur-of-fabulous-skill-17ca6a@toolbx>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 09:53:06 -0700
X-Gm-Features: Aa3M54rCOQMDs14Vybqe_u9JeMKO67B7hF2TjsFmwcsZ5ONfQbr0Mbm4nMbRBjo
Message-ID: <CADvTj4poKWpXDn149wXzq0-014w6H=arFgRCfwqZhs+7A8uEEQ@mail.gmail.com>
Subject: Re: [PATCH kgl] Preserve original dates when importing messages over IMAP
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:58=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Nov 16, 2026 at 07:52:49PM -0700, James Hilliard wrote:
> > > > Consequently, importing the same archived message through Gmail's A=
PI
> > > > or through IMAP can give it different dates in the same Gmail mailb=
ox.
> > > > Preserving Date: for IMAP would align the normal case with what the
> > > > Gmail target already does.
> > >
> > > Okay, after more thought, I think your reasoning is good. I didn't ta=
ke your
> > > patch series directly, because there is already code in liblore that =
handles
> > > date header parsing and I wanted to use that instead of reimplementin=
g it.
> >
> > The liblore helper prefers the latest Received: timestamp over Date:.
> > For patch imports, that can lose ordering deliberately encoded by the
> > sender.
>
> Yes, as you can tell, I have real trust issues with client-set headers. :=
) In
> my mind, Date: headers should mean absolutely nothing in any scenario, bu=
t I
> am happy to accept that my viewpoint is a bit extreme.

Yeah, I guess the main issue is that in practice Received: headers
are very frequently out of order in the real world, which is rather
surprising. Lore has to rely on Date: headers for patch ordering within
a thread itself due to this issue.

> > b4 assigns successive patches Date: timestamps one second apart, and
> > git send-email also increments the timestamp for each message. Sorting
> > by Date: therefore preserves their series order. Delivery delays and
> > retries can change arrival order even when all server clocks are
> > correctly synchronized.
> >
> > So a difference between Date: and Received: does not necessarily mean
> > the sender's clock was wrong. They describe different events, and for
> > reviewing an imported series the sender-defined order is useful.
> >
> > > The latest master should have the functionality you were looking for =
and I
> > > credited your submission with a Link: and Co-Developed-By.
> >
> > This avoids dating old messages by their import time, but IMAP and the
> > Gmail API target still differ: IMAP now prefers Received:, while the
> > Gmail API target uses a valid Date:. The same message can consequently
> > still get different stored dates depending on the import method.
> >
> > Should header mode prefer a plausible Date:, with Received: as a
> > fallback? Alternatively, if Received: should remain the default, should
> > we provide an explicit Date:-first option for this use case?
>
> I think I will go the same route as mutt and provide "import", "date" and
> "received" mechanisms -- this way it satisfies every preference.

Yeah, probably a good idea, I think "date" for at least this tool probably
makes the most sense for a default however since it's the only option
that gives you the patch authors intended patch ordering.

>
> -K
