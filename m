Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8206D0D;
	Tue, 13 Apr 2021 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1618347785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bNNG2Ey4NeriUStJHJFcopUHJgofZCxYzdhk+J1uV5Y=;
	b=PS5XQlJzTgt8wu190BY+RY2bcwli5wMWUayYQaDRxWl5DrZO6lO4u82DTl6sSZp9qGMBmm
	lYQof9tkGQDpL0fxGJ9w7Rt78nY64dm+7N9lKrxZ/xwaln4gi2GWtSCw/e9f0D66f44uaZ
	wnE7zXgLtrvhqmEJF2sq+TZxBJgiRY0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c41a21a (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 13 Apr 2021 21:03:04 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id c195so19682886ybf.9;
        Tue, 13 Apr 2021 14:03:04 -0700 (PDT)
X-Gm-Message-State: AOAM533K9BlRXAwoe+T/L9d0RV7jgoO/fdG9Wn360cUD9IbXumkXiYv1
	XKlpSGR54BYQ5fwtG8WcpKBr2bmAPsLruJYfkp8=
X-Google-Smtp-Source: ABdhPJwqmiqfFPda+BXqCnAkSW0VioODbsriJYgUwcvsc2GDow42ajais0zixMCAZdqIgFAzgoIRvUAFbRTgnZ+qPns=
X-Received: by 2002:a05:6902:1003:: with SMTP id w3mr41464286ybt.123.1618347784229;
 Tue, 13 Apr 2021 14:03:04 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210413204932.yovoa7njwc56jo5v@nitro.local> <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
In-Reply-To: <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 13 Apr 2021 15:02:53 -0600
X-Gmail-Original-Message-ID: <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
Message-ID: <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
Subject: Re: RFC: Superseded-by: follow-up trailer
To: Alex Elder <elder@ieee.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 13, 2021 at 2:57 PM Alex Elder <elder@ieee.org> wrote:
>
> On 4/13/21 3:49 PM, Konstantin Ryabitsev wrote:
> > Hi, all:
> >
> > B4 (and git-patchwork-bot) try to deal with series revisions, but the process
> > is not infallible due to needing to guess whether one series obsoletes another
> > via weak string matches (subject + author). If v2 arrives with a modified
> > subject than in v1 (even if it's a typo fix), or from a different email
> > address, then auto-matching will fail.
> >
> > I would like to propose a "Superseded-by" follow-up trailer to help strengthen
> > the link between series revisions. The trailer needs to be sent as a follow-up
> > to the cover letter or first patch of the previous series.
> >
> >      Superseded-by: [url-ending-with/message-id-of-next-version]
>
> Could "Supercedes: [url]" posted with the new version work?     -Alex

But in that case, the metadata is kind of useless once committed, and
it increases the overhead of submitting new patchsets, which means
fewer people will actually use it. With Konstantine's original
proposal, after you send your new version, you can lazily follow up
with a reply saying what the new one is, which helps inform everyone
who was hanging out on that old thread too. And folks other than the
original submitter can help provide that kind of thing too. In other
words, I think K's original idea seems like a sensible low-overhead
thing, while yours is a bit more laborious.
