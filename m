Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068D472
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 17:33:59 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id k23-20020a17090a591700b001976d2db364so5368651pji.2
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=dxHmKSsLZts2ITgQRcjzCYR2e5Tg1fvCot7CB7GvYE0=;
        b=THCkAdTW2ZOoWqsa/PJ98SF3n5WFufAJfrYXELmzNrLCse0ONj35P6Pb+sa1CK0CNG
         Ke1jelaCfvKBFohtKKA+n4RU7kmT/o18UgZvc9grcXQxgxRVIt4YjaLm7i6SCbsucakj
         fyk86b22s4lH5u+wn2q7mAgJXQqwp4hzzsHxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=dxHmKSsLZts2ITgQRcjzCYR2e5Tg1fvCot7CB7GvYE0=;
        b=FwREMpvNUNRn6pv1VJWnOuI7WTOfnQZ90GduDZQzu/wVfD8vzdN0h7oRD1+osCVSH2
         TuB6JOuu+I9EAoD4iiKHsrnPHPlof0ez7TApPDNdlKQmOXb3DHK+amKweMe8dg3cp/yq
         4OlpoJ3LmZDDvuqUkx/oPbf8zeQ+tJ+uzomqtGXDekl0TjqTwOTHXYVAvc5Ho7bX8e6e
         nkX5F/JWhbN0rZvyeb1Hzid5m+XszGk2bezvQFmdurTuy7BGmWjpueizVXkQwW0beDIi
         W3hCIGPtO5R8GkKXKhu6r3NyVHk12VI5QdATeUDnbU9TifwKovpCqvpBQcG1+vPD94u+
         wRmA==
X-Gm-Message-State: AOAM530Hgw+zV4VvF28OZcstw/mJRfspyiySQ5nHPJaU8NEY6OWR4sbs
	/X89dr8lg5ii/PmFmDu4X7T5emyI8zv+HA==
X-Google-Smtp-Source: ABdhPJyI8lvsjhQBRAdOjhr6zfSEXbfiQMTgxh8h/PQR8DkzVKJyze+xZ/97QqsdBYBSqwifCsKDuQ==
X-Received: by 2002:a17:90a:a88a:: with SMTP id h10mr7781595pjq.226.1633023238857;
        Thu, 30 Sep 2021 10:33:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b21sm4181200pfv.96.2021.09.30.10.33.57
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 10:33:57 -0700 (PDT)
Date: Thu, 30 Sep 2021 10:33:56 -0700
From: Kees Cook <keescook@chromium.org>
To: tools@linux.kernel.org
Subject: merging pull requests
Message-ID: <202109301023.B78ABE54B@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I'm just realized that all my workflows have been entirely mbox patch
sets, and I finally have a pull request to take, and ... I have no idea
how to do it "right". :P

I see "b4 pr", but I was hoping for some kind of three-step process:
1) get the code
2) read/verify/test code
3) merge code into main brain

And that it would end up looking like what I see from Linus (i.e. naming
branching after the tags sent, etc):

6e439bbd436e Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
a4e6f95a891a Merge tag 'pinctrl-v5.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
62da74a73570 Merge tag 'vfio-v5.15-rc4' of git://github.com/awilliam/linux-vfio
e7bd807e8c9e Merge tag 'm68k-for-v5.15-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
dca50f08a03e Merge tag 'nios2_fixes_for_v5.15_part1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux

It seems like "b4 pr" does part of step 1, but doesn't build a branch
from the tag (though one can use "-b").

And for step 3, when I do a "git merge --no-ff $branch", all the tag and
origin (e.g. "tag 'pinctrl-v5.15-2' of git://..." is missing).

Either I'm missing something or everyone manually adjusts the merge
commit subjects?

How are other folks doing this, and should b4 help?

-- 
Kees Cook
