Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB37483;
	Tue, 21 Jun 2022 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251A5C3411C;
	Tue, 21 Jun 2022 19:50:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BZFlFChh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655841020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IgJE1VA1mlqOtLEtMlBKfrvR8k1p26oX/2cgqGXOsUo=;
	b=BZFlFChho6mbuq/0N7jbr0cwux7HuIajUlnhMjIkv5nEyijjuvsnrDrvqNdtyzdDKYxBz5
	WBj8QgtfMUNZ9RqNeWx5QNe0JvzT6iv9Sc8s/h7XHEhySC9/4JYRkjNBzLXCKQrcltYvU7
	AHimnEJsyusnkkzztxKI5qNsEoWKv0Q=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dd8f9e74 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 19:50:20 +0000 (UTC)
Date: Tue, 21 Jun 2022 21:50:18 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrIg+vV8YMVrhHME@zx2c4.com>
References: <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
 <CAMuHMdU1EZ9vwyOec6EKGaW=Ghy_p5D0dbcun24BqoSok6maLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU1EZ9vwyOec6EKGaW=Ghy_p5D0dbcun24BqoSok6maLQ@mail.gmail.com>

Hi Geert,

On Tue, Jun 21, 2022 at 09:43:41PM +0200, Geert Uytterhoeven wrote:
> I disagree: when bisecting a bug, I can just follow the Link: tag,
> and check if anyone already replied there with a newer review or
> bug report (and hopefully with a fix, too).
> Without the Link: tag, it's sometimes surprisingly difficult to find
> out where the patch has been posted and discussed before.

Linus spelled this out pretty clearly last week I thought:

https://lore.kernel.org/all/CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com/
> Honestly, I still think that patch submission link should probably
> just not exist at all.
> 
> Are there other links that might be worthwhilte?
> 
> Yes: if people want to make patch submission give more information,
> then I think b4 should encourage taking the *COVER*LETTER* and make it
> into a merge commit, and at that point it's probably worth having the
> link to the patch series in that merge commit.
> 
> Because then maybe you get discussion about the whole series, which is
> more likely to be interesting and worthwhile.
> 
> There really is a big difference between "data" and "information". I
> think some per-patch link to a random patch submission that is just
> the same thing as the commit is worthless ("data"), but something
> higher-level may actually give you something useful ("information").

This seems spot on. So much so, that it used to be that when there was a
link in kernel commits, I'd middle click and read. But now it's usually
just crap that doesn't add anything, and so it wastes time and obscures
the good information when it actually is there, since I grow wary of
clicking. I spend a lot of time reading random commits, and this is an
annoyance.

On the contrary, the thing you want is a service where you paste a
commit and you get a LKML thread. That sounds like something lore could
grow, or any other service that has that database handy. And it could do
it *better* too, since it could show multiple matches sorted by
relevance and matching distance to the actual git patch. This will be so
much better than polluting the human-written git commit log with
automated stuff.

Jason
