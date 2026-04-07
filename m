Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF33B3880
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569031; cv=pass; b=MQKvb08CfivBZ3FybsCQFce7CjVeRCrbfoLdQ6BKfpfeEofaPVkwdZikiHVTzgBCCaYty4GD6zP7LqzyEbAgAnaAEYIcUgcq4uvEvwHyEbcEJ2PeZ3Lh/jJIuwx6C3fcfcLiCaQqx/nyr+yJ5A+eDp1xyTmIwaJ/QbrKMcRg+KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569031; c=relaxed/simple;
	bh=xt9HjhbgkKDBp86xeRgCBGcOXByGFZzPXT2Q1LVKfdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6DQNjY0rBd1eosgE41LJsdMoKoNzNOYZXVUtfUaSIIYN77dt0LEGD+S9dPYVndVG28SIkDyb60ZC4a3kj7gdzvB7nDttQ/o0+YYoQ+J+Jh8ITzOI5im2ohknOk42CtAGg9h65AFOAF1riAuOAJU9IPYV8I7/QRMtNYEpmxFryw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtmKjI2I; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtmKjI2I"
Received: by smtp.kernel.org (Postfix)
	id E441DC116C6; Tue,  7 Apr 2026 13:37:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 378F9C19424
	for <tools@kernel.org>; Tue,  7 Apr 2026 13:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 378F9C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e01b8ef3eso18077681fa.2
        for <tools@kernel.org>; Tue, 07 Apr 2026 06:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775569028; cv=none;
        d=google.com; s=arc-20240605;
        b=c+TMcj9mOIznmSSQyzcuOuNvAedpD+CD7pOtLXyg3RaZJD4+NR6tJ6FENr73sIlDis
         0wkS0AT5M5kzVyDU+oVFuNSKQUHiAoNKQKFW1oUf/rbSiAY++ps5IJF059wyCtyxDmdX
         Z1xPI1zAMpCi1PHpSs/uZKTVms4WaXzeOJYXM58EIg+zxKnKK08q4uqEh9KAkZ64KpyJ
         ZFRDDebQKGevq4ArL+jut8rr/nJBI/le4JA99/HtCsqy6eysnzmrN3jgATUJdHrmlFuH
         GXz8um7s7nUfgA6KcumYPHSnxvfL+mcsYOry8iMCLX4b0zDEqdJNKYwR/orPk8QeOPka
         j3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wzVkGQBB1hkOo0uaJWCJnFNBlUB7ie9ToTGXhUrEROU=;
        fh=gDAYRk7ys79w9U5D+Xu4ldiGfzWwL9Bq4ols2pUa2Pc=;
        b=EjvkWFrhZW/ntznphYxunkOAkjiNp9IcdqGTX39pRSVcZqf0Nd3SLza6d3UPh/wqX6
         YAtbLwZo69fiGDqk4mRhisCWhrh74mUuZvjkXEU/pw2xJKH61uJ2oQrEkN0f51tOTXE1
         Owg+9JTQw7SD/4BxlH/Utao/CKWocK8TbrINKQQaxipmlQwhkeh6gZLzkzt4wd5k9UGj
         hXNGAh6lodI5rRrUkO85l3I74iMWMMaqdZMX/EXXyIpc0CLCXjInK2ATLjXm2ID3dhG1
         fTJ/qj+VXzNZXOmEXD3jAfvKNIc3Dmmb5Th1w8ZFFbzO/KK6Xmvt6TKQbuPUY/OXfkg0
         DCIg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569028; x=1776173828; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzVkGQBB1hkOo0uaJWCJnFNBlUB7ie9ToTGXhUrEROU=;
        b=WtmKjI2I80CdkLWf1K8LfdOrxIRvE6XpNssjNDXoG19Wi6XFocGpjuw0CLUPWsDfcz
         Fbd1riPferqq1Z3+LI12h2sQ3WNYEPINU2smIf/8zMHe3sz+RqYLrLoZ81YlSt9+LrHZ
         OKZn6/oBvXh7K1bygE9byAqfxtNhd3X3wLrbQtIHJw2gYYfyTzhszSWxOyOMjqu7aPzM
         a0TzfKks9NDwCzbZ5wNk154QpnAbzh0y22G+pOgRkdpYDnAOgflg+E7bChnj4SRAVqGF
         GE/fnFlILDlDrQjMOEIZB8N3vqmDcj2IJoI97843tGIZySRiHbfUEa3Y7PoRj6PNqJ/y
         yrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569028; x=1776173828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzVkGQBB1hkOo0uaJWCJnFNBlUB7ie9ToTGXhUrEROU=;
        b=hiZlBiOQBGcLtVQRFwbbS9vRuvW4AQzpAfpHcwpaIJIIUu3XZRLexwCZy5uxpdE1+H
         hsdwuWIkKhTaV1Gs/7KktbdFsf5y3qU6Ny+cfx8vHIPg5OeoIRH9jGwIA302jDHdxADf
         F3I7uTq1Ie9qXeH/+05e3hO/rIQcyyIHnzVWZm055MZ2OjmoGWH0yvyKVUIxdugW7ns+
         TIJ+8g0Nn3vkhb5xDgypueHrBEEeTa2xafBJ6NGexGIHuuZxajOJ96SG70Laza+dA1+Z
         N2U66fwxLqC2YkBuzMteAVwmI8fhZ9Rr3ly2k54UnLcX+nJRlmRPKcaExA9qxx67Zm3M
         ayLw==
