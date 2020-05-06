Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.2361.1588793008505540969
 for <tools@linux.kernel.org>;
 Wed, 06 May 2020 12:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=Cyc8pVmB;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E6AB62075A;
	Wed,  6 May 2020 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588793008;
	bh=jV3vbR/ogQh1R3KNfcssTJ+KzsAfLm3+3mEg7e7mcGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cyc8pVmB7tHueVrw7bUJblUk6CCKzIBD6K34X2qXwZ+LuBJJts1nb4+VY070utfkG
	 qTFAPX/N3pE64r97cIdkkFJ1lZhHWLe3OJhiN9lL2BdZzacJsmYB2z0LFzelPCq7UF
	 5h2lwFcPTQ9iVxJTuVCbykwoaU6MsBXLbl5MsSBQ=
Received: by mail-ot1-f42.google.com with SMTP id m13so2334192otf.6;
        Wed, 06 May 2020 12:23:27 -0700 (PDT)
X-Gm-Message-State: AGi0PuYu0mPjuzhhY9PwNv6RZDlsQ/BHZRZVdnjsfGJ6vi2abwRhc3Or
	kGtkU7TNYUOKq4EtkLhsY3xUsmqYu2mrfaqbzg==
X-Google-Smtp-Source: APiQypJcm2hHmvpBQQ5SjzHORnfwVu8W3yKVji+5ttA3M1yr6o+ydtxqs/eLDJavGNKKi0UswOspBarXQCTdmJfN01A=
X-Received: by 2002:a05:6830:4d6:: with SMTP id s22mr7552618otd.129.1588793007227;
 Wed, 06 May 2020 12:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
In-Reply-To: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Wed, 6 May 2020 14:23:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com>
Message-ID: <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 24, 2020 at 12:04 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I am happy to release b4 version 0.4.0 that contains a set of
> improvements and new features. To upgrade from pypi, run:
>
> pip install --upgrade --user b4
>
> Or you can clone the repository directly:
> git clone https://git.kernel.org/pub/scm/utils/b4/b4.git -b stable-0.4.y b4
>
> You can run ./b4.sh from the repository or set an alias/symlink to that
> wrapper.
>
> # Improvements
>
> - When a series is missing patches, b4 is now able to backfill them from
>   other mailing lists tracked on lore.kernel.org. This feature will be
>   improved when public-inbox is able to collect a thread from across all
>   sources.
> - If both patch and metadata are identical between rerolls (v1 -> v2),
>   b4 will automatically carry over trailers from v1 to v2. This is handy
>   if there is an sob on [PATCH v2 7/15] from a maintainer that is
>   missing from an identical [PATCH v3 7/15]. In my observation, this
>   happens very rarely, though.
> - Many bugfixes that were also backported into stable-0.3.y.

I found a minor issue on patches with no 'To' header. They end up with this:

To: unlisted-recipients: no To-header on input <;

However, that appears to be a public-inbox problem as it's on there
too. Here's an example[1].

Rob

[1] https://lore.kernel.org/linux-devicetree/20200506010809.6348-2-i.mikhaylov@yadro.com/
