Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC192F80
	for <tools@linux.kernel.org>; Fri, 11 Jun 2021 12:38:00 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id t9so2407147qtw.7
        for <tools@linux.kernel.org>; Fri, 11 Jun 2021 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BbhqLUXpNLnCdNXLaUolRU0g/6dGaadXjoLaKujygSo=;
        b=ScxXVbLil4n1O4kIABmawOE/OQwESNCW57em2E3QQEdzXqYeFLUrue0qnyn8RyYiTZ
         DCMudTkDtHC2uGs9Stg7IxfsEnAGIqKY58aOnCMq6uEJCscssgTm/QL6NuITnVq2w8dx
         7HpAM3wGKxpsLq5fZnfF0/lc7pPCoW9BgcNUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BbhqLUXpNLnCdNXLaUolRU0g/6dGaadXjoLaKujygSo=;
        b=p+9mTQl44cTMrNo+9mIipA1m+xA1hJrv8EOUYSomMo2EaUAzzZcoCbn/RQVbH3Zog1
         qhgcO7nySIZdrX+q39hBJywLp0G+cH3llrfoSkt7+pZ1uBJWgI4SPUi/+3JtRFLQSvJI
         ju/4oFE5uFdPpwg3sAoiHsUsOpx2g915hA0bTW/Lh+PSsB4ukfiGSSmftlz86iopThiV
         Y7RAdBIbSTr6QAJYbehzOmzJ9ECjf9xwanFpKLITPx7FiIhsGygbeXgP8ixgynNv8E3Y
         oiOw7+0eqfb3VdA9peUc5kKglxWAOAXiMX4Ai1kcxEfIdAXuFs98h3zccAHeOadyiVT/
         1TNw==
X-Gm-Message-State: AOAM532FAR/Ijr2wC7wAdgzR1kdpJhIvQpTrDANyWR8obAaj6lm82NUL
	jQjHEMlT0B4Ay5jAnH6YtyFUjw==
X-Google-Smtp-Source: ABdhPJy2pPnjKcVLESzHG/+r8QPvN9npe1u+l8KegZZPDdT3+m94mEPtS8iGVExP2P6J9fZG7WDsQw==
X-Received: by 2002:ac8:12c6:: with SMTP id b6mr3585220qtj.352.1623415079567;
        Fri, 11 Jun 2021 05:37:59 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id m68sm4304742qkb.75.2021.06.11.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 05:37:58 -0700 (PDT)
Date: Fri, 11 Jun 2021 08:37:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: Multi-patch series broken in b4 master
Message-ID: <20210611123756.zdnyugrvuf2p23hu@nitro.local>
References: <CAMuHMdWakx2RcL4W_cmUh8s3NYp3darGmrVu11Hq2-sY0GqUPg@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWakx2RcL4W_cmUh8s3NYp3darGmrVu11Hq2-sY0GqUPg@mail.gmail.com>

On Fri, Jun 11, 2021 at 01:55:29PM +0200, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> Commit c2e1aa9cbbf3d89a ("Save exploded pull requests as maildirs
> as well") broke patch series containing more than one patch, as the
> resulting .mbx file no longer has the needed separators between emails.

Oooh, I think we discovered a bug in Python that doesn't actually write the
proper "From " header when running as_string() as opposed to as_bytes().

    $ cat test.py
    #!/usr/bin/env python3
    import sys
    import email.message

    msg = email.message.EmailMessage()
    msg.set_payload('Hello World')
    msg['Subject'] = 'Hello'
    msg['From'] = 'Me <me@foo.bar>'
    print('as_string:')
    print(msg.as_string(unixfrom=True))
    print()
    print('as_bytes:')
    print(msg.as_bytes(unixfrom=True).decode())

    $ python3 test.py
    as_string:
    Subject: Hello
    From: Me <me@foo.bar>

    Hello World

    as_bytes:
    From nobody Fri Jun 11 08:34:11 2021
    Subject: Hello
    From: Me <me@foo.bar>

    Hello World

According to the docs, the output should be identical, but the "From " part is
only present in the second version, which is specifically not what the docs
say should happen:
https://docs.python.org/3/library/email.message.html#email.message.EmailMessage.as_string

I'll open a bug with Python and work around this in b4.

Thanks for the report -- I'll push out a 0.7.3 shortly.

-K