X-Forwarded-Encrypted: i=1; AJvYcCXcqsO+oWsbnz1UZCeFv2NVmOGtgqtPivCOvCOeXTu3cooWVcV4r8vooLud3Lgb75V2iwnClQ==@kernel.org
X-Gm-Message-State: AOJu0YzraRrSYlEoX+QZT23ZHcIVEns5FgwHFxVtQX/tWdHqQqTdpyUm
	cTDYt9dsM7SYtdSiNppeHKbyYq/DVKn9p4vgkCaxDxBzV6m3RBbamnSPV9NEQLXaWrSUt+PiseE
	RZKG6cxr9x62DMy4Ni6EYrf7hHn+sij0=
X-Gm-Gg: AeBDievxNT9evEW+nDFgRLRZtrc+0FqZAypInGIhRaWEIoC8UvVvwnWNuVKc5K3P4Fe
	O4gXoY/bLHNB7bML9FzAVwEpqdFoVE4sbjXr97GgX9QP2vFh/UsmJP+Y+4yfNgwudidyRiABIfH
	Gu77qnZU1bYhnCn3DgplxCVScXsMQADsVGu928Qkb1bVQvYVLuLDgm3cYsph8Z+LkTqTj48wrrG
	bSwf4JDDFT8/4jPGfTUVqCFlQRxW+saQs5ilEOyR2GthLFDOA9+ycdIRqzRy513NNr3y3malc9A
	YbouXujQ6VFwrVqAaVilPz0Yfcq2qhZraV0Yii0VpjFsUzMOP0VWr/IW6BVHw1lTPJIuq7CcJRJ
	QUKcrdX33tauzd5Ze2w==
X-Received: by 2002:a05:651c:3249:b0:38b:fa1a:5927 with SMTP id
 38308e7fff4ca-38d8d4abe8cmr49664041fa.14.1775569027925; Tue, 07 Apr 2026
 06:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
 <177549837114.3355865.7109422546107942051.b4-reply@b4> <177550045089.3385816.4021244769990222254.b4-reply@b4>
 <5dfbf9fa-532c-47b3-95c1-4b14f6fed577@sirena.org.uk> <20260407-rampant-active-mongrel-b7ad0a@lemur>
In-Reply-To: <20260407-rampant-active-mongrel-b7ad0a@lemur>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 7 Apr 2026 09:36:30 -0400
X-Gm-Features: AQROBzBTFNnoBAIxGq6U6pnEmRBPscOMcNpE3aYJ5jJ9vnv9q4jdm1eFYBjJrU4
Message-ID: <CAJ-ks9kSL7mE8hmusYUcPjcsfTqhh+FvWHn-A5MgK4+s4ZNsOQ@mail.gmail.com>
Subject: Re: b4 review state is broken after series reorders patches?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 9:35=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Apr 07, 2026 at 11:50:37AM +0100, Mark Brown wrote:
> > > - will automatically mark identical patches as "skip" on upgrade, so =
you
> > >   should only see patches that have changed
> >
> > Is that a good idea - patches marked as skipped won't be applied will
> > they?
>
> You are right, I forgot that we automatically default to cherry-picking w=
hen
> there are skipped patches. Let me revert that and think of a better appro=
ach.

FWIW the idea that the reviewer is always a maintainer (who will later
pick patches) is probably incorrect. Non-maintainers may wish to
review in many cases.
