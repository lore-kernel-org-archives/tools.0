Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C41C0C
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 23:38:22 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id w6so27234217ybl.4
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 16:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=quVaSvtFFcRKluje5Z+Jwm6PFrm2Mbk+19GP+3ZHPsM=;
        b=WM3DIVrxWn9qD4WMNxyID3dUbl4abiN8NHx5Y6R++LE1e32fK8EE21itaNuEJNQxAp
         r5hL9gxWv8RYALRsFBswtEnapYd0oiwvP0HPR+nW1KZ4KKK0zs55YIOD4k2VIbS6D+Ev
         CM+4eKIInzBRUEpq+n8Rc2t3JX9TEaMehckU/XzBlNhpbHULKnrbGwzE+GGYMw6pMr6Q
         /ED7TkLuBD7ZnRQZJ6J2ajHQYM5cramwXBamWxfly3kowUFr5Jjh7kNwOgnrhbAwFS0m
         wOqvbkp2ZuhuQokZb2EpAd6Cfdj7mvKqELviadSDUOZyTyKP91S8773K4gMMz+qcXiKm
         //wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=quVaSvtFFcRKluje5Z+Jwm6PFrm2Mbk+19GP+3ZHPsM=;
        b=0v766vViBsJyx537Xdr3iF9JzW2xKg7cZwlHZU34pzXwiPwth9q/nXDdLgx/LOX4MX
         c11ambaHXMblsaD8v0DFW/C9+bhvBENtt43/3GR/8ZQ4jgm6JZjwP69B1PEBHCPkZHfe
         tt/O/QaQ7OE7CSUqJZPuowhcomD4wYy4A1Vkv2Ga+SATQJyn29lwtN6V9j33kQMqthzB
         pLoNUpWTPypbzhLN1lYqGjkXQjwwayFNvzx2eayt4hF5FVx2DKNV1YZwZGwSCVMST36E
         ZiYySKYS23+SFdL3Eha9KRnqZNvOGeggm1v2JJ2jgNlSY7ogwkygl0OffwwPgSYpot+H
         SM2A==
X-Gm-Message-State: AJIora/v0EA9eNYbexYVjADjHI63WfE7npKChTUdPpiJ7T+XiCFOcmaK
	3AZXpbcyXV2hQKZIh2gai7LAuKSJRzESDfLxGo2ZLw==
X-Google-Smtp-Source: AGRyM1t0orE5+DcTn5aJF76D84rhPcJV1ow2oaFfwOeTZbd6BP+aD9ys5nPSl3vZQDQWADkD4IKgYg1OuYrFtK/3GrU=
X-Received: by 2002:a05:6902:703:b0:669:3f6b:3166 with SMTP id
 k3-20020a056902070300b006693f6b3166mr763745ybt.492.1655854702066; Tue, 21 Jun
 2022 16:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local> <CAMuHMdV54SN7ghTTUnba+3p_9M2NkcXQ6R8KzQXEsWfPWXD6mg@mail.gmail.com>
In-Reply-To: <CAMuHMdV54SN7ghTTUnba+3p_9M2NkcXQ6R8KzQXEsWfPWXD6mg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Jun 2022 01:38:10 +0200
Message-ID: <CACRpkdYsMPNDyS5i73AEyWyVcCOQh6tga-1fqFTStamCp8JTeA@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 10:41 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> So if I want to run checkpatch, I have to keep on using "b4 am"
> and "git am" separately, right?  I never apply patches without running
> checkpatch first[1].
> Perhaps "b4 shazam" could gain some --checker option to support this?

This is what the DRM "dim" tool does as well, it runs checkpatch
and then tries to apply the patch regardless, but outputs any
complaints from checkpatch to the console.

This would be really helpful if b4 was run inside a kernel
directory (i.e. it can find scripts/checkpatch.pl).

Yours,
Linus Walleij
