Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524838;
	b=g7CBwZMJv8puQTiiH10jamRS24ovHQt1zVYxta+Y36S1waMhAUcJR3jpmPBG7Ug/aNXL
	 eNEEkL7g5sjfiyXVe1TDEkKfjBQhrYEY446mh/4vvN3Uo5wy4CtbmssjjCo2RBlVRgBku
	 YYpJhHeWToU0DStHZtuZgzqg+2Vogr/6z25Ex7J7JTt3kpA7EzWPCQa6Wqry75tFqVBVL
	 Hcm3fN1sLIJ4yoIwmwX1Uyrat/wunRCcHmkkesVbVM+w5qVF5vnrZeNXcetv5ZaDoVzE6
	 HqogPw+ZBtrLs014nft0sO8N5xqUJSkKwGS9TGme64BndN4HwOGZl/ONuxwOPlLkDOg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524838;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HrDvvJx6T5rBso2ctoka0x+M86nDkNqYjMXs9mt0r7E=;
	b=oUAMcRlV4pDEIzQMqVe+yrdFY1wT6CN30numKhkVg+iz30/P32xJMumGIZt7RP9+BlD3
	 DUOMRvqwS39s+bBG385Ne1ztiBOXIg4BlXjPPnVh4jBfcJSfRXRVxzD3CjsN1jXzw0L65
	 bXiritQZUE41kM9weUb2K/kUOZwY1bt4RHbgVYzwZENkgt/StnyEaElBpqwoBzKkXc3u3
	 d6tasHHC5br9Y0BdKD0wFIC9jHE8+Vqm3XvMde6ONJ1xJPWahMwq4um9bwq0DxGK949aD
	 wHagaxzp3cUkA2uVM0t+cpiFB0LgykKk530xQ732rtCTONxH5EGLDmUGScqVwXlUifw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vs9laIop;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD8606A321
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 23:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vs9laIop
Received: by smtp.kernel.org (Postfix)
	id AE8871F000C5; Thu, 12 Nov 2026 23:07:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794524837;
	b=O8IMPElI5D+S78Tze2jEwrVBb1tbSz0Nat+q2Ew7Y9tiRfEwooNI26c7Mdt+JqhKA+zx
	 ffRc+Ig6ZZRTRWgdwrje1PZbx/dkVNsO5IRHKO/2fMcfbRM7zWXzfElOHEE4mpFAu7v/M
	 MMoatsqPbI5IEeNN+fqynk5MqOAxwRmmh5Ktp8XJPiHxwTgUfeFEfxbS2SHdvoSaBwtm3
	 D0uIH0PKm7jJO8vBPKh/6HzOkPYDU4IWsqLWG937O9+lw7SNwVe7IPXxapxpaJ/HKBF63
	 tbok0IPsjCba0RLME3JynGq53KeUzYyze+jqd+zQZv9XMxPaFhgfRgwtIrUYnqM5/xQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794524837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HrDvvJx6T5rBso2ctoka0x+M86nDkNqYjMXs9mt0r7E=;
	b=Ho6r0+DbwL2nCW4rIo8FlM5xAko9DfjxDy/gcfx3/pPmrQicIF5jsqLlWU5RWKf4lx6r
	 fJeZaJ1idug8atOCzwP4yumIBLVB4+F7PpxtjRvfYgvCBz164SF+5KvOiLTovEuDQ0zyI
	 lgR4UBFzTEfs1MiGaYZOrwNixj5xiTmWI+Uu6PyBLzrfD1hlDN+Dx3mFV4P4UIMfb+OvZ
	 euxF7gDivXawpuamWyUN20sz/vGm4HcgDCpG1BSMANM/TO3TDd4hqUBL7c7+pZomuyjcg
	 4ZVh+anG8udrCvPiP4ZEWN8tHXbv9oH91n181YZZLbw+7lj9V3iVdzwHyel0DIMe0Dg==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vs9laIop;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E53261F000C4
	for <tools@kernel.org>; Thu, 12 Nov 2026 23:07:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vs9laIop
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E53261F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2dc9a7b52so366732137.3
        for <tools@kernel.org>; Thu, 12 Nov 2026 15:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524836; cv=none;
        d=google.com; s=arc-20260327;
        b=X/FGNtD5K/voGxq3RE9CvF4hCUmGW1fwWOb3MwXnYGugcub/ks1vrjQTCofvxHla/z
         J/9N9p4DShd7z+c/cyq6GYT7eSpDMQ/0THn8GItmw/mXc7dBh/7mR5E2j4gzYNXGfruR
         9QokDw5t4T0eKxHw3NsD6bOPG1hkI8ruRJ8aHgGFwx0ky4fK3PLf7201cY9LdKTjGTWT
         hdOK48TRLEufAsDFohkhQM5/LzuzeirkBdJ/ayX9F74JOvb32xCvtb0O25h6ZH5t37qd
         nZtF2+j7F0w7nbUvugM+HejUUQQa0Sc3PcYbOwNuhkHPve0TmW8C1IIh/no6mShr7nTd
         pyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HrDvvJx6T5rBso2ctoka0x+M86nDkNqYjMXs9mt0r7E=;
        fh=IJqJYq/8aA5bZ5zN54OMKN21XKKG5OJ3sR8aAJnlCLI=;
        b=iIfaJSlHWIxxA8gHJWBmWEnq8MJvvGTHXs7u1m9vGtlvw1Mx4NDi4tWJqSDyNkqGlE
         QStx8zCZeVTP78JQ+YLYILqIcloFWfS6995vLJ5hNaAjTIFcaOCY49mP5xdCpPQj10qO
         G1EuJg47a3yqw50Y4upQnY5CBkcG4YPXEPbhYwZOYYgwlg37YIPWFPVOdvLrA10BOCnY
         BEUBYoOLVD8GEYt0zLmewSTCfp2AC2avFNpygVLsNtHvrMJl1ObFThsJZk+JqzZAzOEI
         +rgbQHokA6v0+YIlxbFgC6M/p+bN6PrdCBHFfnDOniHjbo6FXDMr6387zlAWiQGN1Buy
         zuBA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794524836; x=1795129636; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HrDvvJx6T5rBso2ctoka0x+M86nDkNqYjMXs9mt0r7E=;
        b=vs9laIop10tJvqbMrFHfgfuN+63eqRtSQpoAffBlR7+0l2IymiNcIabS3km2MAUxn5
         QPyZVz6pfa/dgPSIN45pggs4VudRSl0rryB+58N6bWgZPqAxaqbQ1EBCp3Y40yUsxTg5
         6lka4igdLFhVxkm+1vWDPJy8o0yyPEJAwEQdKYzNCaHVwwFHNjJR5H295Gi8BeO28BPh
         wbwhHGMBHEoGX5Pi/ToOW6hinzzpLjE9GMBPWpxIf1j6dtAh48GoS5AQ3eZKGURmxy/J
         e6GbLVjBveLJm6rbA3tTSHMySa/KCcHouuLT6bYZogxmK3jL5S0ze4dAo12zXiEDWCWB
         WlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524836; x=1795129636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrDvvJx6T5rBso2ctoka0x+M86nDkNqYjMXs9mt0r7E=;
        b=ZQoaWJBCxUielOtKJmwBJWNiLeTNmqAyIGvPn9aShDhBctBzJWLI43SH+Ug2LQfs6c
         zU4gaF7ZhZpUnt/iezx8d5C6MMkVY2y/qBL/TpyzfMrO1bdvbRR0nP9f+Ow/bX+jYe3b
         28+1JtCzmPBxsd5AN0aA5yo1r4yUpCxbLTiN0lwVX9o87WQKmBuvK1KjnqcwCbALe+Nf
         5ySWV/wXEs5NCr4WHvnFkQMLYeU0vMoCtmrPm8j7KaT06sa3lZiqDD/LVUCx5kZSGts2
         LCXxNIl5Jb200YqH36XmG/VgQtV7FD6LXDcur558L3VUxJX3VDodE10NL72MLu8vZ2CO
         LuLA==
