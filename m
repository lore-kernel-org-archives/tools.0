Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3B200BBC
	for <tools@linux.kernel.org>; Thu,  1 May 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114598; cv=none; b=BCEYeiziQtysLAt0mgDdia/He+5fJc/WJcozCz2M4zmxHCyaZqPvU/Ta12D+2Pqi3dmj86NXOOQ1+g1USmad0ObGioa4ywu/TRHPBQlUh20C3Ihwb4oPvuJkHId9I7IK39rpcUxHw1SFVZrQWIjUGSSgqJrsMexusinQ9UIygso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114598; c=relaxed/simple;
	bh=W9BachoRTeAygYcbHIbG7xkpsgUWVuBAAJuX3hIFZPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPM8GgfPNozo7oEuSjAWcEIGRzdC4TD3RMmKd5L5FVMzqGNxC9OmTAuXW8E8LLXFfa9fZ6OsILygXUeEWOdQLyzdq3TXha94EiH9XCQssYXGrjsOOjyBAs55NncNYl119fRK0JBGv3K9YQYvB8gImyZjRB4sGqYterdRBdulwLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id E5647C4CEEF; Thu,  1 May 2025 15:49:57 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48858C4CEED
	for <tools@kernel.org>; Thu,  1 May 2025 15:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48858C4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-31062172698so11115271fa.0
        for <tools@kernel.org>; Thu, 01 May 2025 08:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114593; x=1746719393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/BY26p+uht5cjoH02VGkGf/8sVgcKuidq7b9URqiKc=;
        b=kbB32qp0z1KiiuelD6Tk1pGgufREiL+K5j6+k9G3M2HOlRlJvlZ053TjLPHUyEXeDo
         MfqBFf0Y4qZbcdYANd9burv5fz8fnKMXrEkKlMm5cBsqx8rNV3AA9VI24G1GwFpg18YI
         uSKECH9p5XbR7pSkIejqDqhU+i7YIiaq3E8XTXmEf/kBSY9XfHnHmLmFIv5rvvy16hlA
         NBzhJdqGQBhwSdi4LOw7lT5M09ta68rw/Rb+4Ac6eWQhd2bB+SHmQ1yCwQ2AiXH7XV3t
         aP6FkeqLEfdKtUApLO/0cFwKfNdGy+eeTRACAPhYCpA7JnWJLaSA9L5BvRVVQXpIRB3/
         JA2A==
X-Forwarded-Encrypted: i=1; AJvYcCVGMz+mnzrvfYn7HviMBkhWiXrtT/n9j3d9PCLXiNxKByM28+qB+YL7B2Tzh5fzBgEjELFpNw==@kernel.org
X-Gm-Message-State: AOJu0YwtI7NFV0khggUYt4rZ0DnwBCC7sMbFD7TJ6ifziOHVpWXpS1ki
	FAlCbnZm9A/ebwzrjwCBfKksEgsq20Ka6jmszyKdXnR8WL8DwH0ifDmDaFRc
X-Gm-Gg: ASbGncthSm/kBLAdGbotndNSCa9itMsvchsb2YrL17zDdgOKHoeyT96R6vW2yHEQewF
	jH1+a/c5NDVwvNm8ld6InKbGXx7rKoFn7oVafQoHvt+0a7mB+WR0i2TeKLWSb1Xm9NJDHJ4rk2u
	wMVpzXEAQIbOUGVGZOtNCUpU/jeIIbXjrW2IbPhCJM/6rEgwVAbiTaTTpOcR+XQ9M1WzfIuiIHZ
	J3FesoZG5Qk9l8RQyQMfIskaFLg7XSk+6DWvq2+29UDbuEsqxqIKGUJOegyIEXUwYZm3+x5WzVT
	6hRyUiZ9T1lLJQgmaeZb+A13YYvyw84fn9Me3HrLCCtfirBxiKSS7DMS8O/3weeNnPqypgYBQhA
	gyrNYHkwb
