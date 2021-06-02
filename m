Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80DA70
	for <tools@linux.kernel.org>; Wed,  2 Jun 2021 19:33:28 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id o27so3564878qkj.9
        for <tools@linux.kernel.org>; Wed, 02 Jun 2021 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=B0DMLfPIswsLM41Ih4hHhgN44Msr1PiEkgfVlveEEb4=;
        b=iheTg1Z81wtUKEhKN1wI1HH0CsPCMY0p5pwNSm9HuEbdeS6/vuUYoA4KitCmRCCjAx
         FLrwJCI/WDQR+OTKLqA2FJLKGiE62uxfZboJrUTIOTPREgrVnNz8Wq1C35qs2/inMzt8
         yNrWMvE2DC5jYQnUANieaClyRKfMXe2jZu9ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=B0DMLfPIswsLM41Ih4hHhgN44Msr1PiEkgfVlveEEb4=;
        b=eQDOF7NByPT/6SjzwaVbl6YdF3AbpqmXtk/ccIZ8ECCEQS6L6QNFOtXnEvwpPChhFf
         qArhFZ7aBZEwjeuFwoN1QADeCwgPtyI1K4DEF+5Y+nROAYWFKDG3/namh3nf65dGrSeb
         /ndyQRubebTgWuS2jDu/YfLJ0zaweFuP4x79JJOxzGHiMUVXUL2g0we6vcPFWg6sbpe0
         Xm/kysnlTuOhLrXu4LFcENAmp77RWgdp2l+aRGhZdJKtnvZsO+h3T8em+iPQybFjTKGE
         9EMVhXY+IdjQJmWlggEYhkoyxhrxRDE3Z0w/8ELlIAHDMf64dE6g8PuQxmAg7EysyxZO
         s8Sw==
X-Gm-Message-State: AOAM532KkTABhgnEiUddtmmgkX7HzEcp5uGWk2KaVs1Rd9mAXDDl5p3q
	tFRYrLkFpOoJvGpRB0ayNFRpKHBIue5IMFpPYaw=
X-Google-Smtp-Source: ABdhPJw275jTi/G6800J0xX9j7oiLfMu6qI9KIl3E7iMfC+LPAJDQv3BpDJ1XM3eQotT36LR9iSXng==
X-Received: by 2002:a05:620a:15e3:: with SMTP id p3mr29154923qkm.115.1622662407365;
        Wed, 02 Jun 2021 12:33:27 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t15sm418116qtr.35.2021.06.02.12.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:33:27 -0700 (PDT)
Date: Wed, 2 Jun 2021 15:33:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4-0.7.1 available
Message-ID: <20210602193325.w44afltca4ucnu7u@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

Version 0.7.1 of b4 is available that fixes an important cache invalidation
bug that could prevent more recent follow-up trailers from being discovered.

To upgrade:

    pip install --upgrade b4

(or switch to the stable-0.7.y branch and git update)

Thanks to Rob Herring for the bug report and the fix.

-K

