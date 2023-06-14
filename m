Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB277F
	for <tools@linux.kernel.org>; Wed, 14 Jun 2023 18:19:51 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-75efdacf490so216717885a.1
        for <tools@linux.kernel.org>; Wed, 14 Jun 2023 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686766790; x=1689358790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pYMZMdslS5gYeUFQ7MheWd6ynkxWyXNsVlgpWrkFRA0=;
        b=NmtlwtG/7ZSk+QqszqbPndIPCSK4bQWZZWg1BKrzYxXvB2CueHtYtwzBtxtV/Gd8JN
         O1TwJrGEjiJOKEG4h7yFZOdtjx9osUaR8ncoGbKzfKhevLSkCERwZfZquIv7Sr+Zkmpm
         hq10/5SCHhyyeylu6Si79HfpcHtgd9e+fTsGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686766790; x=1689358790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYMZMdslS5gYeUFQ7MheWd6ynkxWyXNsVlgpWrkFRA0=;
        b=jMxLkoqdMYeN7LLKMdXK7NnusYkyeKZrWz0c+GgPIewxj4gFrdziuFTAbMknAI+1fr
         D/nuXXgD7a68MMmY4i6+vXfaFQ3XP/XsnFn83W+mWt5IU1JdIPOwsPwXqsNZkaoUrrd/
         pVXbFcVy3GIORT4Xu490QaKsP+UFHEbMAidHG1nyIJuXkPyufZPZxertOhBq9yoXJc+U
         OA0yWvx8b3Zejpafcj6RbYsVxelVRvKLYnk4Vxp4dB8WZTTkI8u/NQsnjoSApr8vQdE7
         r6I+YpCK8qu+d4dJD/JyxxIrI/9Bg/EUAmyWyZVeYBFSG1YkZz7OwSbWq6NpHzLuVHS1
         ewyw==
X-Gm-Message-State: AC+VfDxkoSaiTM5z53tTcwqPFh3UJnb8R2yTDtI5bRcTWRzSyrVdi8Ff
	6XA1TtnLsb037X0Qql1C+En2BQ==
X-Google-Smtp-Source: ACHHUZ7LlAZJjFbTMNS1IAskaKZ/b7WBNZw0HGxxjxjNi4LacRo2wSkqXZKkwYXMFSs9AKBhD89U0Q==
X-Received: by 2002:ae9:e84b:0:b0:75d:528a:dda3 with SMTP id a72-20020ae9e84b000000b0075d528adda3mr15251170qkg.28.1686766790404;
        Wed, 14 Jun 2023 11:19:50 -0700 (PDT)
Received: from nitro.local ([204.48.95.97])
        by smtp.gmail.com with ESMTPSA id t15-20020a05620a004f00b0075b2809ee8csm4389579qkt.136.2023.06.14.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:19:49 -0700 (PDT)
Date: Wed, 14 Jun 2023 14:19:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ashok Raj <ashok.raj@intel.com>
Cc: tools@linux.kernel.org, Dave Jiang <dave.jiang@intel.com>
Subject: Re: b4 pulling from lore has issues when new rev has some new patches
Message-ID: <20230614-bloke-aural-hawaii-3a8eb6@meerkat>
References: <ZIn8bVstydHNZZ9J@a4bf019067fa.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIn8bVstydHNZZ9J@a4bf019067fa.jf.intel.com>

On Wed, Jun 14, 2023 at 10:44:13AM -0700, Ashok Raj wrote:
> Hi Konstatin
> 
> Dave suggested to send it your way.
> 
> I'm trying to use b4 (for the first time :-)). 
> 
> I tried to pull from lore. 
> 
> V1:  https://lore.kernel.org/r/20230603193439.502645149@linutronix.de
> 
> V2: https://lore.kernel.org/lkml/20230613115353.599087484@linutronix.de/

Unfortunately, you started from a very bad case. The v1 of the series has the
original 6 patches, but also a single-patch follow-ups claiming to be v2 of
the series. Specifically, this message:

https://lore.kernel.org/all/87a5xe8gid.ffs@tglx/

This is why b4 auto-rolls a v2 for you, with 6 patches.

  ✓ [PATCH v1->v2 1/6] x86/smp: Remove pointless wmb() from native_stop_other_cpus()
  ✓ [PATCH v1->v2 2/6] x86/smp: Acquire stopping_cpu unconditionally
  ✓ [PATCH v1->v2 3/6] x86/smp: Use dedicated cache-line for mwait_play_dead()
  ✓ [PATCH v1->v2 4/6] x86/smp: Cure kexec() vs. mwait_play_dead() breakage
    + Reviewed-by: Ashok Raj <ashok.raj@intel.com> (✓ DKIM/intel.com)
    + Tested-by: Ashok Raj <ashok.raj@intel.com> (✓ DKIM/intel.com)
  ✓ [PATCH     v2 5/6] x86/smp: Split sending INIT IPI out into a helper function
  ✓ [PATCH v1->v2 6/6] x86/smp: Put CPUs into INIT on shutdown if possible
    + Reviewed-by: Ashok Raj <ashok.raj@intel.com> (✓ DKIM/intel.com)

But then there's another submission that claims to be a v2, with 8 patches and
a different subject in the cover letter:

https://lore.kernel.org/lkml/20230613115353.599087484@linutronix.de/

Thankfully, b4 is quite happy to roll that into a series:

  ✓ [PATCH v2 1/8] x86/smp: Make stop_other_cpus() more robust
  ✓ [PATCH v2 2/8] x86/smp: Dont access non-existing CPUID leaf
  ✓ [PATCH v2 3/8] x86/smp: Remove pointless wmb() from native_stop_other_cpus()
  ✓ [PATCH v2 4/8] x86/smp: Acquire stopping_cpu unconditionally
  ✓ [PATCH v2 5/8] x86/smp: Use dedicated cache-line for mwait_play_dead()
  ✓ [PATCH v2 6/8] x86/smp: Cure kexec() vs. mwait_play_dead() breakage
  ✓ [PATCH v2 7/8] x86/smp: Split sending INIT IPI out into a helper function
  ✓ [PATCH v2 8/8] x86/smp: Put CPUs into INIT on shutdown if possible

> When i try 
> 
> #b4 shazam <v2 msg id>
> 
> it reports that it imported 8 patches as expected.
> 
> I was told I could pass v1 and it would now there is a V2 and pull the
> latest. 

Unfortunately, in this case we're dealing with a messed-up situation, so it
fails. The auto-finding of the previous series only works in perfect
scenarios, and this one is very far from perfect, sorry.

> But the same with v1 msg-id, it pulls only 6 patches as opposed to 8.
> 
> It does tell there are 8, patches but only pulls 6. Maybe because there are
> 2 new patches in the front?

Basically, at this point we just give up and ask people to stop doing crazy
things with their patch submissions and please just always send a new series.
:)

If you're trying to get a v2, just use the msgid of the v2 series -- any
reason that doesn't work for you?

-K
