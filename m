Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4793C34CFBA
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 21:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762376970; cv=none; b=NfoxiwNh58/zR3IXd3XCz9K23JVrSkXz+ba+tA5yDWRgZ7oMT0wKW+ePDzRS3iaI7va6ogh/EUIXbVnfxvOvN5nYg4TtzZO7w5EqrT3eNHI5obPQXLyKqSxjK8qGGptXVPQXqQ2Ym8n4/OvDJhKhpq7WcCW3MsbfmgMSY/+kQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762376970; c=relaxed/simple;
	bh=+zET1aYsbBKju6NSBG/qKByZxrhwTtq0PhB9udBw88E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e399SSM7gqPDXhNQeB7QjrroQ7F2czS7HYKqmBftbVbBkTPISbyiI5cqLwOCI618f6KK9GKgp/YUrNU/4ISkLgnfVKrE5xOwy7q7JBO9Q1gATyGlgCZ1Wt0cP4YEUz1/YqEeELLGlr/kycwmnqUipciRvhKrrpM7e0EeJSuaITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=E+D4zXKW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="E+D4zXKW"
Received: by smtp.kernel.org (Postfix)
	id EE249C116D0; Wed,  5 Nov 2025 21:09:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A36CC116C6
	for <tools@kernel.org>; Wed,  5 Nov 2025 21:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A36CC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-294df925292so2874025ad.1
        for <tools@kernel.org>; Wed, 05 Nov 2025 13:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1762376968; x=1762981768; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CKxnYp5TMaquWGxm3yQxrQga4QUHJi9cYW2e+kP9QU=;
        b=E+D4zXKWSsO0hOvlivklDn6xMHm4I85L9DWYrwBCp2gTFEoAuJhQ2SpAVowp+5xO+5
         Ji4z1zfyXrbT4qAqg/qkBz+mVptfbxHIux3fvRLkOJ33u5bPSVrNSbrTFZWNl/tu420R
         /zc3b9VrUV2kZ0IY/9oLUqWL4u8qJePajO5nf15okUa8NJA8ESDSEmK/Buzf1aHuhJI7
         bYdpoLIxGhykS5eo3i8o2cOR98bSReUzNRKFrMp2BWsfjw1BJ00oFvUCXPqn6EbKRzw4
         +vHF/zWGZsI8bbqDP/PWibdXnnqyDV4BuGJClxQqr6e5s0QsAO+c+/CAOVknM7eb6rPJ
         8/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762376968; x=1762981768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CKxnYp5TMaquWGxm3yQxrQga4QUHJi9cYW2e+kP9QU=;
        b=OdKFGQiOOSYhYRIQ8c85/8cVNupmSmfTVrJUjo7yKqM9oxT6PF911dH131YovmXbX6
         nqCjDA6n0N//FCF7yTl39mv3ePaTDvl9A61UVRMTUTAGRbSgZSMgW7AwuouSpo7xSnIS
         6sHqI9GFr6dLwlYihImqJNAjkE1BmYvvp96wTGjNUr3enD/IVE5nUBxvzKiZpq/K8ksI
         nUovBDZUoopbWRjjb1df9Xd1XW4A/xkyusg93PvEolC7EGdrBwrMw2/paU0zpLYFmXVJ
         wZ9u0NHdEnl8nN4cP1HAjDrpXjH+5jCtEBsPvw9FiFVjUkkEuu2sIfTUpTaRgFRYG+v0
         H5WA==
X-Forwarded-Encrypted: i=1; AJvYcCUM4WVLeVXYEyB2hAtzsVZrxJIEDRXJ1MDD24jpcKm5Z89l6akBwpDJMuvlxUBpnDA8qGFekg==@kernel.org
X-Gm-Message-State: AOJu0Yw8lBpH6/KrW2Ain0DY9NDKdm9xjVP0rbfe2VZn1m6sUbEpCf2e
	+cIj8HQ0ncmi98PYbzaQy+bSHx29sLSt9TomeBLR7ZTpiWpimlNeWAJe9dH3BIUaBzGEFcXZeVJ
	gL5ONFfaQbj526PSi6Jgl6xLwvpFpm2SFclcLQUP6
X-Gm-Gg: ASbGncuc0DfC5rYwMeJswWgjFRWHkdho2kMEn0sTXNv0weMgm49nmpy4W4kQsiZ2z6K
	d3yfuTFNwonYN1wM0D8K6wX9dYlZSP+oc9jj/gokPU4cBnAQoiWTyCwh31GY9DlbEn+/kY+nTzf
	tHizKPTcXMCNbuJ3+OC+JBNS4durrzXXueoxBWa/Y3y9GkTPiine9SJgs6n/ISaZ2Q/yhoUEEgs
	QlQwbZuPBv9xM608bt5AchEilJV3ryv3fOKwHuzhsemUKr2tvJ1XHabGzRg
X-Google-Smtp-Source: AGHT+IHXpL9+dADjSCYbV8B+cgKcxk0iwPj/2iZJF4Ql0PGrTNuIupZeoCBtHqD1FERBX1glpsaV3LJy7kKhrt1nsoU=
X-Received: by 2002:a17:902:da88:b0:295:fc0:5a32 with SMTP id
 d9443c01a7336-2962ad0c13amr71859615ad.3.1762376968223; Wed, 05 Nov 2025
 13:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
 <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com> <20251105-fancy-frog-of-pluck-f4e7bc@lemur>
In-Reply-To: <20251105-fancy-frog-of-pluck-f4e7bc@lemur>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Nov 2025 16:09:16 -0500
X-Gm-Features: AWmQ_bkYPA2Jk5brsng95ApEIzRkTtL2_N9XwH0OLgOnx0pVmHBgCZ1sa8MfT1g
Message-ID: <CAHC9VhT_YSjXc0uz6ZAD9DZB=gvmx1-8eEUtm=hZ_zDzL4zzDw@mail.gmail.com>
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 3:54=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Wed, Nov 05, 2025 at 02:12:44PM -0500, Paul Moore wrote:
> > Thanks for this, if gmail throttling continues to worsen it's good to
> > know there is an alternative.
> >
> > I just did a quick scan of the docs and while I didn't see it in the
> > Quickstart or the Usage section, I wanted to check and see if there is
> > support (planned or otherwise) for pulling/importing specific messages
> > instead of an entire list?
>
> Yeah, okay, here you go:
> https://korgalore.docs.kernel.org/en/latest/quickstart.html#one-off-messa=
ge-import-yank

Excellent, thank you.  I'll give it a shot this week and let you know
how it goes.

> Note, that this won't (yet) follow any updates in the thread. I may add t=
his
> in the future, though, something like "yank and follow until there are no
> updates for a week."

For my selfish use case this isn't likely a big deal, if I need to
pull/import a follow-up that I wasn't CC'd on I can always "yank" that
message.

--=20
paul-moore.com
