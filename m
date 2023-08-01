Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DF4DC94
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 22:25:59 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-63c70dc7ed2so43038256d6.0
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690928758; x=1691533558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L6tT0ZQqXovgVeZrFVCkHRU45a/sg1nWrorWe1yX/g=;
        b=vMEBR58kCLArlEWN/L91XyeCjGyFGminC+f4PueiJMLLJyWSMfhAiVp7U/THLVQrif
         U4Yg1I7b249F1vRdYDXTLSVt+JziJ25wZkWNws0R+F06vCdDNCZuD43MBhGURWrjV4rv
         Y2qoS6WXeGlHbis5QDHjgl9dEBZwvv0dcadmJmHlvfK7ef9FuxgpKGx0fLc8NBKR0iD6
         hJdp+jRBEz8Kh64Tp64l+qEJM8NBhNbN4cjRgnj/wCJfaCZZq4oNDLPb+o1JY0ZqEuJ2
         BOgqLzUC10bmxB8mrgbm00AX2RT7EvUBDmDRrtGptwrTlOyWy2HlbuS819wmHK1mbKD+
         zqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928758; x=1691533558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9L6tT0ZQqXovgVeZrFVCkHRU45a/sg1nWrorWe1yX/g=;
        b=Kz/pmPwHHP/Uu7hlgqnX2IglbVkB7VZTtQIpXSRnr75HgjX9QOMqaDqtjCqu9yTgiu
         EYMJbn3GpaZOd6QauXdOqamWaCoNC9eblauhDBidunxAlTD3ZjDpZj6T6VgLBXwq+U6N
         RnelxDfSXnnNQRCvExX9TNYAppdXTo21w9a28WF3z/9O/kw/R+ZF62zPsKTIwANd5JLo
         J0sQbtfB4eMPW50n9e42CWtwcuH25uSnZEiobXd+H8GdcQSNxi9yRib6Xp6kqRWYeqtR
         wfC12zgrwf89nmYeN00EK47EW5InPMa0kz/3kJ3oe0xo/X4dnpi/g+vhwuTHHCDgvdJC
         l7XQ==
X-Gm-Message-State: ABy/qLYdi8KK/wCn768X+FsKzu96RsXOzrWb6cmK/Nl/9swIYxWPRHTX
	EN/YemFLD1a4ksRZIbpq9LMkmO6Sw5n3vJSoqXLx7g==
X-Google-Smtp-Source: APBJJlF9Z+pOoTghzKsIXkpBEwOmPt1Z+dh5IlXvAk6nCL3puzY5B+fDznpph97q7LViPkmUsSLhe5Hf8JYtfFrljNk=
X-Received: by 2002:a0c:aace:0:b0:63c:ee13:4fed with SMTP id
 g14-20020a0caace000000b0063cee134fedmr12149097qvb.39.1690928758473; Tue, 01
 Aug 2023 15:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat>
In-Reply-To: <20230801-exhaust-movie-971927@meerkat>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 15:25:47 -0700
Message-ID: <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Kees Cook <kees@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, "Kernel.org Tools" <tools@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> > I don't, no. I also don't use "b4 send" (just "git send-email"), so it'=
s
> > not clear to me what's actually going wrong here. It still looks to me
> > like either "b4 send" isn't writing a "From:" header, or Justin (and
> > your?) MUA is removing/replacing it when it processes the "-f" argument=
.
>
> I'm pretty sure this is the side-effect of using sendgmr, which forces th=
e
> in-header From: to match what was passed in the -f parameter. It's just
> another way in which it differs from /bin/sendmail.

Going back and forth between the maintainer of sendgmr here...

I don't think you ever responded to my question of `-t`:
https://bugzilla.kernel.org/show_bug.cgi?id=3D217332#c9

Specifically NOT REFLECT MODE.

>
> -K



--=20
Thanks,
~Nick Desaulniers
