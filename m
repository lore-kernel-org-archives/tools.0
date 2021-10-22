Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399872
	for <tools@linux.kernel.org>; Fri, 22 Oct 2021 09:41:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1524D611F2
	for <tools@linux.kernel.org>; Fri, 22 Oct 2021 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634895703;
	bh=2tW0QjNCXMLBzWj8znVA6qGYqC6Clh5/xXerLvWUOpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q4hnKz/spbNzeCyxUpoWtNZ4j2/WjIMHcOtSSQoie3+8EeGh0bYWX5DRUyItYph5p
	 vDSjXoH7tYQ4UMkrlgm27+YxCS0VzciKJdOdCvfsnW8O25cSRi+1oUl/km5lPqiDGN
	 2tYsTuzBfuvDOG9wVOu4XsjVfg9eHJHL2gnSthYU5mWjoQcbcZz3ljiEN2DJPbO9eM
	 HpRYfiPFUMdqhrcQFIJey1szRcbdaPWp+soCVVs7nlYklviNhiY4SBZmyuaOx4hhFl
	 B+vKLJjU9XUxhDKVWDbu2dTPofpfIM0n/U7m+67S6WSCBh4NfW2rJP3wvDYvO+TtNR
	 C+K7fS6tHyVYQ==
Received: by mail-oi1-f172.google.com with SMTP id t4so4322857oie.5
        for <tools@linux.kernel.org>; Fri, 22 Oct 2021 02:41:43 -0700 (PDT)
X-Gm-Message-State: AOAM531UVjk+oCAU0k0LhkKfxTbLy2cn1/crd1EhGgna62kGsX+sa1b8
	KvIVzzVMSVXrZ/X9wMavws/6/nGW3x/ItlCBVKw=
X-Google-Smtp-Source: ABdhPJxxKmQLMLmPTCtY9wI5ffWADE441LGwzrbqc+u6nmicAwuFg1GhOXwlhPkz9qP0uJhFcDi0niLhZMaGt+k/RQY=
X-Received: by 2002:aca:4bc4:: with SMTP id y187mr8715394oia.174.1634895702377;
 Fri, 22 Oct 2021 02:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <202110211313.B5C5C61@keescook> <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>
 <202110212044.D38D0993E8@keescook> <CAK8P3a1UrWfPxQP5v757XdOyEz-GE-jkStpQisA2mhAVneKwtw@mail.gmail.com>
In-Reply-To: <CAK8P3a1UrWfPxQP5v757XdOyEz-GE-jkStpQisA2mhAVneKwtw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 22 Oct 2021 11:41:30 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHBNuM3z-8DQ-_RUtU3QvnWV_=E9Ty2aXkR4RMr2P7ANQ@mail.gmail.com>
Message-ID: <CAMj1kXHBNuM3z-8DQ-_RUtU3QvnWV_=E9Ty2aXkR4RMr2P7ANQ@mail.gmail.com>
Subject: Re: injected body trailers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>, David Woodhouse <dwmw2@infradead.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Oct 2021 at 10:16, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Oct 22, 2021 at 5:53 AM Kees Cook <keescook@chromium.org> wrote:
> > On Thu, Oct 21, 2021 at 10:42:46PM +0100, David Woodhouse wrote:
> >
> > How about we reset that password and make the following folks the
> > list admins, assuming they're interested:
> >
> > ARM64 PORT (AARCH64 ARCHITECTURE)
> > M:      Catalin Marinas <catalin.marinas@arm.com>
> > M:      Will Deacon <will@kernel.org>
> >
> > ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
> > M:      Arnd Bergmann <arnd@arndb.de>
> > M:      Olof Johansson <olof@lixom.net>
>
> Fine with me, as long as I'm not the only one.
>

I'm happy to help out if needed.
