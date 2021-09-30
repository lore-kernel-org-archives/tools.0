Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F072FAE
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 20:00:05 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j13so6902849qtq.6
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BFayjB15N8kOTjQInfCVqpCm2iB0+iZ0eAnqo5vMpbQ=;
        b=iF0DRdRnWb2AQM/MNoa7kvNX2IN/v0XEBfgZcOgpYxFZSL5LXaTck+FafWwgIWnj+8
         sYbwIsLRUs+o7cfgFvpIZCUPhYqP8ko0fgxerFLBYhPnOJ2hA0U8yk7UzYJ/FJW0W0+K
         lLvHsEX/l8Rk5v0r6BhdPsLo0DnMdxLKFCJYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BFayjB15N8kOTjQInfCVqpCm2iB0+iZ0eAnqo5vMpbQ=;
        b=PXVJyTf9DW/l6YyD6Bx+Kl3Ko3VNKJbToxm7ip9O9Idpnpn8di9NkoSBkT27AQMZqP
         tfe4rrrKtm1R6fDmU7DM1lftH+Ep8ian9dfaMxgxcRnL+lr1MwkkMR179JRsjx8uM7To
         kXVRrp/bESAOn9vIQ90jMHQzr/m681l3TJvflTLVkwoMSjKnMFKq/d3lVGLEP6HbmTO9
         Kl6mThJgVZBW4gTfvVEVNYFHyE9JSietDfY6O3SZbUXun1UFy8XUtNdvS5z/bc/XYMwA
         n1F9LpqRz7jxZOe7kc9ntzXiL1n1EXAIPU7KV/hJBZ5PEDaxz9PzIDWaot04YCGBQk2J
         Hhug==
X-Gm-Message-State: AOAM531O94fBf8hkGKgywud2Nm2O7QbqhEgGBkfCnlx8vnXKbPS0eYQe
	2yBHr8WwRDhz53ZD8mC0nzgNeQ==
X-Google-Smtp-Source: ABdhPJyZ9aIWM5d0fwVL5WLT11Iehr/T3ggZOLEmFjdtryie3KZGxYRWFNF9H3oAib7i9bojHk1Anw==
X-Received: by 2002:ac8:564d:: with SMTP id 13mr8959053qtt.228.1633032003852;
        Thu, 30 Sep 2021 13:00:03 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id l7sm2083102qth.81.2021.09.30.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 13:00:03 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:00:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20210930200002.67vxbowvegso2zhg@meerkat.local>
References: <202109301023.B78ABE54B@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202109301023.B78ABE54B@keescook>

On Thu, Sep 30, 2021 at 10:33:56AM -0700, Kees Cook wrote:
> Hi!
> 
> I'm just realized that all my workflows have been entirely mbox patch
> sets, and I finally have a pull request to take, and ... I have no idea
> how to do it "right". :P
> 
> I see "b4 pr", but I was hoping for some kind of three-step process:
> 1) get the code
> 2) read/verify/test code
> 3) merge code into main brain

Glad you're still around and doing well, professor Nightingale. ;)

I'm going to cc this to users@, since it's likely to reach more
maintainers' eyes (and brains) there.

> And that it would end up looking like what I see from Linus (i.e. naming
> branching after the tags sent, etc):
> 
> 6e439bbd436e Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
> a4e6f95a891a Merge tag 'pinctrl-v5.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> 62da74a73570 Merge tag 'vfio-v5.15-rc4' of git://github.com/awilliam/linux-vfio
> e7bd807e8c9e Merge tag 'm68k-for-v5.15-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
> dca50f08a03e Merge tag 'nios2_fixes_for_v5.15_part1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux
> 
> It seems like "b4 pr" does part of step 1, but doesn't build a branch
> from the tag (though one can use "-b").
> 
> And for step 3, when I do a "git merge --no-ff $branch", all the tag and
> origin (e.g. "tag 'pinctrl-v5.15-2' of git://..." is missing).

It shouldn't be if you leave it in FETCH_HEAD, which is what b4 does by
default. So, if you do "b4 pr" and then follow it by "git merge", it should
retain the pull request origin and make it the default subject there.

I just added some merge message template processing for "b4 shazam", so we can
probably do the same for "b4 pr" if that makes sense. Should b4 grab the
contents of the pull request and pre-stuff them into a file you can pass to
git-merge?

-K
