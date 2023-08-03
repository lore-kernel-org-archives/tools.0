Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248C63BC
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 19:32:48 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76cab6fe9c0so111865485a.0
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 12:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691091167; x=1691695967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nVZIQZVg3z4pT4FuKxfIilNaWzGpP22+fxzA97ts754=;
        b=aSXrf818ub+znIKWy7QfO0ab94WVh0X4Sc3a8x1++p4VUo9HaxMjXIHKm5RFjlC/WW
         ulzzHs8FZ3tqiUDaGMkPo0lcfwDtu9IqriAhCQa4r2U+1GFKBL0wnHLYVMzsJNsCn8ir
         9p1BGSUEOFXe0JJVpgrI+mCW89/5pQ5dQ7gGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691091167; x=1691695967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVZIQZVg3z4pT4FuKxfIilNaWzGpP22+fxzA97ts754=;
        b=D1RtDzH6tngpO1OYAjRVIP69ZaKrmxoymFJz2pahsczXQizMCFBhM9hcUxezxe/ZuX
         apgrvD1RW99sPvzdQD5jWRBdfmN8qMQ/HHCBzRI3z0LsWIndrKM8m4WOdnELXw0P/vni
         GDftwnHBgsrJ+DRFVY6mLLlxb0tmlz/oJcv5QuO6D443/xvely0GRZjr04eWrj1rYevX
         tdWkAWX3F03Sm2TwlGrLsZm8mmaEI7yUbWkLp2Cfjix0mL/ItL3RmSCT5FoZjUAjw00s
         8mMPj9ZBmE6Y5WnkeFG5S1/0ByDuRRAIL+MoXy7WvJnHDcPqEOkVy+wSu0sRFNZnuCmj
         hKPQ==
X-Gm-Message-State: ABy/qLaXQ+AMp5T7FeAchl3t/FnLrhgT4KSSKyn5ghjaHfX6XFhCB8Jd
	xsMAsZezOa4KDx259zGvxLUbsA==
X-Google-Smtp-Source: APBJJlFbOsBKS4T6EIyYaWU94HYD9LLu4t0BqCmC16U5kA5vorqRfeGxJjZgBudrm/WcJix0TpEGqQ==
X-Received: by 2002:a05:620a:a97:b0:76c:a290:5285 with SMTP id v23-20020a05620a0a9700b0076ca2905285mr16284310qkg.15.1691091167710;
        Thu, 03 Aug 2023 12:32:47 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id j12-20020a37c24c000000b0076cc4610d0asm127281qkm.85.2023.08.03.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:32:47 -0700 (PDT)
Date: Thu, 3 Aug 2023 15:32:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Kees Cook <kees@kernel.org>, 
	"Kernel.org Tools" <tools@linux.kernel.org>, Sterling Stein <scubed@google.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
Message-ID: <20230803-swifter-chalice-67392c@meerkat>
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
 <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook>
 <20230801-exhaust-movie-971927@meerkat>
 <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
 <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
 <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>
 <20230803-sturdily-viscous-f99673@meerkat>
 <CAKwvOd=5PuW1VWUxmOkXGZtkus2ZoyyW_9HNKnjUwfjGKEr14w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOd=5PuW1VWUxmOkXGZtkus2ZoyyW_9HNKnjUwfjGKEr14w@mail.gmail.com>

On Thu, Aug 03, 2023 at 11:41:51AM -0700, Nick Desaulniers wrote:
> > I am fairly certain that at least some clients will not properly handle such
> > situations, because I think -f is only supposed to have the email address, not
> > the full From-like header.
> >
> > Now, the question is -- does sendgmr support the -F flag?
> 
> It does not currently, but we probably could add support for it.

Per our IRC discussion, I think we stumbled on the solution that works for
your case and makes b4 more compatible with git-send-email. Specifically, we
only pass the -f switch if envelopesender is set.

> What are your thoughts Konstantin on -t?

I don't really see the point of it, as we already pass the list of recipients
as part of the command line invocation. The -t switch is just a convenience
flag for humans.

-K
