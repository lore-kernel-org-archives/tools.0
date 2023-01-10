Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E4B422
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81271C433EF
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673388947;
	bh=Zpl/ha+rVkLAJUw+UF7eUPeqaY7PXocN4mZXKp2/f5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IuImf42Pbj+inwE6OdUHErVBY/9xoSzIbKi9H+W0m0+7wPfUBtACtBaB2ote9bW3A
	 ZLNK/Sbjh9En4Q64EwG/3+AcT4c/LnkB3z0ApuafknTjM7rujszJ1+Ifwn5tmYF+Xr
	 S2UgCLqzlh5SKwictNS6fDRq4JrxGeLLNsF6HPOghzvkov8WBtTf4eSHliEiQEhvon
	 4v25eBJVBDpUeiEDID3bfBGhy6d/Mk8Jp3r6HmfxxVPcNOk464+3V8tfIv5M3612Sm
	 QMcTu7PXSFE6rqpTlI0jrfQiPc3K2+DXO+UOiI8TP7x8lR4K2bgrF9qt0kbJceDN9V
	 GmmmODxGdbAQA==
Received: by mail-vk1-f180.google.com with SMTP id b81so6335870vkf.1
        for <tools@linux.kernel.org>; Tue, 10 Jan 2023 14:15:47 -0800 (PST)
X-Gm-Message-State: AFqh2kqW+wy2eayqog2TXMtyxxgnmAJRR4uMVmsZvnIlOVMeh8d313Sr
	hKxRLbXmjoIh22CT+ysF6nUwJ7LiUUrx+PDO+Q==
X-Google-Smtp-Source: AMrXdXuKTuQa4s1JCJ0Bx1nhbvo6nIbfuTnMfIaA5LMk8B+avjg2154hHiXQ7ehPcTxdu4nzEhcI2xvUsLoKk6IZVNw=
X-Received: by 2002:a1f:9054:0:b0:3d5:77ce:27a4 with SMTP id
 s81-20020a1f9054000000b003d577ce27a4mr7017291vkd.26.1673388946432; Tue, 10
 Jan 2023 14:15:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
In-Reply-To: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 16:15:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLU8qb-aNGDZ45mq8_e=Oin6QY+8vBdfyUSPBFDVCFJEA@mail.gmail.com>
Message-ID: <CAL_JsqLU8qb-aNGDZ45mq8_e=Oin6QY+8vBdfyUSPBFDVCFJEA@mail.gmail.com>
Subject: Re: [PATCH b4 0/2] A prep splat fix and rework of option handling
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 3:46 PM Rob Herring <robh@kernel.org> wrote:
>
> I wanted enroll a branch and run 'auto-to-cc' in one step which from the
> help looks valid, but was met with a splat. The same splat happens if
> one runs 'b4 prep -c' on a newly created branch with no commits (other
> than the cover letter). There's a couple of other options that might be
> useful to use on new branches. The 2nd patch makes this possible.
>
> Alternatively, the help should be clearer on what options are valid
> together or not.
>
> Another thing I noticed is that if we error out when creating a new
> branch after the branch is created, the branch remains afterwards. Not
> sure if this is intended in the name of minimizing modifications to git
> trees or just an oversight.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Rob Herring (2):
>       prep: Fix splat with --auto-to-cc when a branch has no commits
>       prep: Allow configuration options when enrolling/creating branch

I ran into a few more issues sending this. The first was b4 is
configured to use the web endpoint by default. Is there some way to
override that other than editing .b4-config? I didn't see one, so I
just edited the config and sent this.

The second issue is quite critical as users' work could be lost! After
I sent this, my (uncommitted).b4-config changes were gone! This is due
to the reroll to v2 and it seems git-filter-repo wipes out uncommitted
changes. I guess the '--force' option disables all checking, so we
need to do some of our own.

Rob
