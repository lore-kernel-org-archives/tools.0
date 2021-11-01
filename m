Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D335A68
	for <tools@linux.kernel.org>; Mon,  1 Nov 2021 16:00:35 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id a24so2580415qvb.5
        for <tools@linux.kernel.org>; Mon, 01 Nov 2021 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sYdk3STpYlkAotMTh1qdc4IlB5/Vj5mimzIQnBH0oAk=;
        b=CEwH1BVUt9lTG337kMRdgxmsphXfdPYGM4VRdibeuHQQk3WQgzHrebbDlydPE/Wf1s
         3i+S1i0mbJCsiE3pLLhie2fJsyhX1WG2xUTWeBBWyEsUJpnXYAA8n4vgdCGJPeuv7ZwS
         ULTh+OidZQwZS9wCfBg4/P/Yq16GEWbb7qcQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sYdk3STpYlkAotMTh1qdc4IlB5/Vj5mimzIQnBH0oAk=;
        b=TkP2mW8eBNgExPVMsSyPLD1Qct1ARwADbyvQIGny9AW2OnV4AP/AdWpXwiSZMl43yE
         KcGhyRqsAfaXCkv9nmuyvLXLkmm4pZZ+huTDgoCB0BlALrBuc/8Dyx+5NQwG2OrNwwmQ
         l73ppbmIx+bntUdD1CWZsKpkUtGlUwMLMswxrQ3YE4m/LrB7srU8kGw5oiRz7jHZUjUh
         DSy4ad7sIhi9oWEf/dV/hDYceQFWilkndxqI0cAaGrgnqbeMVyZ2hmj1ZDIwCXCXGpnD
         LJCMSHYMHiKl7Ad4TqLfdgHvYscK7rs7zeJnq4+hgGNMKnQvueLolUpIYzKOh8LwYYTI
         ecbQ==
X-Gm-Message-State: AOAM532RYuuIrEhVszWx5l8pv2XPE9jNeeNvsNtTyFW8LAvGVsuw/fk2
	0faaTOVQphikk4LC66rYHSYF8g==
X-Google-Smtp-Source: ABdhPJwakWP0yswmJr+LFp4ei5SjJAP4RK1h9qenj1Y8hD5UD2ltej5401mFUzbPkzJElbv43BL5ag==
X-Received: by 2002:a05:6214:2aa6:: with SMTP id js6mr29206009qvb.42.1635782434662;
        Mon, 01 Nov 2021 09:00:34 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id y8sm10622766qko.36.2021.11.01.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:00:34 -0700 (PDT)
Date: Mon, 1 Nov 2021 12:00:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Crash generating a thanks
Message-ID: <20211101160032.gz46kfybjruvgb4k@meerkat.local>
References: <YXxhlEuodVLx8KjI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXxhlEuodVLx8KjI@sirena.org.uk>

On Fri, Oct 29, 2021 at 10:03:16PM +0100, Mark Brown wrote:
> Hi,
> 
> Attempting to generate a thanks with current tip:
> 
> 750286a7aba7dc091b4407c9f31157129aade588 ty: fix bugs introduced when switching -s to -t
> 
> I get a traceback on one particular patch:
> 
> Sending: Re: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
> Traceback (most recent call last):
>   File "/home/broonie/git/b4/b4/command.py", line 287, in <module>
>     cmd()
>   File "/home/broonie/git/b4/b4/command.py", line 270, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/broonie/git/b4/b4/command.py", line 96, in cmd_ty
>     b4.ty.main(cmdargs)
>   File "/home/broonie/git/b4/b4/ty.py", line 661, in main
>     auto_thankanator(cmdargs)
>   File "/home/broonie/git/b4/b4/ty.py", line 377, in auto_thankanator
>     send_messages(applied, wantbranch, cmdargs)
>   File "/home/broonie/git/b4/b4/ty.py", line 443, in send_messages
>     smtp.sendmail(fromaddr, sendto, msg.as_string(policy=mypolicy))  # noqa
>   File "/usr/lib/python3.9/smtplib.py", line 859, in sendmail
>     msg = _fix_eols(msg).encode('ascii')
> UnicodeEncodeError: 'ascii' codec can't encode character '\xf6' in position 55: ordinal not in range(128)

Thanks for the report. I think either I misunderstand the SMTP RFCs, or the
writers of Python's smtplib don't properly understand the difference between
the 8BITMIME and SMTPUTF8 capabilities. If the server reports 8BITMIME support
(and they all do, it's not the 90s any more), then anything following DATA
can contain 8bit content -- whether it's in the headers or the body of the
message.

Only when the email addresses themselves contain non-ascii characters AND when
they are used as either part of MAIL FROM or RCPT TO do we have to worry about
SMTPUTF8.

E.g. this doesn't require SMTPUTF8:

    MAIL FROM: <me@example.org>
    RCPT TO: <you@example.org>
    DATA
    From: Mé <me@example.org>
    To: Yôu <you@example.org>

    Hello world.
    .

Only this does:

    MAIL FROM: <mé@example.org>
    RCPT TO: <yôu@example.org>
    DATA
    From: Mé <mé@example.org>
    To: Yôu <yôu@example.org>

    Hello world.
    .

And yet, in certain situations smtplib seems to want to force-convert
everything to ascii even when you specifically tell it to not do that. It's
entirely possible that they are right and I'm wrong here, but my hands-on
testing with a couple of SMTP servers thus far haven't disabused me of this
understanding of the RFC and what 8BITMIME means.

Anyway, I think I have the fix in master that doesn't trigger this problem.
Please try it out and let me know if you see any more problems.

-K