X-Gm-Message-State: APuU4Z9CCNYh0KNm+0rBSV/lgbrrMwUFaOlMtYmE41b7vCydizXvPkKv
	yfbMwZ8kclhy3F6Mhy8AEZFhBSHrroiZwejR6KY8VgSc6wubOmqTynWfC+9f0+FVD+jBNP9oDbX
	iN+HHWI+wNZUlI/xfA/Nm4opst7UHAFWGCPNfULM=
X-Gm-Gg: AYBFou0ndBzdyftgmhi/zQMAxzCKD7xj5HwMJskklkrIcn0qEeAuy2PMMo2JxB1r0Ky
	K6NlNmwhQd8iS9+RjP1VDz3e8OgUJFfd+9b8MWrDFNrhqODvQw0jGrf89a8q6CvarYwkvohTEZa
	Z3sZNvWzgIQCkkCzDwqy5dYzLAX8Rc0YAQKAGEe8YQZPYUfYTnlHwDEVhx0fj2L9ly0H61+7o+S
	+kTINtmZSEe6NIAh7BsRg3q2Ea9KB7t2ID7S24X2ayDyZp71fKkowyUL9Q5cV9w4C66BXaghs+m
	o1XPPOB/4iv2uexj5L8FAPkuERPEpvWcXYeIiqi5LTb8LjxIX3y0MhZS7YN8pk8G81vFHGT2ABZ
	BYhRcHrYP6zUuQSnePAj/68MVQxvXGTFRTNy/IqU1Jq9QK6qP9iqjL+HE6hYY4wVTc3YPNBZOP7
	vXPis+DylXll4cITjnLuGU67MUTZ5M5AHxvdW5lmNWUUhXJ7L8B0JCdHNPfKS12VDIwUS1VUfhe
	KQ8vlzlg99wylVw8ghhREOd49vSqA==
