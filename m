Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F17496;
	Tue, 21 Jun 2022 20:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42A0C3411C;
	Tue, 21 Jun 2022 20:29:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QRTuhE/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655843375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFwNJ7i9IawOpbShviK9D+VXno3ix+alAf8Ubkbi5aM=;
	b=QRTuhE/A9Ep/XlMjx3ux9iDsJJ5laDHLmQ6xXjBbx+XUJbCzc7p+q0ZJGf/RI6nTIUDQH1
	4AmRmQ36rN/Gy8+EFWhuQjGlfzyiY+cIJzJ8d/gFrYHG8Xt+1TmfIn/ljlWRJECRav14eK
	3Y6nU8JUwyPrTpfaVd9WaW6O7pNOCaU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 824624fa (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 20:29:35 +0000 (UTC)
Date: Tue, 21 Jun 2022 22:29:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrIqLabIjPyorTJ5@zx2c4.com>
References: <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
 <CAMuHMdU1EZ9vwyOec6EKGaW=Ghy_p5D0dbcun24BqoSok6maLQ@mail.gmail.com>
 <YrIg+vV8YMVrhHME@zx2c4.com>
 <20220621200640.7kczqkwwap2wehsy@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621200640.7kczqkwwap2wehsy@meerkat.local>

Hi Konstantin,

On Tue, Jun 21, 2022 at 04:06:40PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Jun 21, 2022 at 09:50:18PM +0200, Jason A. Donenfeld wrote:
> > On the contrary, the thing you want is a service where you paste a
> > commit and you get a LKML thread. That sounds like something lore could
> > grow, or any other service that has that database handy. And it could do
> > it *better* too, since it could show multiple matches sorted by
> > relevance and matching distance to the actual git patch.
> 
> FWIW, this is something we should be able to do on git.kernel.org soon -- a
> commit view will add a link to look up that patch on lore. The backend changes
> for public-inbox to add automatic indexing on "git-patch-id --stable" just
> landed in the past few days. I just need to figure out if I can do this sanely
> with cgit -- and if I cannot, then at least all the guilty parties are already
> here to add the necessary bits in. :)

Oh excellent. Keep me posted if you have trouble on the cgit side. I
could use a bit of new motivation to pick up some maintenance tasks
there, and this sounds like a good impetus.

Jason
