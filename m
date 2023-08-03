Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A724161
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 18:17:49 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-40ff45065c9so271281cf.0
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691086668; x=1691691468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ShUVN/H3VSWpYruSrY7U7XSBzTh5BUjYSY6hGkvf0U=;
        b=TGH+0Y/iaSsQ8lXgh4fgOCq1SsMM4AGVinqyBLmXh6MIYpVBMCMdJcLpJIdV89tn2H
         AF2iXQltbUvRQJU3melEABYEZP2lR3S0Pdy6ZZvLWQnD7dEbBUEEPc3JXbSXfdSiIH+t
         0ENmJ/5dAO1iA64WhSUJyvsdXwpjkP+4UBm5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691086668; x=1691691468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ShUVN/H3VSWpYruSrY7U7XSBzTh5BUjYSY6hGkvf0U=;
        b=ViMPWFu8Y7ul/48RvbYGAMhyOSlToxAtBofaiD+SbfEWah/7ThZ8JHCRX3ps8UD1bR
         +zLN9g6THjb+Ln0vZZsy8/LgF8MsDj5cd62/YAMsHmkR81Afo/ryv04g3Wm48Hpof5IY
         js8YZnTW773H7V0fca9fe5awSkNg7dY6VyiE7tYdyJ6g/PJtp7wdcY1afmwA/E6rQs/s
         BctECY95kOWee8ZK9Sk/iVyV9Urf6zBjBamoisl16SCiMLPTwxroyshtaaCZIRTKFk6u
         /+hiA8zcHjzWvw6kE+1IF8Lq7DX3L2DhtUvWVFttTlKCzj+wDL0fMah0Kii/1f2Lt1p6
         pPsA==
X-Gm-Message-State: ABy/qLZEE2EjIhtnAJA4+l/TGqaEIqG8cNRNjBaZqWxu/fml+lPZ2x8x
	kKYal+8Qp2p4zM2uqm4vfJqz5A==
X-Google-Smtp-Source: APBJJlEQrrXvz+Z4aVTHcGrGu0Tl755MRfZcdNxd0k7Kxnl3y8FFLFHfmRofZ7ajrRae8R27ohHo1g==
X-Received: by 2002:a05:622a:130b:b0:403:e7e4:d631 with SMTP id v11-20020a05622a130b00b00403e7e4d631mr28695828qtk.50.1691086668333;
        Thu, 03 Aug 2023 11:17:48 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id fd4-20020a05622a4d0400b003ff654694b6sm108689qtb.46.2023.08.03.11.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:17:47 -0700 (PDT)
Date: Thu, 3 Aug 2023 14:17:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Kees Cook <kees@kernel.org>, 
	"Kernel.org Tools" <tools@linux.kernel.org>, Sterling Stein <scubed@google.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
Message-ID: <20230803-sturdily-viscous-f99673@meerkat>
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
 <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook>
 <20230801-exhaust-movie-971927@meerkat>
 <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
 <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
 <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>

On Thu, Aug 03, 2023 at 10:47:49AM -0700, Nick Desaulniers wrote:
> In particular, I would love if you could address the question about
> using `-t` rather than `-f <email addr>`, or provide concrete feedback
> to Sterling (cc'ed) on what the expected behavior of the external
> mailer is, such that Sterling can then provide feedback on whether
> that's acceptable or not.

Reading the sendmail man page
(https://man7.org/linux/man-pages/man8/sendmail.8.html), I think the proper
way to do it is to:

if sendemail.from has just the email address, like:

    [sendemail]
    from = foo@example.com
    smtpserver = /some/path/sendmail-alike

We should run this command:

    /some/path/sendmail-alike -i -f foo@example.com

If we encounter the following (without envelopesender):

    [sendemail]
    from = Foo Quux <foo@example.com>
    smtpserver = /some/path/sendmail-alike

Then we should use the -F switch to pass the full name:

    /some/path/sendmail-alike -i -F "Foo Quux" -f foo@example.com

I'm not convinced that passing the following will work properly on all
/bin/sendmail implementations:

    /some/path/sendmail-alike -i -f "Foo Quux <foo@example.com>"

I am fairly certain that at least some clients will not properly handle such
situations, because I think -f is only supposed to have the email address, not
the full From-like header.

Now, the question is -- does sendgmr support the -F flag?

-K
