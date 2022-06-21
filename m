Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5738748C
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 19:27:27 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id a184so10912323qkg.5
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w4ipwadrfSJ87ldR1Kfw/26CXIdgTau+T/cLNWkRxSE=;
        b=MlxBoDYLAC7l7oMUTYUibEMO3Q0x9bpIjIEHY0RG43tKbiqvj+/FGsCjihYZL0VwjW
         FliLwsq6P2LAYj1lz8OKcrJLWYdMfKT6LOsfiEhSTgTASjTZy/+h/45p8YxcInpakcx0
         lRMUw5joPB+dyldHG8sekicas3n1ZocTqvW+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w4ipwadrfSJ87ldR1Kfw/26CXIdgTau+T/cLNWkRxSE=;
        b=AVS5quDV6OELEzEaKjr7QHBPAjw2xNF0Nf5KFsqiWlvsnS87mw8zuIgpOUqGv2J7H8
         sy0qH1sjEgM5fYMNsxA9HIBpJxncQU/Q663lUp03VqHzsA5M01DMnWVkSe+MVRbsQmo4
         QkiFDTDlI9l2CoKMM5v5dEmtSJ20YaYozNlM5Bttpwj79KOCzDa0UfNZFkjaKy2kLJlj
         dCVu0K+C5nNvNURcSAQp7P95Usp+ST1wL07+2hS1NJ5H1Hakdb/PXo9DhiiAOBd2L+sA
         WvTa2BSVXtSi20ifvbS5RbdEOnbeAbaPuJ8552FMGb7/95EGBuCpQ6r3cA/6szY45zVP
         3MqQ==
X-Gm-Message-State: AJIora9Y63AylqvLJ+DT16aKRF7IMDoEZdH/FCuMzyGyipi6WjebVVEX
	LwpCDAXr/qDBlQg5mhC4UbCzqQ==
X-Google-Smtp-Source: AGRyM1ut7bHO961hqtYnd1pv1CmOqR3G9YWo1Bv+cL60vTeDytRaAAhr1U4pTSBozgcRAncDKfWodg==
X-Received: by 2002:a37:9a06:0:b0:6a6:839f:c34d with SMTP id c6-20020a379a06000000b006a6839fc34dmr21528371qke.154.1655839646532;
        Tue, 21 Jun 2022 12:27:26 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id b64-20020a376743000000b006a5d4f32e5dsm14387544qkc.128.2022.06.21.12.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 12:27:26 -0700 (PDT)
Date: Tue, 21 Jun 2022 15:27:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrIR2v7GdC3qIt2E@zx2c4.com>

On Tue, Jun 21, 2022 at 08:45:46PM +0200, Jason A. Donenfeld wrote:
> Anyway, in lieu of a complete and thorough list of all of the things, it
> seems like in the last week or so we at least have two things that can
> be be reflected in the tooling:
> 
> - Don't add `Link:` if the URL hasn't been hand selected as being
>   particularly relevant; the lkml patch email alone doesn't cut it. This
>   suggests that automatically adding `Link:` is invariably wrong, since
>   automatic != "hand selected", so maybe there's no point in
>   `-l,--add-link`, and you can just remove that option.

I think the discussion veered towards "don't call it Link:", not "don't link
to it at all". Without "BugLink" in the running, the next winning option was
"Archived-at:" and I am considering towards making -l add that trailer
instead, with the custom msgid.link domain, to further distinguish it from
"hand selected" lore links:

    Archived-at: https://msgid.link/20220617190153.tvi5lkzlvemeqou5@meerkat.local

I am not currently working on that, though, so I'm happy to go either way,
including making -l a "does nothing" switch.

> - Don't reorder `Signed-off-by:`. The simplest thing to do would be to
>   remove the `trailer-order` option all together. But some people do
>   want to sort the trailers (within each S-o-b segment) for aesthetic
>   purposes. So if you don't want to take that away from them, maybe
>   S-o-b needs to be unconditionally special-cased so that it forms a
>   reorder barrier.

This is already the case for all trailers -- we *group* them by trailer name,
but the *order* in which they are written is preserved. E.g. with the config
option trailer-order="reported-by,reviewed-by,signed-off-by,*', we go from:

    Signed-off-by: Ze Developer <ze@example.dev>
    Reviewed-by: Some Rando <rando@example.dev>
    Reviewed-by: Managing Rando <mgmt@example.dev>
    Signed-off-by: Awesome Maintainer <aw@example.dev>
    Reported-by: Bug Finder <bug@example.dev>


to:

    Reported-by: Bug Finder <bug@example.dev>
    Reviewed-by: Some Rando <rando@example.dev>
    Reviewed-by: Managing Rando <mgmt@example.dev>
    Signed-off-by: Ze Developer <ze@example.dev>
    Signed-off-by: Awesome Maintainer <aw@example.dev>

Perhaps I should call the setting "trailer-grouping" instead of
"trailer-order" (it's called that because we did reorder them alphabetically
at some point in the distant past when the feature was first implemented).

-K
