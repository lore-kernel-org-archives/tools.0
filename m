Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4E1B7D2
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34063C433C9
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692393748;
	bh=g8OWiWsDgb/9dBFdv6zK5YUIExkYzMLlUX6U4PScQis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gvTZqSZfr8Kp0hohFGc/PHeCT4fWdWMDtIqfJc/7iO0ecsG31c0Nog3oxeG1foRdW
	 OnQKzjlRJZOvCtpCdHyG93hsQm1jLMK2m2rHyLFc7TK4iXbRhwjqCkcYcWkbOCNurp
	 3fdOr8RxFbs64Jdk9KCdHc3abJhfoshn3hILQeUHlhuFavm2jb9PkSQqKwEklAOM2c
	 Kbl89com7Kng2Z7RyMoFEMOdf0Ss4K7ip/804k007qAdiHI/DS5VrtbpYttIx9X/9f
	 1rp2UH1em5wABcQf+us01WQmgCFUvY83qE7/cIUVL0mYWaPKNJqQNFpsVq7jvSXRh7
	 46QppZkVA3TkA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4ff88239785so1989317e87.0
        for <tools@linux.kernel.org>; Fri, 18 Aug 2023 14:22:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YyvgTC8qvwEzvJvRNFm2EdLnf14kRZOLpZtLk3Wug4F+krYiEj/
	TD/s8hz3vhpQYTckHsmGI3K0TOQJmKngY83JQHo=
X-Google-Smtp-Source: AGHT+IEx47jAp77QeCosa6GrsVmZE5gPgCXg6RtTYSS9tSQAIqNukV4BxDfN9j27iskbCnt7cCBdJTOpGtyHzBleQZU=
X-Received: by 2002:a05:6512:2529:b0:4f3:9136:9cd0 with SMTP id
 be41-20020a056512252900b004f391369cd0mr282519lfb.44.1692393746187; Fri, 18
 Aug 2023 14:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
 <1a184dc2-8c8b-40e6-8fe8-f0309615f886@sirena.org.uk>
In-Reply-To: <1a184dc2-8c8b-40e6-8fe8-f0309615f886@sirena.org.uk>
From: Song Liu <song@kernel.org>
Date: Fri, 18 Aug 2023 14:22:13 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4FOtZLa7S7pYWcvssNMjQxvrTkkUKentyu5A8Ppg6vGg@mail.gmail.com>
Message-ID: <CAPhsuW4FOtZLa7S7pYWcvssNMjQxvrTkkUKentyu5A8Ppg6vGg@mail.gmail.com>
Subject: Re: feature request: b4 am verifies SHA1 from the Fixes tag exists in
 current branch
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 2:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Aug 18, 2023 at 02:10:30PM -0700, Song Liu wrote:
>
> > I recently made a mistake with a patch that contains wrong Fixes tag:
>
> > https://lore.kernel.org/lkml/20230815091931.4dd2b277@canb.auug.org.au/
>
> > Some lore search shows this is kinda a common mistake:
>
> Note that one of the most common sources of this error is Fixes: tags
> that apply to non-upstream commits which amkees it hard for automation
> to catch a commit that's unknown upstream (or at least requires fiddly
> configuration).

I think we can still have b4-am catch the issue when the SHA is not in
current branch? A rebase may still change the SHA later on, but a check
at b4-am time should still catch some issues?

Thanks,
Song
