Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8E3FC8;
	Thu, 23 Sep 2021 08:51:33 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id az15so5759347vsb.8;
        Thu, 23 Sep 2021 01:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZdKZoE7pImXlmO8B1HjvcB+xp/DYfc/5lzXb8VQnQUE=;
        b=Hmes5Uvj3+cvaR5BU209AcLk0bqVr80vB7D97lIjp4vSwPMoSxU9aOCY+eh7nZstAr
         VYFY1OP1Ou6KZJO/IM7kisVq1J0tQRpKsIwAZBKBW7TbkGsQfLgmNHSn1C3f44QKLBq7
         EwL7vAziPnRiMeF1Y2TKNTjU1Iftmk1k3IiSSSk2QEPadyy7YaYk5axcyY5n0jz6KJbd
         VamesDpmklrTBCsEMoI0QE5ob2HV9aJ6smtmLRjZ2ZHQ/nTUU08k1rnSVoeMmbrSnEK5
         pzs3F3m8SGjVlALoOG2ATqnrOCkl9MfzDkeif3BAcWaikvyHXTgzgVMZk8ApMU6Ua0GX
         XNiw==
X-Gm-Message-State: AOAM533koHYUkKB7zS4+P/3lvDoLp7jnosm8C4P0ZyDA0QasVhwoUMX2
	yIcteUh8BxuAZ/+LCiRFwrJ+g10PO+uCy4BpSjY=
X-Google-Smtp-Source: ABdhPJxe8QDyLWJxyHWCk0gdFvsQeTEPpp0bqR6uF3QtkexRrdcGCoyFEeutsrbY4bNwBQxBm2PGwAy0jJfdid+y8jg=
X-Received: by 2002:a05:6102:2086:: with SMTP id h6mr2919819vsr.50.1632387092230;
 Thu, 23 Sep 2021 01:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
In-Reply-To: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Sep 2021 10:51:21 +0200
Message-ID: <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Tue, Sep 21, 2021 at 10:25 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> The current master branch landed a new feature that implements a new
> subcommand "shazam". It is the functional equivalent of piping "b4 am" to "git
> am", with some extra safety padding.
>
> See "b4 shazam --help" to see the available options. You will notice that many
> of them are exactly the same as for "b4 am".

Thanks for this new tool!

> The default operation still tries to be the safest possible:
>
> - we'll create a temporary sparse worktree that will only contain the files
>   being modified
> - we'll use the base-commit sha, if we find it, or we'll try to guess the base
>   commit from git index info
> - we'll run "git am" against that temporary worktree
> - if successful, we'll fetch from the worktree into your current repo and
>   delete the temporary sparse checkout
> - you can then "git checkout -b foo FETCH_HEAD" or "git merge FETCH_HEAD"
>   or "git rebase" as necessary

[...]
Magic: Preparing a sparse worktree
Error running sparse-checkout init
fatal: Unable to create
'.git/worktrees/tmpz9m4cwww/info/sparse-checkout.lock': No such file
or directory

According to "git help sparse-checkout", my git (2.25.1, Ubuntu
20.04.3LTS) does have support for that command.

> Alternatively, if you run "git shazam -A", we'll just run "git am" on the
> current HEAD, which is the exact equivalent of "b4 am -o- | git am".

It does work with -A.

Note that with -s, the Link: tag appears below my Sob, while
b4 am + git am -s adds my Sob below the Link: tag.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
