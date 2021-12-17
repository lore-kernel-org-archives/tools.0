Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E401C173
	for <tools@linux.kernel.org>; Fri, 17 Dec 2021 17:21:57 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id a1so3286115qtx.11
        for <tools@linux.kernel.org>; Fri, 17 Dec 2021 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A9kfa0fm/lto9XrmH3Da0GTXRvkxIB/HsBqltL37Gqg=;
        b=TaoUe7T+aGxoOxuQlJjzhuZ2XANCz+x/DsKj2WV+AjnylPnt0LnIEXYmVH0Rc2VvR1
         awoxDDfZF8bMKBHzi0zF/sAdfqs8exUd8wrmxvYkA5jZAFtIQ7oncYaMH4SjCitGyJ9e
         mLv0W3p/GzTPCBOYbaLmq75Ima+kCRwskLsgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A9kfa0fm/lto9XrmH3Da0GTXRvkxIB/HsBqltL37Gqg=;
        b=tAAKfgYE4cCZviZGPniEy00hI6QEuw3KuCIzoZcBaBRJJf5Q2UUpAmjtssw5LPclRN
         7X9yakM8jzs0b2SBEebVLZ0+kwxupraDYTUa9R18OWPcnPE4YZu57M1uvFOlbNDNgpV6
         PsDUFPmWZlO1+F21HKLqD2927tQBqkgOwHlrIhpW13G5uQAivBaDRAuiZ3HqNG3M0Ukd
         iAgWPRYcx/ZD5KgXb2YaPJSB0fLZrM/Arj6gSZNSAQia72mfDP1DzUI9Ng63q6/f2UjT
         T6QX/CeIEi88EfnI/X7m9O+KQIb/WfIQW2XnBeKA7mWKcjlkIrVM1LF324RFijLV3Qh3
         HQbQ==
X-Gm-Message-State: AOAM531ThyIqoJ82y+MdFPLwQltlaNeDt8jvmUetPVjYJ/Sd3pOdWyWZ
	NLSqxcrAwA7HZ+ZgkshgLXemiA==
X-Google-Smtp-Source: ABdhPJwE62wrMHlcS8640tbHzucQ1ei1fayapIiE2MB+oSq+SCR0BEKyNo2LdKubVGQ6jlPZ/4DOfw==
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr3337943qtj.253.1639761716800;
        Fri, 17 Dec 2021 09:21:56 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bi6sm5191315qkb.29.2021.12.17.09.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 09:21:56 -0800 (PST)
Date: Fri, 17 Dec 2021 12:21:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 1/2] patchwork-bot: Ignore empty context lines
Message-ID: <20211217172154.pwmqfozn5cy56izn@meerkat.local>
References: <20211202233836.2024510-1-keescook@chromium.org>
 <20211202233836.2024510-2-keescook@chromium.org>
 <202112161410.FCEC1C1189@keescook>
 <20211217161744.rxvsw2wwqzseowao@meerkat.local>
 <202112170840.1290901F@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202112170840.1290901F@keescook>

On Fri, Dec 17, 2021 at 08:41:41AM -0800, Kees Cook wrote:
> > I'm curious if you have local git configs that affect your "git diff" output.
> > If you "export GIT_CONFIG_GLOBAL=/dev/null", does this make any difference to
> > your experience?
> 
> $ export SHA=f11ee2ad25b22c2ee587045dd6999434375532f7
> $ GIT_CONFIG_GLOBAL=/dev/null git diff $SHA~..$SHA | grep '^ $' | wc -l
> 2
> $ git --version
> git version 2.30.2
> 
> Does this report "0" for you?

No, I get 2 as well. However, what I'm driving at is that the hashing function
has to be identical to what patchwork uses, which is why it's a verbatim lift:

https://github.com/getpatchwork/patchwork/blob/master/patchwork/hasher.py#L18
vs.
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/git-patchwork-bot.py#n479

If it generates a different hash from an email message than it does from the
"git diff" output, then something else is happening.

-K
