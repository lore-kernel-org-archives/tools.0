Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0EE1BF37
	for <tools@linux.kernel.org>; Thu,  1 May 2025 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114373; cv=none; b=H+Oqgk0gBuxkoRy2SGqMTxrUFHTuei7NsW1751x994vEA/YYFDgYkceARlP53Pd2nDAWT0bdprlm9VDs3Alg4y9DVm1WM1Ds6PSvgMH3ZApx/2Ai0vZwOG5uNwdWdQ2y4bnvx9asjQEb8isOYXYzlmN32nzPngzbH39vUasTVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114373; c=relaxed/simple;
	bh=kOV/RvVAKadidu9KAU/VFVRdmBSfmIKZwLsXnFqoOjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWa5/lFPm6S+7uCLFZceXNlNcyd0QO9CqFxnWmw/aC/nTbeX8PkOe3Mm99yfXiSakzOGhgtm+GQze/54cM33ne4wJB1XHO/TkTo5zyUwGf770MhINncsdDX79E21sNF7nID/VsBIIxkAAl5Lk8BXxXHhJvWOTkJuxHT4Twb4pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 94DADC4CEEF; Thu,  1 May 2025 15:46:12 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21489C4CEE3
	for <tools@kernel.org>; Thu,  1 May 2025 15:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21489C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3104ddb8051so9919691fa.1
        for <tools@kernel.org>; Thu, 01 May 2025 08:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114367; x=1746719167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tf8WhDVkUdxDI7igFuxuiQMXFm304tFlxLE0rZDx1g8=;
        b=mAwL/crlsa+JElNYnHRErVqFTLiTQJ4ubP5TQmF7uk+PDMOsAU4BfP5fzYzEVgaWbx
         Jmmk+FONT/mWL0dACWZ5bCsY57bDkQt81KGKGF8glGcT45L+Q3k6r7cBnJYYQ/QlNCLP
         WpuPrMQzke2iHVU6bsLUuRydPO9L7fDJRjEhGc8eI1i9hzUXL8R8vWt16xM7Sa8CdHwa
         8zIEJTrshxWy1iU/g423E7V1LWSRL6UNr8Yg8l1zYQk4h25Ej+7aMHWmANIIsJuBchQM
         tc221oC4bN0btKeFT3caNSAKvljXn64qxVIbl1MmbuyRAMt1AXZdQ74kUtRxZI+ZkOus
         sHWg==
X-Forwarded-Encrypted: i=1; AJvYcCUVUzKgAdbiq9oPjWPrBhw0JNbXkhXj56YM3aWdKASmrD0rlRaVo15JhQi734TxoSck9DJEBQ==@kernel.org
X-Gm-Message-State: AOJu0Yy4GOIXEiWDEAB75vQVLMDMWOCo6DpvN6SHS/BbHDJVr2yGJikh
	yW4sI0qF2FVUyhKpNM6YA1pXFr7FtgNBHrRphdMKEsLkEMLvBB0ax7FBbGW/
X-Gm-Gg: ASbGncuo28mvWEaG5Pbh58juYhT+k+Qa2rZqI/kVXi/XF1RJSGTcheASXRI0S9lrnUS
	RupWC9/j5AnBtX0Ud5l5BIayZrsdGKyXB3rImLhFt4twX6JCCZE3dFqNBVhs4nTSSM2j8P4RlzT
	TgPLwMx6PWI9izypvTDhzfnKFm2VTfqcfrUmVT4XOk+jt5G9jJLOZiEFWxokvGJmHWGV3JgD9oA
	YBeFPSxWlCOn94ZpJmmu1lyJx4kDdm+a6rarAOLC7ElKlCVqkBsdCltg2Vd7NKL82XTuP2M7D3P
	Z/crC19C5J9kpj11t9GKh3hF1JT+H8+U0mCHob91nwt5Mh/3dHBwLlwbBtdk0ln3kU8QOyvGGg=
	=
X-Google-Smtp-Source: AGHT+IFtKB6PISZsaDwdl6vjEGS1C9bDrj95ILWmkx5xLNGLutKyurDYiiq9mDuHB/gEA7mWk7isIA==
X-Received: by 2002:a2e:bc92:0:b0:30b:bce7:80da with SMTP id 38308e7fff4ca-31fc2274bf9mr8814241fa.9.1746114366931;
        Thu, 01 May 2025 08:46:06 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202901736esm1396831fa.30.2025.05.01.08.46.06
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:46:06 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-310447fe59aso11043611fa.0
        for <tools@kernel.org>; Thu, 01 May 2025 08:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRBF5treYlZqzRgtjcxai0uFoYgLjdVCnX39nZ42c0drJ7tCmaDBq29+VCmAdEK9q2x21PYA==@kernel.org
X-Received: by 2002:a2e:a10a:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-31fc37e56ebmr10772091fa.30.1746114366262; Thu, 01 May 2025
 08:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org> <20250501132211.0310ae49@donnerap.manchester.arm.com>
 <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com> <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
In-Reply-To: <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 23:45:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
X-Gm-Features: ATxdqUGcnEKGJjm2HU-9yaU_F74x1jRZn8TUPU72yUe__mPMXUKI345fxuutDz0
Message-ID: <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
Subject: Re: b4 thank-you letter shows incorrect repo URL
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 10:26=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, May 01, 2025 at 10:06:22PM +0800, Chen-Yu Tsai wrote:
> > (dropped most people and lists from CC; added Konstantin and kernel.org=
 users)
>
> Note, it should go to tools@kernel.org, not users@kernel.org.

Ack. Dropping users@kernel.org.

> > > > Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-s=
unxi.git, thanks!
> > >
> > > thanks for that, but the URL here is not correct, is it? Should be th=
e
> > > kernel.org repo instead? Saw this already in other "applied" emails.
> >
> > That's weird. It is correctly pushed to the kernel.org repo [1].
> > Maybe it's because the git-config remote entry for korg repo's  is call=
ed
> > "sunxi-korg", and the linux-sunxi one on GitHub is called "sunxi", and
> > somehow b4 is getting confused?
> >
> > Konstantin, have you heard of such reports? FYI my b4 is version 0.14.2=
.
>
> This is coming from your custom template, not from b4 itself. By default,=
 b4
> just says "Applied to ${branch}".

My template is: "Applied to ${branch} in ${treename}, thanks!"

My .git/config is as follows:

[remote "sunxi"]
        url =3D git@github.com:linux-sunxi/linux-sunxi.git
        tagopt =3D --no-tags
        fetch =3D +refs/heads/*:refs/remotes/sunxi-github/*
[remote "sunxi-korg"]
        url =3D https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux=
.git
        pushURL =3D git@gitolite.kernel.org:pub/scm/linux/kernel/git/sunxi/=
linux
        fetch =3D +refs/heads/*:refs/remotes/sunxi-korg/*
        tagopt =3D --no-tags
        b4-commit-url-mask =3D https://git.kernel.org/sunxi/linux/c/%.12s

Also, the branch I applied it to is named "sunxi/clk-fixes-for-6.15",
both locally and in the kernel.org repo, not "clk-fixes-for-6.15" as
shown in the original thank-you email.

I think there is a parsing error somewhere. Maybe b4 isn't dealing with
nested branch names correctly and somehow thinks the "sunxi/" part is
actually the remote name.

If I rename the "sunxi" remote to "sunxi-github", `b4 ty` now generates:

    Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!

Again this seems to point to accidentally treating part of the branch name
as the remote name.


ChenYu
