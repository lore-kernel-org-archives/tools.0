Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7222C86
	for <tools@linux.kernel.org>; Tue,  2 Nov 2021 12:17:31 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id n15so5877557qkp.12
        for <tools@linux.kernel.org>; Tue, 02 Nov 2021 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+iyYT1c/yhb131W4mdSilDSzbYhM7FY92BXGWfcNEWU=;
        b=bo0fGq07YOyNbMC6XTVjwTOeNTXOhRtranN8uE5+LfKv6jMxvtE58AgjxEcvr+i/Rr
         AC9umbsJys6z52I3x9QYjq8YqUzLD7wnd0bcSFk9AjLLBH1I86zZrdLmQ3cEgXchMvBJ
         efdRTkasGuSwgun70BcIEnfHQplFEsBB5FKos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+iyYT1c/yhb131W4mdSilDSzbYhM7FY92BXGWfcNEWU=;
        b=2vY61h91fm6Dr5LMu/WQJSw1irNJeDbv/qXl/fxCF6OXIgVI9+gM831mjZJjb4ichw
         f3WRl29dzPqkHWFCQ5OPsjZB5LYCEzle+s5bhHqpo5c81AeUwMn1y4cdZViFiNsoNnXY
         RchVOiu39ypBOfuE5a1625CGflTnOy6x6HX2X9xu+VrbwXbPc0Ps3ckYbt07yxY5IWmD
         84Loj2sKHH2iZ3A6j2f6BMWzfj2tsB/7rEDCo64xEMQMY1uxNlnslC7/hykTKmEyiVfk
         MHEvYiz5Cd6JW75Q8pBNgkWX7GkOED9Ml1SJbEoV2pcgnGrZBHfpk7i0ENypy98QLOZJ
         Ixag==
X-Gm-Message-State: AOAM530Iu2RPDVxtwnp7YDvv9Ke4ntgVUrNlm/7qEWqQo1/ix2FnwUXC
	iSzFnDMfxrqwY+jQMxIU7rOkmA==
X-Google-Smtp-Source: ABdhPJzGNjWwJ13HEcFJ8hvOIGy7Ck2AzhsS0Ms+VsWKa6dYmPsmb003mP8AM9S2zy6LS58U/XL2fw==
X-Received: by 2002:a05:620a:2722:: with SMTP id b34mr19975163qkp.174.1635855450018;
        Tue, 02 Nov 2021 05:17:30 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id k6sm13707323qko.79.2021.11.02.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 05:17:29 -0700 (PDT)
Date: Tue, 2 Nov 2021 08:17:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <20211102121728.7idryalmemtp43ri@meerkat.local>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
 <CANiq72k-n-u9nQAzE1yUPz-ioF+coas_rBOofyuJnBgdvTZ2Yw@mail.gmail.com>
 <YYD46giNXcGF0lCn@alley>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYD46giNXcGF0lCn@alley>

On Tue, Nov 02, 2021 at 09:38:02AM +0100, Petr Mladek wrote:
> For example, I was not able to get a patch that was sent as a followup
> to a patchset by another user. The original patchset was sent
> from @infradead.org. The followup patch from @suse.com.
> 
> b4 refused to get it because attestation failed:
> 
> $> b4 am -o in YXlKqCPY9suM4mfT@alley "-P "
> Looking up https://lore.kernel.org/r/YXlKqCPY9suM4mfT%40alley
> Grabbing thread from lore.kernel.org/all/YXlKqCPY9suM4mfT%40alley/t.mbox.gz
> Analyzing 16 messages in the thread
> Will use the latest revision: v2
> You can pick other revisions using the -vN flag
> Unknown range value specified: 
> Checking attestation on all messages, may take a moment...
> ---
>   ---
>   ✗ BADSIG: DKIM/infradead.org
> ---
> Total patches: 0 (cherrypicked:  )
> ---
> Cover: in/v2_20211019_willy_improvements_to_pgp.cover
>  Link: https://lore.kernel.org/r/20211019142621.2810043-1-willy@infradead.org
>  Base: not specified
>        git am in/v2_20211019_willy_improvements_to_pgp.mbx

The problem here is that -P is missing a value and not failing in an obvious
way, which is a bug (but unrelated to this discussion). I believe you wanted
to use -P_ here, like this?

	$ b4 am -o/tmp YXlKqCPY9suM4mfT@alley -P _
	Looking up https://lore.kernel.org/r/YXlKqCPY9suM4mfT%40alley
	Analyzing 4 messages in the thread
	Checking attestation on all messages, may take a moment...
	---
	  ✓ [PATCH] vsprintf: Update %pGp documentation about that it prints hex value
		+ Reviewed-by: Yafang Shao <laoar.shao@gmail.com> (✓ DKIM/gmail.com)
	  ---
	  ✓ Signed: DKIM/suse.com
	---
	Total patches: 1 (cherrypicked: <YXlKqCPY9suM4mfT@alley>)
	---
	 Link: https://lore.kernel.org/r/YXlKqCPY9suM4mfT@alley
	 Base: not specified
		   git am /tmp/20211027_pmladek_vsprintf_update_pgp_documentation_about_that_it_prints_hex_value.mbx

I'll add a fix to make incorrect -P values error out more clearly.

-K
