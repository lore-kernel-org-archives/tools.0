Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2219E55
	for <tools@linux.kernel.org>; Mon, 15 May 2023 23:02:36 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-61d97ab176eso62615526d6.2
        for <tools@linux.kernel.org>; Mon, 15 May 2023 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684191756; x=1686783756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA9qhJyv/hYHmAZUD9CW80Qvv1pD8bLtFmKuKDSKePY=;
        b=Iq9+VJFhxdm65+Q9OEth+KECxHjt2tVqJ+V9qJ7oxhtt0MsLAlki+xInarVw6Zaivy
         ktzKKGnqspPs0IlN9KRdagAxGxtrvJaeHh/fdgE3Hue+By8uAEtCYqQCyIpInVkEnmmE
         hpLemCnzinOZvEZ5t4upZoT8BHtgZRt9Paty/Wmo7wfBWcC3xUSvYNZ3ZH9u4fUL2tmy
         zYi1sSDHYVS6tp+MPEDq26h2o8uHfIEJItE0X/D9jOlbMW81MzY5y8xur4z8eZ3XaxbV
         fe7QQOdanT7DIacKMnJJtwXKrJXC8kd1WKwgzBKeS1hLzYLln+MIme8iw7pVgt+N8jA1
         052Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684191756; x=1686783756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mA9qhJyv/hYHmAZUD9CW80Qvv1pD8bLtFmKuKDSKePY=;
        b=T6UNhmsjpC6kkT/wBlPzoGfGOgI6w8hLpK6VNAS42vVrblUPJjhq+v5f/pRwxqkdm2
         rsRtzA06GTh4TYUCZBdxWiOr/HpHc/OyK33/rcIYCK453pLnqcMVN10sBPk8eWRcHm7p
         vOsC2N3MkErirXRWv8ElySQLg/h0omr/JAQGmsJAQSTAVTErjh9PEAsdPqjhBbuptHs8
         4GeOfBjylWy3JgD0QVuQd/4j5XnbQYwiq6oSeDp706sE9gBGl9+R2aDvsU8m6HCjT3ZL
         M8lQ5wLAsBz7/pt9mA/dcrrLBcS4pEtXvwmNHSuJ4i11XbXPcKOlaLqflmcIA0S6Vs2K
         K9Dg==
X-Gm-Message-State: AC+VfDwEfsqxzg60Le8CQ986zRG3rXl36N7UAOyDQ3TPY6Epg7vrJXNW
	4AKw48mvcR2hoerJ3SOv+BgobCf092zrI4mYeRI9Lw==
X-Google-Smtp-Source: ACHHUZ61UOiY14aOfO5Q0OZqMhgppMl/jy93RXPKGNFe8EW8iT89u2kFL8vaty+li9R/5hCkBT1FCDXa0jn2jzVZyrs=
X-Received: by 2002:a05:6214:3008:b0:621:53d1:3c66 with SMTP id
 ke8-20020a056214300800b0062153d13c66mr31697471qvb.18.1684191755786; Mon, 15
 May 2023 16:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
 <20230515-b217332c9-1b90c6e4656b@bugzilla.kernel.org> <20230515-version-unnatural-8d0592@meerkat>
In-Reply-To: <20230515-version-unnatural-8d0592@meerkat>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 15 May 2023 16:02:25 -0700
Message-ID: <CAKwvOd=sw6nXw1SohLqJsBnzjRsQrgswdfyZY22R6Dh93sbXLw@mail.gmail.com>
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Bugbot" <bugbot@kernel.org>, icon@mricon.com, mjg59@srcf.ucam.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 2:50=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, May 15, 2023 at 09:44:44PM +0000, Kernel.org Bugbot wrote:
> > I spoke with the maintainer of our internal `sendgmr` tool; they recomm=
ended that the `-t` flag be used.
> >
> > https://man7.org/linux/man-pages/man8/sendmail.8.html
> >
> > Can `b4 send` add `-t`?
>
> Sorry, I'm not sure why we'd want to do that. The purpose of "reflect" mo=
de is
> specifically NOT to send to to addresses in the message headers, only to =
the
> addresses we pass on the command line. So, adding -t would be the opposit=
e of
> what we want to do.

This is not for reflect mode; sorry for not clarifying.

>
> -K



--=20
Thanks,
~Nick Desaulniers
