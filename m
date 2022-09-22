Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24CD1854
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 13:29:13 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id q11so6105283qkc.12
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=LcUfyWtpzv/j9hTENzWxFQZoLwLFD6l6/FzTixTz4J8=;
        b=PEX/KXuvwnvysRZWjC7ozsIwWm6jqEvSK4Dn3s7dpZoCqx8aMzfzIeRLfwl2cvORLW
         yqZaCxQwUcuvA4Gfy7fRwfFpfC0Wv3Ok/2oIBXus9cwMVNC4D6SWng5qrtn4nF8aKoXi
         YLA5jmAWlhpuTefftLkFgXnxZfuaokXYuk8jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LcUfyWtpzv/j9hTENzWxFQZoLwLFD6l6/FzTixTz4J8=;
        b=hCiLzKVwVYGndzriRHMv+xGQfLUnE2hpjcPoMVbdqMH3aMEb9Ptck4qqHL8UTDLEZv
         wsEnQFSU53b0EJuqyLt7Cv3HJ3L56oswK+Ox7arVQ+1GPFjg3CCgBRF0hJSoIpU8FcWu
         C4l7/z91cRgqsr34I4jekqYQlif65eckJfMfsfRUk4SmkPlPHpMRcVOzvsWaMlljmAev
         OArrGYgXrK/jixf8Lsrg4fzc0grE3q1J6E99cK898kCdqS+MEDOtyrhSgQRclu7m0Ezk
         qmD6WlxQOcKC4TvjWSy0Va2KYaCJW7FyVH/5yjPz7h9TiIwqGKLcntA9n6EVuUE6CGP2
         puhA==
X-Gm-Message-State: ACrzQf0sSU5PH5SKUS8NriWfywQOjZl/PmCwhGdVjmvpEFYfDG2GLObS
	QBp+9FuKnS6iu9lNr+CdLA/qd2tUTb6fvA==
X-Google-Smtp-Source: AMsMyM48cQJ+IMFxY6htuBrbLPT8pthvmnNj8pjNDSy0+9+v1sgnP5zxMOOyIZIWFu2UbGF1e5hdcw==
X-Received: by 2002:a05:620a:4609:b0:6ce:7de5:302 with SMTP id br9-20020a05620a460900b006ce7de50302mr1940423qkb.681.1663853352666;
        Thu, 22 Sep 2022 06:29:12 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id o10-20020ac841ca000000b00339163a06fcsm3451294qtm.6.2022.09.22.06.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 06:29:12 -0700 (PDT)
Date: Thu, 22 Sep 2022 09:29:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 send: missing diffstat in individual patches
Message-ID: <20220922132910.gz66mwjcdd7ljd6j@meerkat.local>
References: <CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com>

On Thu, Sep 22, 2022 at 04:37:44AM -0700, Guillaume Ranquet wrote:
> Hello,
> 
> I've recently sent a patch series with b4 and diffstats are missing
> from individual patches.

You're right, I've never actually noticed that. I guess that's the difference
when generating the message using --format=email.

> Which in itself is not an issue as I understand this is only comments
> that are irrelevant to
> the patch itself.
> 
> Though, I've had some complaints that my patches looks broken...
> people seem to expect the
> diffstat to be present.
> 
> The serie was sent with 0.10.0-dev (master from some weeks ago).
> I've just retried a dry-run with the latest and the diffstat is still missing.
> 
> I haven't seen any option in b4 send to produce the individual commit
> diffstat, I will have
> a quick look if I can propose a patch.

I'll try to put that in today.

-K
