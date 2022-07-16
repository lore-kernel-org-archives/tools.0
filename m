Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0737A;
	Sat, 16 Jul 2022 16:10:56 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id cp18-20020a17090afb9200b001ef79e8484aso9889939pjb.1;
        Sat, 16 Jul 2022 09:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a6flPr3ZKth+MqsKe5viiS0PkM74E8Cl22iDLoHfrFM=;
        b=UWC93GBU0CEMBsscIPA72awFlGJf27VsM75p/jdFB6wXyTwRx7G8rxjZyEU5T4pau/
         7AtAfxYpJ5UvORICSCUHjdKGNxQKUPM9wlK+GmO+9Wr+DepBvexhQHFykRTY9xG4apko
         EK6A2hPXrTj8TX1CJWdENwSPOWNPvqU+EcDSPfyuFDa2gyplhw+8cOwgMlzmhsaYJNd8
         K+u8yPZpESTAze7k/v03JVjBtcFhl3qjompvy6jTZcXk3ioKDDj01LaTYN6jjxv39/rC
         xerbv3Yr3CfLf6kBVF4vwmQvXQcGOwK7Oso62JSwrsrpLxdjGccJYbGv1XK5JOm0c3qf
         90Pw==
X-Gm-Message-State: AJIora+m/o9zklIkyhXMJ8DZYLWSQTWnPC5cAf4FDOhHBrz7KVTLE74s
	76iZorY/9Dt9uPFkPuYB1el3OvjqJ5KSFOXSGhgevoRX
X-Google-Smtp-Source: AGRyM1tslfAZsvq2+KsUkBoUyFiEbdxslJezViqQmgIGtPJrcKwT4WzJUTVDj7StOAc6ODiuBnDwkwnMdlujbB2yP/o=
X-Received: by 2002:a17:902:da8e:b0:16c:56d7:e00e with SMTP id
 j14-20020a170902da8e00b0016c56d7e00emr19842663plx.91.1657987856261; Sat, 16
 Jul 2022 09:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
In-Reply-To: <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
From: Junio C Hamano <gitster@pobox.com>
Date: Sat, 16 Jul 2022 09:10:44 -0700
Message-ID: <CAPc5daUOgRvyuL065JfKnAPmOqiokWkziyRUObDbQ3kVftpnbw@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

I thought that on the receiving end you implemented a feature where
the cover letter material is kept and used as the log message for the
commit that merges the topic branch into whatever integration branch
it is meant to go in? Does it make sense to make this feature a (sort
of) mirror image of that feature? I haven't formed an expected
end-user interaction to work with that shape of the history on the
authoring end in my head yet, but as the end-goal to aim at, the
"individual commit on the topic forms a strand of pearls on a topic
branch, and there is a cover letter that marks its end at the end,
merging the topic back to the upstream" shape of the history looks
like a more appropriate form which (if I remember correctly) you
already invented and support.

On Sat, Jul 16, 2022 at 7:57 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Sat, Jul 16, 2022 at 10:43:17AM -0400, James Bottomley wrote:
> > On Sat, 2022-07-16 at 10:29 -0400, Konstantin Ryabitsev wrote:
> > > After the branch is created, b4 will create an empty commit that will
> > > serve to store the cover letter contents and some tracking
> > > information. You can view the raw commit with "git log" just like any
> > > other commit, and you can even edit it with "git rebase" but it's not
> > > recommended. It's much better to use "b4 submit --edit-cover".
> >
> > Could we please stop inventing stuff that's incompatible with a
> > standard git workflow ... or argue with the git maintainers that what
> > we want to do is better and persuade them to add it?  That way git and
> > b4 are fully interoperable ... for those of us who aren't dedicated to
> > one or the other.
> >
> > The standard git way of storing cover letters isn't in an empty commit,
> > it's in the branch description.  To be honest, this does seem a more
> > logical way to do it (a commit can get lost within the branch), but I'd
> > be reasonably OK with either mechanism, provided both git and b4 agree
> > on it.
>
> I hear you, but branch descriptions are confined to your local repository and
> can't be pushed to a remote. So, if you work on a series, send it off, and
> then pick it up again two weeks later from a different workstation, that's no
> good for most of what b4 submit needs to do. :(
>
> So, it was either using notes (which almost everyone forgets to push anyway),
> or using an empty commit. I agree it's hurky, but it currently the only thing
> that fits in the "least likely to end up lost on a rebase or workstation
> switch" category.
>
> -K
>
