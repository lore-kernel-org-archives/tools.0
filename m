Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62B1ADE8
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 17:05:09 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-63d3583d0efso40385296d6.1
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690909509; x=1691514309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+n1reUDKpPH8nKJX5b320l/PPRjhT2TqqrdtmeGxpgQ=;
        b=Fifio2zBJFOMzmydW3iEvzdC/LWGFPIj/k7USybxkMIA6c50O7qQXrXkH5oqZsZDzT
         /vxwXTfpdy8NSHZBkLDdogUDutZ7pvE+jezhD4RTf2q40olyAmXnAtkoWBJmHtV1t0LJ
         b68rGc5ZEHRczwvGCBe8BKTHft8aI5NZecw1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690909509; x=1691514309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n1reUDKpPH8nKJX5b320l/PPRjhT2TqqrdtmeGxpgQ=;
        b=A1SueYH6ffAu5/QjBwO8UM1icccJGzJ8jd3uHW7Qa2hbo/7nR8ou2FPck5WMPyJivm
         bkHZV2+cTOgrqYJ9itNRq2qAdrfuuItzcKK361PVLamrvs6L+JAANzTHWAEEeAuNZh2D
         wBzY/R6X6wbC2n0O/LpiNtpYXV6bDAaneQAnpgMSVSkJIUmM2WPwnmZwBY4QSTYZJ5y7
         Oemt1kqTJet23NRn8MHeH0XWkRvVkPnDoT1ln8kg9ev5yrRCS7KjM3pzc7iimTjAA8EX
         OuIlFGe1qLRPWpjHBv7BpX7xuuUeDdusY/BV1g6W+LVrBXKdolmR8/5Kml6+KGY3uVGP
         a03g==
X-Gm-Message-State: ABy/qLZOM1sTMIS97mAMPyhuIlpyHT447ya5bpb8YkmxLjesAFr6KXng
	EErEBR+KZrf18RFDyogj6kuyOw==
X-Google-Smtp-Source: APBJJlH+C7tWpkgIaCXUjYK7/iJcBqVgthC6ojXPZsm4QGHbjw6K1jCKiKqCXjq3NUMKXta7yaYU2w==
X-Received: by 2002:a0c:8c84:0:b0:63d:6df9:d160 with SMTP id p4-20020a0c8c84000000b0063d6df9d160mr6522477qvb.22.1690909508723;
        Tue, 01 Aug 2023 10:05:08 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id o8-20020a0c8c48000000b0063d152e5d9asm4783472qvb.120.2023.08.01.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 10:05:08 -0700 (PDT)
Date: Tue, 1 Aug 2023 13:04:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <kees@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	"Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [PATCH b4] b4: fix from header not using real name
Message-ID: <20230801-exhaust-movie-971927@meerkat>
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
 <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202308010939.9EC4C98@keescook>

On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> I don't, no. I also don't use "b4 send" (just "git send-email"), so it's
> not clear to me what's actually going wrong here. It still looks to me
> like either "b4 send" isn't writing a "From:" header, or Justin (and
> your?) MUA is removing/replacing it when it processes the "-f" argument.

I'm pretty sure this is the side-effect of using sendgmr, which forces the
in-header From: to match what was passed in the -f parameter. It's just
another way in which it differs from /bin/sendmail.

-K
