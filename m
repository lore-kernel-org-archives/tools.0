Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56B344032
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065881; cv=none; b=H0hm6zvGJYbU+lZXDo+9zEy1rml6XX56rRhCaYgf521SJZ5xnahKU8u4pe8aauxU+v05hWggqgTk6V7DDJ7kekBReiC6NUbCFKJzpWpyr+kTbG2QUF24udukIJQXrRqsEbxNkVUg1L5sWjNgqJ/QpFjM3tPr+KwRA+z/FWwLMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065881; c=relaxed/simple;
	bh=gRTyb5T9UABQ4fkE+NCJ9lMh1oypcvn2KMoHDkgOK9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnezCa8hnhSS0LBuGFTZtxFo2+/4DYOuBL/HYKyxFuVMhVceGkhGSobeYbfSKYUU5h4ij4o7x/LbzWPAaSazLi4l5MHlnGCRNDRboTI6nRKb8QVaPDbiXC6dd2drZLLk2qE7OAm0MJN/BM5jDccSxKXPT0vzL2cacusa6xsbw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX8TmGW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX8TmGW8"
Received: by smtp.kernel.org (Postfix)
	id 31AB7C116D0; Thu, 18 Dec 2025 13:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C052C4CEFB
	for <tools@kernel.org>; Thu, 18 Dec 2025 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766065881;
	bh=gRTyb5T9UABQ4fkE+NCJ9lMh1oypcvn2KMoHDkgOK9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TX8TmGW8yEhsjzo8wJznAk0cGt4jr+iR9Lk/mNnmU47srZhihcsVeYzAd+uyGQQNs
	 MDuEiAV4svWiSh0aJ7CwnDbzx5D0y6YVrJit/OKwPb/L4s+pyg576EvMErBrHBSnoH
	 CIknumIHvKR1TF30ISuO3V4z1a8Zol/pQeFqk9G7oLEhI3+40IYciao0toe17fpTub
	 eJ1LyVi0loAoEqD8FY2rwTXPnGPtzxICW2XHUBp3OZ5lc/0rTmwJBXV4V4Dg8Sj037
	 2KJuk9pu9DQs2R/ugGG0tCT5SPXyjqhwuszCCTZKAR+Uy8RA3tY6fGS61e++ZW90er
	 HlVe48Cz+7DeQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so1207751a12.1
        for <tools@kernel.org>; Thu, 18 Dec 2025 05:51:21 -0800 (PST)
X-Gm-Message-State: AOJu0YyfuYhRYMRTipU72y35a8fS34xnnsHrgXaPvGOANbsQ1nYDDcol
	VzJ/g9k9NVXOp+hO/ciDGiVVZHrEhi8w6tbAQpRKmpKN5hVoty9nSORbJ+igbmrD4qmoGZ13Xbj
	lL6JiLJo3Pp72K82gAwKxO9coiferUw==
X-Google-Smtp-Source: AGHT+IFUzdwVCQ6IZxpAFmxq/+Ke1emF6QfdNS0iNcMCrNdUahJy/q7mkxCzX/9Gfxv22B8ycnDbmlWdzYkISHa3qRY=
X-Received: by 2002:a05:6402:1ed1:b0:641:66cc:9d91 with SMTP id
 4fb4d7f45d1cf-6499b1eb230mr20406653a12.27.1766065879655; Thu, 18 Dec 2025
 05:51:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur> <CAL_JsqLSJ_f81fyOoCheh+9naXB_=BAoHLGUNB5MAGUjqdJULQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLSJ_f81fyOoCheh+9naXB_=BAoHLGUNB5MAGUjqdJULQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Dec 2025 07:51:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJbFvdZzRpJoguCwawD-OVOQpG+uNfnVhw0B8wNPRD2Q@mail.gmail.com>
X-Gm-Features: AQt7F2qiHgjU2s5a1JzAqK3rdGuV1x_2XjY4rRiClynhn1-rWvAvrTwalz-zyG4
Message-ID: <CAL_JsqKJbFvdZzRpJoguCwawD-OVOQpG+uNfnVhw0B8wNPRD2Q@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 7:40=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Dec 17, 2025 at 9:26=E2=80=AFAM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Hello:
> >
> > TL;DR: korgalore 0.2 adds support for multiple delivery targets beyond =
Gmail:
> > JMAP (Fastmail), generic IMAP, and local maildir.
> >
> > Docs are here:
> > https://korgalore.docs.kernel.org/en/v0.2/
> >
> > What's new in 0.2
> > -----------------
> >
> > New delivery targets:
> >
> > - JMAP support: works with Fastmail and, potentially, other JMAP-compat=
ible
> >   providers. Uses bearer token authentication, so no OAuth dance requir=
ed --
> >   just generate an API token in your provider's settings.
> > - Generic IMAP: works with any IMAP server over SSL. Simple password or
> >   password_file authentication.
>
> Is there any reason to use the GMail API over IMAP access? My
> understanding is only the POP3 client in GMail to pull messages from
> another server is going away.
>
> I ask because the GMail magic was all working until yesterday. Now I
> get a splat with this:
>
> google.auth.exceptions.RefreshError: ('invalid_grant: Token has been
> expired or revoked.', {'error': 'invalid_grant', 'error_description':
> 'Token has been expired or revoked.'})
>
> I upgraded korgalore yesterday, but I don't think it is due to that. I
> think it is some 7 day expiration for "apps" in testing based on
> searches with that error. But I don't see anything in the dashboard
> saying it's expired or revoked. Does "my app" need to be in
> production? Google says that requires some verification, so I didn't
> try that. Confused...

Now it works after this:

rm ~/.config/korgalore/gmail-personal-token.json
kgl auth

Maybe this is a quirk of app in testing and I should change it to
production? Or I just do the above once a week...

Rob