X-Google-Smtp-Source: AGHT+IEvHCVonodbXizfW2clh/MLCU5lqfOTf7JbruLnn1BFMWa3skMRtU6b4Busk+bbvf0LSDho4A==
X-Received: by 2002:a2e:bccf:0:b0:30c:7a7:e874 with SMTP id 38308e7fff4ca-31fc23705a6mr9917061fa.11.1746114592356;
        Thu, 01 May 2025 08:49:52 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b3829fsm1290961fa.7.2025.05.01.08.49.52
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:49:52 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso9185981fa.3
        for <tools@kernel.org>; Thu, 01 May 2025 08:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX77ZMHhdws2O9w1KekS510zR6wee4vmJeOknr+pRM6TlO0ah3fhI0ZwbOGcycBuuNNAT8gHg==@kernel.org
X-Received: by 2002:a2e:a815:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-31fc285a2f9mr9843211fa.23.1746114592022; Thu, 01 May 2025
 08:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org> <20250501132211.0310ae49@donnerap.manchester.arm.com>
 <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>
 <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur> <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
In-Reply-To: <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 23:49:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v66RkWixx4NB+a5L9_V=bs3wOSWqaSv9QeWb9-aYy2YxaQ@mail.gmail.com>
X-Gm-Features: ATxdqUEzaINQ96UDrlB5H71xYG8BIF1gchMgabIx0ovgFq-rMIETBvUGQy2ssOo
Message-ID: <CAGb2v66RkWixx4NB+a5L9_V=bs3wOSWqaSv9QeWb9-aYy2YxaQ@mail.gmail.com>
Subject: Re: b4 thank-you letter shows incorrect repo URL
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:45=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, May 1, 2025 at 10:26=E2=80=AFPM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Thu, May 01, 2025 at 10:06:22PM +0800, Chen-Yu Tsai wrote:
> > > (dropped most people and lists from CC; added Konstantin and kernel.o=
rg users)
> >
> > Note, it should go to tools@kernel.org, not users@kernel.org.
>
> Ack. Dropping users@kernel.org.
>
> > > > > Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux=
-sunxi.git, thanks!
> > > >
> > > > thanks for that, but the URL here is not correct, is it? Should be =
the
> > > > kernel.org repo instead? Saw this already in other "applied" emails=
.
> > >
> > > That's weird. It is correctly pushed to the kernel.org repo [1].
> > > Maybe it's because the git-config remote entry for korg repo's  is ca=
lled
> > > "sunxi-korg", and the linux-sunxi one on GitHub is called "sunxi", an=
d
> > > somehow b4 is getting confused?
> > >
> > > Konstantin, have you heard of such reports? FYI my b4 is version 0.14=
.2.
> >
> > This is coming from your custom template, not from b4 itself. By defaul=
t, b4
> > just says "Applied to ${branch}".
>
> My template is: "Applied to ${branch} in ${treename}, thanks!"
>
> My .git/config is as follows:
>
> [remote "sunxi"]
>         url =3D git@github.com:linux-sunxi/linux-sunxi.git
>         tagopt =3D --no-tags
>         fetch =3D +refs/heads/*:refs/remotes/sunxi-github/*
> [remote "sunxi-korg"]
>         url =3D https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/lin=
ux.git
>         pushURL =3D git@gitolite.kernel.org:pub/scm/linux/kernel/git/sunx=
i/linux
>         fetch =3D +refs/heads/*:refs/remotes/sunxi-korg/*
>         tagopt =3D --no-tags
>         b4-commit-url-mask =3D https://git.kernel.org/sunxi/linux/c/%.12s
>
> Also, the branch I applied it to is named "sunxi/clk-fixes-for-6.15",
> both locally and in the kernel.org repo, not "clk-fixes-for-6.15" as
> shown in the original thank-you email.
>
> I think there is a parsing error somewhere. Maybe b4 isn't dealing with
> nested branch names correctly and somehow thinks the "sunxi/" part is
> actually the remote name.
>
> If I rename the "sunxi" remote to "sunxi-github", `b4 ty` now generates:
>
>     Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!
>
> Again this seems to point to accidentally treating part of the branch nam=
e
> as the remote name.

Also, I found a thank-you letter that is correct that is from Jan. 2025:

    https://lore.kernel.org/linux-sunxi/173617837421.3282465.58930600702338=
3641.b4-ty@csie.org/

The next one that I found was incorrect. This one is from Feb. 2025:

    https://lore.kernel.org/linux-sunxi/173909140135.1184685.57849106777273=
56231.b4-ty@csie.org/

Though it could be I upgraded something on my workstation some time
in between.


ChenYu
