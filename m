Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710C1F95C
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 16:44:56 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6873a30d02eso1731438b3a.3
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 09:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690908295; x=1691513095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S147MPvqY/qutN/MxWorWre/8LdH2nnh1+DxM4QY/FY=;
        b=R0GUMN+9KOClhZjASfzXwnHaNqYJ38/hO6m0gvyD1TDA1GMQHJr77YxYn7Cyw4WKbY
         MOC4hQsPlPAdB0J5jkMdiSzKdAoWwRxVPaGBcqD3fpMg3dm5eSy/2Z5qOL7lgXa6V12c
         1W5WAJA8U8KoCIEspa+HhBOvqgyX5eUX6a9Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690908295; x=1691513095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S147MPvqY/qutN/MxWorWre/8LdH2nnh1+DxM4QY/FY=;
        b=Cn84/+r2o8KiwrOEHmwmQaulxThYPxiHlBFifND3paDsDGqp1LPeVXvQgFBdfiBLua
         ALL3rI0UyEDmwnHavdDV9aqMtveDUSVtCBfCL38mZ7hsEgOkagrUrGj1IL/vY9byNg4y
         6rxM4D7+hPSRlmNgDjJKXeBYfjcH9bLxaIQB7R1eLGz29eh3Ive9itVbhsHdsDAdIu+h
         Td8dfoLefIYJ2JRqXupUlTRMM3RCs6YXUvpGbrFrplZitN/G4HiCSJgNCyIRE4KO8zcV
         zwLHAlfWDtpIUIGKGJAHiPbpHw2TLXMUlOKCtK3Fgi4RpijJ6kY+Zx2J5V92kvBDFV+x
         LpXQ==
X-Gm-Message-State: ABy/qLZzDP0iZl5H2gKR93pl1W6cJgO8kWSzkKWHhRKJPn1ccEbuENXb
	uUi8Ctvz353aOCFXLlFHjAZnlg==
X-Google-Smtp-Source: APBJJlEcRQQND32B6FRhBX9nnNKQ8nPbs5rcbbckge4wpLeC585uHE0VJZy7AxEA9nMmWJEjpf0cpA==
X-Received: by 2002:a05:6a21:33aa:b0:137:f985:f384 with SMTP id yy42-20020a056a2133aa00b00137f985f384mr14632226pzb.0.1690908295598;
        Tue, 01 Aug 2023 09:44:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bm1-20020a056a00320100b006875be4163csm710988pfb.17.2023.08.01.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 09:44:54 -0700 (PDT)
Date: Tue, 1 Aug 2023 09:44:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <kees@kernel.org>, Justin Stitt <justinstitt@google.com>,
	"Kernel.org Tools" <tools@linux.kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4] b4: fix from header not using real name
Message-ID: <202308010939.9EC4C98@keescook>
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
 <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>

On Tue, Aug 01, 2023 at 09:12:35AM -0700, Nick Desaulniers wrote:
> On Thu, Jul 27, 2023 at 4:20 PM Kees Cook <kees@kernel.org> wrote:
> >
> > On July 27, 2023 11:47:36 AM PDT, Justin Stitt <justinstitt@google.com> wrote:
> > >When using `b4 send` there seems to be an issue with the real name not
> > >being included in the From: header.
> > >
> > >Here's an example:
> > >| From:        justinstitt@google.com
> > >
> > >Whereas, something like the following is preferred:
> > >| From: Justin Stitt <justinstitt@google.com>
> >
> > Hmm. There are actually two "From" fields. There's envelope sender "From" (which is what -f sets), and the in-body "From:" field. I wonder if b4 isn't constructing the in-body From: field, and when missing, the MUAs add it based on the -f flag?
> >
> > >This patch fixes this issue and achieves the preferred behavior (above)
> > >by properly using both parts of a user's `from` field from their config.
> > >
> > >A .gitconfig like this now properly works
> > >| [sendemail]
> > >|   from = Justin Stitt <justinstitt@google.com>
> >
> > Perhaps what's needed is this (which is what I've been using forever):
> >
> > [sendemail]
> >         envelopesender = auto
> 
> Thanks for the tip; I'll give that a shot. Do you have `from` set
> under `[sendemail]` as well or no?

I don't, no. I also don't use "b4 send" (just "git send-email"), so it's
not clear to me what's actually going wrong here. It still looks to me
like either "b4 send" isn't writing a "From:" header, or Justin (and
your?) MUA is removing/replacing it when it processes the "-f" argument.

FWIW, my MUA is postfix. (Though actually, I guess, it's the MTA, b4 or
git is the MUA... whatever. The thing I hand off to is postfix.)

For the relevant ~/.gitconfig settings, I have:

[user]
        email = keescook@chromium.org
        name = Kees Cook
[sendemail]
        envelopesender = auto
        confirm = auto


-- 
Kees Cook
