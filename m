Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28106EA3;
	Tue, 21 Jun 2022 18:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C04C3411C;
	Tue, 21 Jun 2022 18:45:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nZH6F8zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655837148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mA4298rg0OiELifH+SYsf3/0+nUJl+PqGB/bazWakU=;
	b=nZH6F8zc9atxHsCjnawvcMix25eiPCf5etJ7WgY/KXghFUsjd7/cKEy4oCMctisJEgBQFl
	0Xnuxr7iqBzc8ryYEDK0tYlZZARebi/EByUASkuQZsug/g7XPbxSbUQbtgbyFgAVbZZ4z3
	gtt3JCr6JihGGTGSRGfunv3gnmY3YnI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 72c632d9 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 18:45:48 +0000 (UTC)
Date: Tue, 21 Jun 2022 20:45:46 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrIR2v7GdC3qIt2E@zx2c4.com>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621182953.p5asczznnz3pn6dl@meerkat.local>

Hi Konstantin,

On Tue, Jun 21, 2022 at 02:29:53PM -0400, Konstantin Ryabitsev wrote:
> If there is someone who is willing to compile a definitive list of "Linux
> Kernel commit do's and dont's", then I'll happily stick to that.

I dunno about a "definitive list". But it seems like a lot of
conventions get solidified by way of tools that are ironed out over
time. For example, every time a code style discussion comes up, Joe
Perches arrives on the scene to make sure checkpatch.pl is current. And
now the clang-format file is starting to also accumulate collective
preferences. It seems like b4 is pretty widely used and will eventually
serve a similar purpose if it doesn't already do so.

Anyway, in lieu of a complete and thorough list of all of the things, it
seems like in the last week or so we at least have two things that can
be be reflected in the tooling:

- Don't add `Link:` if the URL hasn't been hand selected as being
  particularly relevant; the lkml patch email alone doesn't cut it. This
  suggests that automatically adding `Link:` is invariably wrong, since
  automatic != "hand selected", so maybe there's no point in
  `-l,--add-link`, and you can just remove that option.

- Don't reorder `Signed-off-by:`. The simplest thing to do would be to
  remove the `trailer-order` option all together. But some people do
  want to sort the trailers (within each S-o-b segment) for aesthetic
  purposes. So if you don't want to take that away from them, maybe
  S-o-b needs to be unconditionally special-cased so that it forms a
  reorder barrier.

  #define sob(name) do { smp_mb(); __sob(name); } while (0)

Jason
