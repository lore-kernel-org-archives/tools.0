Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55173334361
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065247; cv=none; b=TwnQbpNe6CcPHau8Az0mW6ZkNKCaivRw7Qg7hRTKHxd4jTvpsLW8o/VuScE/Mp/nSLIU7VtrX+XwXF8Ws9oPVMkS8WNHnRV3Ui+Vf1TEGYDzgkEkchPYd8xvSMn4eF0PHSqHAQVZ3G6zDufbYZRtknDMe8yLEQjTsUQI/oIOiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065247; c=relaxed/simple;
	bh=FOH2ynALxbbwR1KDhvW0mI2t6ETz85kIcClhYn1wWW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWGbRuk+rUy14i58OOL8jDp6B4wT2tryL5RfphSIn2Va2lyKuuv/S8sueNlMKp00hn8EkqQn1K4yD6tZ9JzRyau2mfFxcoI28xPjQF86G4A+/vLZxJhIJ56tLIIQHt8RyKDpjoxcHCB9U+EPsYnuMSA93MxABJeDRthccAK7wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NONNEfaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NONNEfaF"
Received: by smtp.kernel.org (Postfix)
	id 0ABD3C116B1; Thu, 18 Dec 2025 13:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B87C116C6
	for <tools@kernel.org>; Thu, 18 Dec 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766065246;
	bh=FOH2ynALxbbwR1KDhvW0mI2t6ETz85kIcClhYn1wWW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NONNEfaF6cEMevqFfMVDyiolVyOoSENltZKkd9icLFNGDQUzW7RYkuvAZNkWENf8L
	 3wX/y3HMZqO3dVsplq5oP6aLYWHkpaMa5My45LT3PcAjm4ULiiLdqN6+kj1QVTiD2i
	 uZbPFctbZKwRFU2bTmyODaB58N0mUpfEnOC6fzV/+3FzAe7I/PJCJiClmzGbIGlXud
	 iba0LtaqpgsS9d9FfBR//eAjJB/jGjW5XJi+SvLPlStOeClMyQWmeuLMjFsKiqxrOW
	 0kPLmlzRokcjvD5igg6XgvP20bopaddetrXsr4KQ7VpLMCYBZ8lVttuovr9+bOsFFI
	 zYtnKLA600fWA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b7a38f07eso493126a12.0
        for <tools@kernel.org>; Thu, 18 Dec 2025 05:40:46 -0800 (PST)
X-Gm-Message-State: AOJu0YzhMaRibGs3la72WN589GcWut3NrxthqnfHcPw0MfZ3riWQbd5Q
	WfH7wraBl/30UQhzypREdUxjNt/jJ21H8VaBWbJVeZg1oTx7nvhDisA35XRKo8oQaaAdFQplFpc
	ZghDMnVMHm1w75QeD5wND92qrPiiNBw==
X-Google-Smtp-Source: AGHT+IGwYpKayxCnenMpREov584Nzzhpxpoi2NZbAmgeRaOgzCllqRJ+qwaQ/ZvoZhJT/rmNa/3GolH/wwNq9h1E/Yw=
X-Received: by 2002:a17:906:eec9:b0:b0e:d477:4972 with SMTP id
 a640c23a62f3a-b7d236694eamr2334766666b.25.1766065245524; Thu, 18 Dec 2025
 05:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
In-Reply-To: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Dec 2025 07:40:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLSJ_f81fyOoCheh+9naXB_=BAoHLGUNB5MAGUjqdJULQ@mail.gmail.com>
X-Gm-Features: AQt7F2rwx7wGB8ZBKu2m1bFpFnDd1lex3iIfSHU8hW_sI2lPZQPcUs7Vdxe5ryQ
Message-ID: <CAL_JsqLSJ_f81fyOoCheh+9naXB_=BAoHLGUNB5MAGUjqdJULQ@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 9:26=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello:
>
> TL;DR: korgalore 0.2 adds support for multiple delivery targets beyond Gm=
ail:
> JMAP (Fastmail), generic IMAP, and local maildir.
>
> Docs are here:
> https://korgalore.docs.kernel.org/en/v0.2/
>
> What's new in 0.2
> -----------------
>
> New delivery targets:
>
> - JMAP support: works with Fastmail and, potentially, other JMAP-compatib=
le
>   providers. Uses bearer token authentication, so no OAuth dance required=
 --
>   just generate an API token in your provider's settings.
> - Generic IMAP: works with any IMAP server over SSL. Simple password or
>   password_file authentication.

Is there any reason to use the GMail API over IMAP access? My
understanding is only the POP3 client in GMail to pull messages from
another server is going away.

I ask because the GMail magic was all working until yesterday. Now I
get a splat with this:

google.auth.exceptions.RefreshError: ('invalid_grant: Token has been
expired or revoked.', {'error': 'invalid_grant', 'error_description':
'Token has been expired or revoked.'})

I upgraded korgalore yesterday, but I don't think it is due to that. I
think it is some 7 day expiration for "apps" in testing based on
searches with that error. But I don't see anything in the dashboard
saying it's expired or revoked. Does "my app" need to be in
production? Google says that requires some verification, so I didn't
try that. Confused...

Rob
