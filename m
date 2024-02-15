Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811013EFE0
	for <tools@linux.kernel.org>; Thu, 15 Feb 2024 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034173; cv=none; b=QqZggMWl2xdOYWcHYqsqmzV4g+CagMD0jSWpCgTXrj/R0Z2cLSgXm0wTqWRmBay0/v4BemIt+QUZlsTYojWqmym4snlJahwf1KqjrQO4q8qCEJ9C2sTaEr1jFE+VUv/M+EoPzcQfC8gMZ2W1hceUlEGBXG39psXyJc9lQYYzCwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034173; c=relaxed/simple;
	bh=3yNevusGZAstHmG2p46Xq74gxrzY5HrEUCG+AcA6B2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4G2JGxBoB9jlMSvj/F5MCFySF1FqTMuwbTAIX52tS6TiOZn+rRKLYH6VpN9JgEHsupa1ES9bmIGuvAjO3vQhBrXXqVZ5HJB3w41TVqxfEBcMBNkyL7p4UilnAZO0zy1VTe8YiqgZQM3umyEZe1upvoHz+E6UH1P44iguOa56Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Qimi7MPs; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Qimi7MPs"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db3a09e96daso1217053276.3
        for <tools@linux.kernel.org>; Thu, 15 Feb 2024 13:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1708034171; x=1708638971; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPisyb3ERLxYXO1S9iW7eGsiu0wdu1jjayBXbug55iw=;
        b=Qimi7MPsz4OW7p7nW0EoCvRRYHKY+Z5i/ZdR8gvqhnuQBl8nVW+fOPpSDiiUS4gDnp
         GSdqo2c+eaKUGoNle0HpNCAjNWuIjTFprdLYuxboLv1vXYXZis8ncNHuwSE2yedjTxvX
         CzfK0hmHkQVDPkJIdQLQ7BCyK3GCds8MMTNhecOLCM1KX/cFW568VSlyV7/LtrNMfm3i
         C4+GWKtH/g8+RL65qzmPGNQZ+7FGk5Uz68RzVepPiozc0ehcTvCZtQE2oMqZoO7tUgEQ
         I7gGwKAw8pZti3NnUblJqTuO0nf1qDpE1+0ti+G8SPjyLaiWpwSc/jaMxf5+1/XMjD2G
         WhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034171; x=1708638971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPisyb3ERLxYXO1S9iW7eGsiu0wdu1jjayBXbug55iw=;
        b=Y0jRjljL+7s9JeDaSu21Zt+l6kehormMvE6R7aJPLffa5+HqtB7ngxfizbsKaZZGki
         Rv0ncTH2j7PDIY4ONNpp/Z4k8gAsDjlvFwMCrjqlXBn8xrY2MAeWSweO8YoXaEPdGmFV
         /ILCkQO4g6iGosyB2LTi31K7oMpZVET02TePhtJ9zhiyprdNzB6D6phuIStuewJpUbw8
         V+KQ28t8PorGiuYgXylOU6JWmRT9a+ws/BPI+Sl4G2evQQtPULlumdKem1UtAVK30tHj
         YaYBwK/pnEzb8K2DFTvbLGrt1jwyI9osUhtHeK450d6N3pF4CUjuHhVFqju+C5vKZkh6
         pd4w==
X-Gm-Message-State: AOJu0YyKGXRI5QSKoOHqLwmFrWHMHxMBdoVeuKsxxEL/MCLK1clvplhL
	WPCRAiVsYfnyJh3MTq0Nosoh6yUrKKnvWJNKOe7LBSq7DfU21bGL8SuEZFb8/W5K9uIhBeSThdA
	9lwdvooaqshFO2MwRRqHGUIzxN2Hp0radyTX8Nk4C43WexvtXZw==
X-Google-Smtp-Source: AGHT+IGSOL967OHvWvAlrNbwSAMs0EsW1cdP1vOcJ/HbHhHke8PuRm0DNuIoisweeCEelqRdSMEkVdM+74+lcgiV/eA=
X-Received: by 2002:a25:8750:0:b0:dbe:9509:141c with SMTP id
 e16-20020a258750000000b00dbe9509141cmr3045554ybn.30.1708034170890; Thu, 15
 Feb 2024 13:56:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur> <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
 <20240108-urban-nice-hyrax-a0ee5f@lemur> <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
 <CAHC9VhQTVZtY-9VfMunERWnEZ7ReDkYRm07QGsmEYwyU3DC7JQ@mail.gmail.com>
 <CAHC9VhSXHKWHSBiLQjD73emXSrLG8J7DCYLqEuBhVcgZezZOfg@mail.gmail.com>
 <20240214-tall-xanthic-chicken-1eb62f@lemur> <20240214-boa-of-nonconcrete-flowers-2c94cb@lemur>
In-Reply-To: <20240214-boa-of-nonconcrete-flowers-2c94cb@lemur>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 15 Feb 2024 16:55:59 -0500
Message-ID: <CAHC9VhRt_F9rYEPRtsnbUO4tRN=Y-u7pn5Y8X9N2T2j2+ONnKQ@mail.gmail.com>
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 9:57=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Feb 14, 2024 at 09:13:56AM -0500, Konstantin Ryabitsev wrote:
> > > It looks like some time of check should be done in the patatt example
> > > hook to ensure cover letters are handled correctly.
> >
> > I think the real solution is to fix the bug that's generating invalid h=
eaders,
> > not to work around it in patatt. If it's not a bug that's introduced by=
 stgit,
> > then we should take this up with git proper, which I might do anyway.
>
> So, after digging a bit deeper, it seems that the real problem is that
> 'git-send-email --compose' generates a cover letter template that's not w=
hat
> is actually going to be sent out. The trouble is that it's then passed to=
 the
> sendemail-validate hook without actually being a valid RFC2822 message.
>
> I've added a change to patatt's hook that will specifically refuse to run=
 when
> it finds evidence of the cover letter template content. Even it it was a =
valid
> message, we'd still be wrong to sign it, because it will obviously going =
to be
> modified before it's actually sent out, so the signature would end up bei=
ng
> invalid anyway.
>
> Paul, would you be willing to test out this change to the hook?
> https://github.com/mricon/patatt/commit/60309eefca64e34a8c15615f452354718=
24f891d

Of course :)

Unfortunately I ran into problems:

% stg email send -a --to=3Dme --compose --dry-run
/tmp/tOrGhxHdTV/0001-XXX
/tmp/tOrGhxHdTV/0010-XXX
error: `git send-email`: patatt: E: The following required headers not
  present: from
fatal: /home/pcmoore/sources/linux/selinux/.git/.gitsendemail.msg.2ZzrjD.fi=
nal:
  rejected by sendemail-validate hook
fatal: command 'git hook run --ignore-missing sendemail-validate -- <patch>
  <header>' died with exit code 1
warning: no patches were sent

It looks like keying off the "^GIT: " string is not reliable.  I
believe git/stgit strips those lines before passing the commit to the
hook.

FWIW, my current sendemail-validate (minus some comments to myself)
looks like this, which is based on the git template and it appears to
work fine:

% cat .git/hooks/sendemail-validate
#!/bin/sh
# patatt signing hook
# https://github.com/mricon/patatt

# https://github.com/stacked-git/stgit/issues/414#issuecomment-1937368793
if grep -q "^diff --git " "$1"; then
        exec patatt sign --hook "${1}"
fi

--=20
paul-moore.com
