Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA62D738A
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391892; cv=none; b=Gi4r0kgPoKMwzhyprAXZLeE1dYRWL9IrllhJZ9lsIANPIJDB5oRurwCY+3FYY3IyhPUs6Fjb8FE0L4l1Z70v5q/5MqQ+bt8gBMtie3gUIMLEwIYwKcPdfdQy3HGmX6yx+fzRNS6llG5cxUkL+fKHATTlfitwwTUxwJ2H8PHwrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391892; c=relaxed/simple;
	bh=EXo4GIsrhUhhg5r7X0QAlqIzxa+8T3wmrZxr20RG87M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAFv7/QeJqOsTOsz/5bSN+zeGK43M+NfZPhewa4Wac4UXHE+GbxFoxrGsYAD0VSgoByN+Pb36QcK9X3GDcgCsatpeGWRyKkWuaAsKdYo7LhOjicczTXkgNZR3LiOMzMgDmBTL5LMd5gTooha+fiOk/P4PsEWM56A5V2/wUqy3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dXmDy1Ts; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dXmDy1Ts"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-639fe77bb29so7165095a12.1
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 14:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760391887; x=1760996687; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XJdDfRcMCYqdnp9CJZ6zg5I3xtjiwP9FDSqBAdK59uY=;
        b=dXmDy1TsoZPrVI2LTYfA2Di7q9srEvGNOB62PosEBDKjUVSvWBjCAX4K604r7KJ/FR
         BsxCzcCcyhxWVbT3IpLMjGfE32ka+QOMJgFGfKqOiajOxR+OPL+Dz5AG+toN4Z6Iy4su
         7fjF/uVDTwEEo1TZhUkMWM8wV9qc+Z3Rz+yns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760391887; x=1760996687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJdDfRcMCYqdnp9CJZ6zg5I3xtjiwP9FDSqBAdK59uY=;
        b=RNTM5GcyX6okMavNl7IRKZbIBOMEGexoqtJD0OZqq4Ec9J1Vy+0DKNHs+GjUYej8F1
         tz22UP80/x6VmjGXrlwsvrH4Yc3myl5dj2ss+AIl/7PyXqNnGea/vXc9QUOtgxFoWxkG
         fm29fhDOfqs4uXrOqRSrxlp7CvWdoz24nVxqQb5W3IJO7QRAYL0IlL3anVIbSI/BACcn
         oKjOdEQV30zCYHpDuoBoYFTIhEDuw6+vD2CnoOeT5b5QMNjynTJJthj9YJ6mpdY3qcUq
         ZK5Z9eH8MZQcftx1pLRMQv5zZWaFDy07LpkSf3CHixFz40zMUbgoeu9Eod0BWwMI2xo0
         A4lg==
X-Forwarded-Encrypted: i=1; AJvYcCXWFgSJ1Y8BjxS1OKy+LmDtzDXl0ZcoBmGNeQ/M/t2Wdfe7hzLKyBISqIUtlKhdTAV6nO9oag==@linux.kernel.org
X-Gm-Message-State: AOJu0YywojiyIw6KjimAVV4JhIZGxwEpw1j41ql/dWk6g9bdSeUH2Fgf
	OOQopA6ufaZXbmSeBKMBkeozv6qlx2Z9PxtYbTe+X/Vy8Jq66JEoz55LyHjkW/Xp4bzx62iQ57I
	IqzW8rnA=
X-Gm-Gg: ASbGncvaatcW6YGEHRMGM4nP780+qkf3vL1GkHX1kEkLsQLAs3VabQiLQWJieNtH6LK
	hy1+f/yrv/UX/sfF7AELMo5iW+LNxolDXr7xZle70+NbmgFKScGSWW6MNQqeFfRNwrwZPoJEnLr
	M6+gHcsnyAmMxCoQPsjTiPuky5ds2sSCCm3HQqSI1C3KY/Xnxls+H6601zBQuqgwNimE4v5cmwL
	vOOdqTnpnfuKPtolYcyi5xtdb4dx6gTBlLPkL9YVJVelQ1On5nC56nqpHgTfPgTS6Wx3uCZp8i9
	7Uts3O0sXyZE/JQ2GZLypCiQgeG4xAqzGQuhvbYkkBxq5tatte7VTzKNPWhIcZ/t3qawXo77hGo
	3SHBkqBQcKnsk5rjZiYDr5gL+7Fp3tZgCkHU7l3N99qvJWHZevB2kooYK45HDBfnNEo89lx75ui
	AY52nn+D9UCpTl+nhHFsthbPiM
