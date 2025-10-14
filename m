Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C09235072
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760468961; cv=none; b=tRQZaN22EQGXZvIPzCBC1UMCISbU/IBGZYwVXH1MZHdIBsE3GWdRrne3vtv8EVnimYOwnjCjtuAGk6T52aTKcGTkHfhc2aKoeLuCTxd8vZANExFhm6py/m/+6DuU9D283JsjzKM484uQMwuNOkUTEY+wvJfSuRdJffTZEXSwuPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760468961; c=relaxed/simple;
	bh=GqWpHgGAqxSxJRevSXM4pKkOpBAECaYHVocQxwkATp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfbjbaWCWT1MSSepAwO9duZ0VbZuzlUYGZr9H8D/9WIu5VS5pP8QUipWgX43Q1Hgihh2sA7BG9JwjKtdKfmz6mKGL6mupmUMSMAHAEV9zpHY5MUCzYf8GUuRPlHdtWmhtyPZ7HNfgmYr11EX7xjUpHCaYkWH6oizE4GsGtLmSiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Le4Ni9I9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Le4Ni9I9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760468958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qJqjs0k8K8UKo8Xc5Jfs0LoIQi+RFUpWJHH9mdjeXg=;
	b=Le4Ni9I93szSvNDdsgM1ryuB4AVir1VSSOqHX5c0dYJXmRC34u4qUonhbpXk4IXNmYXwUO
	QW/yxDu9kvri08EaJD1wHl4zEOB9EeU6PgDdOurZ7OOfaax1Oogtj1hNYSTFtq8iBHjrmS
	21A5a+LSyiuyns0PzrtFRVyKur6HoIg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-ljUOrx8gOMu3UqeV9qsqEQ-1; Tue, 14 Oct 2025 15:09:16 -0400
X-MC-Unique: ljUOrx8gOMu3UqeV9qsqEQ-1
X-Mimecast-MFC-AGG-ID: ljUOrx8gOMu3UqeV9qsqEQ_1760468955
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-401dbafbcfaso4569535f8f.1
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 12:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468955; x=1761073755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qJqjs0k8K8UKo8Xc5Jfs0LoIQi+RFUpWJHH9mdjeXg=;
        b=qt1wwNh9v6kl/52HsLixXxNm3eQJw2xnpwRAZuBk0Pg//LMWaNsp3k5q+2fMFka8TL
         KdNWKhs3734PP5a4QzgX9j+VaVIMCOb11KdvDIap2tfcJ80MGdFzfJYfHUhkKXLHiMBE
         q6kWctkw3ZF9UwxtSQjKZVn45Q3ZuigBjXTISUrnCuxYgW2wuh4n8n2SCkcVn5z0TBa2
         /p2kKlY9z5ZI2MXP1zlVgEVwWyoB6Efdze8HfkBUqbUnBKbsarO5XjYF+h8ACLdN7Zb4
         ixS9efDPNRT5Q4kxJohOhGHmgE4nevCT2Mg78k8GI+DHxXyJ7qwgQwYDnY6oDIbn96N3
         tGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8mDmXm4sfH5EdomsDk1OfwFnOJOjZAcXl4/CiPFeukkrJ5xUI+5nB3VhD4EbqEuFXazk1Yg==@linux.kernel.org
X-Gm-Message-State: AOJu0Yxtkp1zlTdgN0ecbFUN6ziYhLh7J/yzPQBmD8Ovx4prJDgT2VMG
	HGPUSsF1iqbscVGw6Af3QQQKqJDR1fYPt8hi3Zk05Ir3Wfm9GdMv09AzHCP+PldyBITEGGyAJi0
	TuhQlRCutvvtHd1DwU/BYed3wKVPChYWL16wKJE5I3hrC0oXJbv8cCeJXwz0hM4EhQcHYvZIyQ3
	9g3vccm8mmIt2lDY56oxr17V9thw05nd9M