X-Received: by 2002:a05:6102:5791:b0:7c3:1898:e8e2 with SMTP id
 ada2fe7eead31-7d64d6ed858mr279862137.13.1794524835800; Thu, 12 Nov 2026
 15:07:15 -0800 (PST)
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
 <179451279186.1693101.3646569244001837281.b4-review@b4>
In-Reply-To: <179451279186.1693101.3646569244001837281.b4-review@b4>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 16:07:04 -0700
X-Gm-Features: AclHuK9btJBI0Jtav2YlAy3whlu-8ZAir-uoc7xVUodGIVY_IwE-bGBBe0EMWL8
Message-ID: <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>
Subject: Re: [PATCH kgl] Preserve original dates when importing messages over IMAP
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:46=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> > IMAP APPEND currently omits its optional timestamp, so the server assig=
ns
> > the import time even when the message has a valid Date header. Archived
> > messages consequently appear as newly received in clients that sort by
> > INTERNALDATE, including the Gmail web interface.
>
> In general, I would consider this a feature, even if this was not really
> intended. I would specifically lean on this in a scenario where we
> perform a "yank" command -- someone would routinely be yanking an old
> thread and they wouldn't really want to go hunting for it in the middle
> of last month's mail.

I checked the other targets, and there isn't currently a consistent
date policy across them:

- Gmail API imports already use a valid Date: header. The target omits
  internalDateSource, whose API default is dateHeader [0].
- JMAP imports omit receivedAt, which defaults to the most recent
  Received: timestamp, or import time if none exists [1].
- IMAP without an APPEND timestamp uses import time.
- Maildir preserves Date: but creates the file with an import-time mtime.

Consequently, importing the same archived message through Gmail's API
or through IMAP can give it different dates in the same Gmail mailbox.
Preserving Date: for IMAP would align the normal case with what the
Gmail target already does.

For historical review, leaving APPEND unset seems the least suitable
choice: it introduces a date unrelated to the original discussion.
An old message can appear with today's date in Gmail, including in
the attribution generated when replying.

Thunderbird, Claws Mail, Mutt and NeoMutt default to sender-date sorting.
Gmail's web interface uses its internal timestamp, while JMAP inbox
views commonly sort by receivedAt. Keeping Date: unchanged therefore
doesn't by itself make those views agree.

Making a yanked thread easy to find is useful, but assigning import
time only achieves that in views using receipt metadata. It does not
move the thread to today's position in a sender-date-sorted client.

> > Supply the timestamp from Date, falling back to the first parseable
> > Received timestamp in header order and then Delivery-date. Interpret da=
tes
> > without a known timezone as UTC, consistently with the digest parser.
> > Retain the server-time fallback when none of these headers is usable.
> > Leave mbox separator dates out because public-inbox exports may use a
> > synthetic epoch timestamp.
>
> I would flip the logic here as well. If we do want to enable setting the
> date based on the headers, I would go by the latest Received first, and
> only then fall back to the Date: header -- spammers set this to years
> ahead precisely so that their mail would stay on top of your mailbox.

This doesn't appear that problematic, if spam stays at the top of
the inbox it's going to just get deleted by the user.

We could address that by rejecting implausibly future dates when
choosing the import timestamp, rather than preferring Received: for
every message.

Received: is useful for delivery chronology, but transport delays can
reorder patches or give several patches identical timestamps.
Public-inbox explicitly prefers Date: for thread ordering because
git-send-email increments it to preserve patch-series order [2].

> So, my verdict is that I'd make this an option settable per-target with
> the current functionality as the default. It could be something like
> `set-message-date =3D yes` and it needs to be implemented in all targets
> that support it, not just in IMAP.

For historical imports, Date-first seems the most consistent policy:
it matches the existing Gmail API behavior, lore's thread chronology
and the sender-date defaults of the clients above. The selected date
could be supplied as IMAP's APPEND timestamp, JMAP's receivedAt and
Maildir's delivery-date mtime.

An import-time mode could support intentionally presenting archived
mail as newly received. That would need explicit handling too: merely
omitting receivedAt in JMAP still selects historical Received: dates,
and omitting internalDateSource in Gmail still selects Date:.

I think at least for the IMAP case it makes the most sense to just
use the Date: by default due to all other options having more
downsides and consistency issues. I think using import time as
we currently do for IMAP is almost never going to be what we
want due to it having by far the most problems.

[0] Gmail=E2=80=99s discovery definition specifies dateHeader as the import
default: API definition
(https://gmail.googleapis.com/$discovery/rest?version=3Dv1).

[1] JMAP defines the omitted receivedAt behavior in RFC 8621, =C2=A74.8
(https://www.rfc-editor.org/rfc/rfc8621.html#section-4.8).

[2] Public-inbox explains its Date-based thread ordering beside
sort_ds() in View.pm
(https://kernel.googlesource.com/pub/scm/infra/public-inbox/+/refs/heads/ma=
ster/lib/PublicInbox/View.pm).

>
> --
> Konstantin Ryabitsev <konstantin@linuxfoundation.org>