X-Google-Smtp-Source: AGHT+IH0jT7kMEknPW5hB7N02Su0/jupECdEdP5+2mChemaHFdVhc3YH/TCoaizY+XmoDwgRrm+1QA==
X-Received: by 2002:a05:6402:26c5:b0:637:e74e:8d00 with SMTP id 4fb4d7f45d1cf-639d5c4c2f0mr21742646a12.27.1760391887013;
        Mon, 13 Oct 2025 14:44:47 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b7334cb4bsm6968490a12.44.2025.10.13.14.44.45
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:44:45 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso6475559a12.2
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 14:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWp74YjTuUsnXhoxBjqE6luRrHPcP0147KoMSwfxUQZCgv45BMXD0dNIPbk34FmJYymfOO/2g==@linux.kernel.org
X-Received: by 2002:a05:6402:348b:b0:637:eb4c:2f3f with SMTP id
 4fb4d7f45d1cf-639d5c2dba3mr21736629a12.22.1760391885271; Mon, 13 Oct 2025
 14:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com> <xmqqy0pezhm7.fsf@gitster.g>
In-Reply-To: <xmqqy0pezhm7.fsf@gitster.g>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 13 Oct 2025 14:44:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
X-Gm-Features: AS18NWAE9aVqmy9Oatp8eq6eB8Y10U3PRqHoLi3JQkBeUyhbTC12G5nMCUmbmr8
Message-ID: <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Junio C Hamano <junio@pobox.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 13:12, Junio C Hamano <junio@pobox.com> wrote:
>
> Perhaps something like
>
>  #1 "git am" learns an option to apply patches [1/47], [2/47],
>     [3/47], ..., [47/47] in order, and then [0/47] as an empty
>     commit to record the cover letter on top of that series;

So b4 - which is the "lore helper around git" - actually has something
like this whole sequence. See

  https://b4.docs.kernel.org/en/latest/maintainer/am-shazam.html

So "b4 am" will download the series from lore, ready to be applied
with "git am". That is - I think - the most common sequence for most
people.

But "b4 shazam" will do both the "figure out series" and then download
it, and has a "-M" option to them merge the end result.

And people do use it, although it's not all that common. The
networking tree tends to have lots of those kinds of series, but
outside of that tree it's _fairly_ unusual.

The latest example of this kind of thing in the kernel I found was

    gitk cfc584537150^..cfc584537150

but I don't actually know if Nathan used "b4 shazam" for this, or
whether he just did it all by hand and actually had separate branches.

I think one issue is that a lot of people feel more comfortable with
linear series of patches, and already have tooling around that kind of
plain patch series.

Another issue is that it does require some actual thought - it would
be silly and counter-productive to do for singleton patches (which are
fairly common), and likely still silly for things that are two or
three patches unless there really is some kind of "overarching
explanation" that makes sense.

Because often it's just simpler and more straightforward to explain
those kinds of small series as individual patches, and the
cover-letter (and the merge) just wouldn't add a whole lot of value,
and only makes the whole thing a bit more complicated.

It also means that once you've applied it with a merge around it, you
need to be careful if you end up going back and amending the commits
for new review tags (or typos, or other "trivial everyday things" that
always tend to happen).

So you need to keep things like "git rebase --keep-merges" in mind, so
it's not like it turns things unmanageable, but the merge model does
have real complexities.

What I think might actually work *better* is to have some help for
fixing things up later.

For example, while I think that a "git rebase --keep-merges" workflow
is a bit scary and opens you up to lots of possible things going
wrong, having some way for "git rebase -i" to *add* merges
interactively might be a nice option.

I've personally had the situation where I created some series of
patches and wanted to group them later. What I would do is then create
a different branch, rebase the patches I wanted to keep in one series
in that branch, and then go back, and rebase the original branch with
the remaining commits.

That works fine. And there's nothing wrong with that flow, I think.

But I tend to get pull requests from Andrew (and some other people,
but Andrew is perhaps the most consistent case), which typically
contain a series of series that Andrew has been building up for some
time.

And then Andrew explains those as

 - series of X patches doing ABC

 - series of Y patches doing GHI

.. and so on.

And because I personally find the "series of N patches" part to be not
only repetitive, but think it kind of distracts from the *important*
thing (which is what the patches do, not how many there are), I
actually typically edit that "N patches" part out.

Now, I think often having separate branches for all those things would
be fine, *but* there are often singletons in there where a separate
branch would only be pointless extra work.

And more importantly when it's somebody like Andrew, the series may be
"conceptually independent", but they are often all in the same area,
so they might all be MM - and they will thus often in practice have
some interaction with each other.

Having a linear series of patches delimited by merges to group them
and document them would probably work really well, but it would need
to fit in with all the other tools, and as mentioned, many tools
really do just do "patch series".

I suspect Andrew still not only uses git _as_ a patch series
maintenance tool, but probably together with the patch series scripts
he has used for decades, and he removes/edits/reorders/squashes
patches in the middle etc.

What this is all leading up to is that I suspect a more palatable
workflow might be to "fix things later with git rebase".

Because I personally think I'd use something like "git rebase -i"
together with a way to delineate patches by adding merges at *that*
point.

So rather than doing a separate branch, rebasing things there, and
going back and rebasing away the things in my original branch, doing
just 'git rebase -i" in the original branch and having some way to say
"this is the start of this series", and a "this is the end of the
series", and having git rebase create a set of linear series with
merges that delineate them might be quite convenient.

I say that without having actually tried it, but from a "I think I
would have found that useful in several situations" kind of way.

            Linus