X-Gm-Gg: ASbGncu1Os7XVV5JazJkqDpjIEZne7L6Aecypwx56xyUEMygB+himCRU+w7XrfF0znr
	XHImtd+fRdNQpD9/zVpymHVIb5D3jobMSStIAEqWnJkEzuCnICCVvLgzMa47OakY449eVsRJnx/
	hzKgSCzMqZ3AGH+jQmXku0/Cjnqv77FmAA8rWNvXRBav/ir3oj6kvx2RXyrhfVFZqaD3w5yF+5+
	Q5JD5jiBDk9L4nzcUdIeiQ6
X-Received: by 2002:a05:6000:40df:b0:426:f412:dd1f with SMTP id ffacd0b85a97d-426f412dd8emr1443168f8f.31.1760468955387;
        Tue, 14 Oct 2025 12:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwD0yDhnc2D6cgjINXKn4VYgC794TikjqZbFzIIRYnXcbAlGZRXtw9lLGRUnKnqafsZ2ylypeFEGHIye5nZh8=
X-Received: by 2002:a05:6000:40df:b0:426:f412:dd1f with SMTP id
 ffacd0b85a97d-426f412dd8emr1443159f8f.31.1760468955002; Tue, 14 Oct 2025
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org> <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
 <20251014062426-mutt-send-email-mst@kernel.org> <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
 <aO6Q8A5DKNA-g1Fa@agluck-desk3> <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
In-Reply-To: <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 14 Oct 2025 21:09:02 +0200
X-Gm-Features: AS18NWA06z3IOIr4HtKWe8KUM4Ug2yn7F6rkmYxmxQzk5zp1X1co5-TXNQnrxkk
Message-ID: <CABgObfa=YYPqUSUF9L1TbgBoB87T5cMS0mNtQr-LEn3EJ3ynrQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BubR8rSEHhYETtdxvDsuT5W0ylFX2Cs0yeXRizWR1SA_1760468955
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Il mar 14 ott 2025, 20:41 Linus Torvalds
<torvalds@linuxfoundation.org> ha scritto:
>
> On Tue, 14 Oct 2025 at 11:05, Luck, Tony <tony.luck@intel.com> wrote:
> >
> > While there may be many archived e-mails with the same patch-id, the one
> > that was actually applied is "special", *if it is part of a series*.
>
> No.
>
> You are arguing as if this was a "one or the other" thing. And it really isn't.
>
> With the link you only get *ONE* submission.
>
> With "b4 dig", you get *ALL* of them. It's not like you lost the one
> that was applied, you get more information.

And no one is disputing that.

The point is that there are multiple reasons to "interact" with a
committed  patch via email, but for the vast majority of cases, people
only need the exact version that was committed.

If I see an oops in an unrelated subsystem, I will gladly spend some
time with "git log -p" and find a patch to reply to, but after that
it's honestly not my business to investigate further, look at past
versions and all that, unless asked by the maintainer. The maintainer
will use "b4 dig", I won't.

Moving up the maintenance hierarchy, less and less code becomes
Someone Else's Problem, and that's why you are quite literally
special. If you end up looking at a patch that was submitted and the
history behind it, there's a much higher chance that you'll go past
the simple case.

You're focusing on the 1% case and discounting the 99% case, just
because (for good reasons) you see reversed percentages. There's also
the fact that "b4 dig" could start digging from the message id (like
patchew does), but that's secondary.

Paolo



>
> And I'm arguing that if there were multiple submissions, those earlier
> submissions are relevant and interesting and often have *MORE* email
> replies associated with them than the final one.
>
> IOW, your argument seems to be "the applied one is special, so it's
> the *only* one you should see".
>
> And I'm claiming that's a completely bogus argument exactly because it
> claims that the one that got applied is *so* special that the others
> don't matter at all.
>
> That's BS.
>
> Because the older copies - and the series they were attached to - are
> still very relevant.  The discussion that caused a v5 to become a v6
> is not irrelevant just because v6 was the one that was applied.
>
> In fact, it might be very relevant indeed if it turns out that v6 was
> buggy, wouldn't you say?
>
> This is why I think all the arguments for "the applied series is
> special" is so utterly pointless pure sh*t. You are literally arguing
> as if some "b4 dig" wouldn't find that last version *too*, and as if
> older versions suddenly became irrelevant.
>
> It's intellectually completely dishonest and pointless to claim that
> early versions aren't relevant.
>
>              Linus
>

