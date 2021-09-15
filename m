Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31873FD2
	for <tools@linux.kernel.org>; Wed, 15 Sep 2021 13:04:14 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id w8so1845654qvt.0
        for <tools@linux.kernel.org>; Wed, 15 Sep 2021 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1smzOBSZpc3SOz48EC7sOGCOtabF4rjT2G37P364M6E=;
        b=Xymj1nfRCGorcv9H44IYHieRUHjzMEh9URefrDURCGH5YvS+E/GKdJIf7cU4mNo9K4
         kNx/2nmEHm8J5Z3DoToHuzInloo3hy2V4FKiQ5eht4GsF8iky/MqouMy1DGyJ0vdWlFF
         qPDGknjDfahsasBEpi/W+a+u4iCcDvifY/piU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1smzOBSZpc3SOz48EC7sOGCOtabF4rjT2G37P364M6E=;
        b=l1RYVCak8Mm97iV6aaxgno1x6DhxqqDBdeEZcaCoUnyZ4TUTYMVkjKdA5LCpyXBEcM
         1DkyUWBPiMZig9pfyGHNURBTYSzzcFmTedqlQv3MNMTWPxjNrTnx0oSc3OWqjBf1iyiB
         Tws+ESnxpyO8Fpf1VO4BIrVYurgnm3L9sPCX36UW2MgweJfYUHr8njFxP//N2k1FpZIg
         y2ZGZfvpH7fICMmDqm8067NlEhZOq0+1Gsg99yuF5O63jJ9WWWeHODDzjw65WBUCtccc
         K7F7ygbBKtvPPri1VUAwTDYhGHSX4JSut9htzlBRgh9FccGAq8x0SLkYNaZOQK/0j3cP
         V10A==
X-Gm-Message-State: AOAM531E6UDJ3AMznccFpgz8jtEwu8zdgPcv6UkysoNsEZHvz6Tay0t9
	hIKpK/8CdFo7OlbX6dGMBHKVLg==
X-Google-Smtp-Source: ABdhPJzkwlhLNvQ0R2TplyGs1FKJlbGxI4kuCWyaq4Q1dkRorZACqhGYF1vELyHp+84iZrRjwvL/nQ==
X-Received: by 2002:ad4:46ab:: with SMTP id br11mr10654501qvb.15.1631711053940;
        Wed, 15 Sep 2021 06:04:13 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id h9sm9809199qkl.4.2021.09.15.06.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:04:13 -0700 (PDT)
Date: Wed, 15 Sep 2021 09:04:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210915130411.uviossd5tyw7w4wh@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210901131259.7slxtcftirxb4bhp@linutronix.de>
 <20210901132519.vxw2wrly4pifnorv@meerkat.local>
 <20210915120555.3goilbwqeertbexe@linutronix.de>
 <20210915121521.fdsoxbwsfphbxyab@meerkat.local>
 <20210915125305.far7k3clx3tvyokl@linutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915125305.far7k3clx3tvyokl@linutronix.de>

On Wed, Sep 15, 2021 at 03:00:06PM +0200, Sebastian Andrzej Siewior wrote:
> On 2021-09-15 08:15:21 [-0400], Konstantin Ryabitsev wrote:
> > 
> > This distinction is intentional -- lkml.kernel.org is the primary system from
> > where lore.kernel.org nodes replicate. Being able to access lkml.kernel.org
> > without a redirect is a feature, so I can't easily fix this.
> 
> ah okay. Don't worry then. I assumed its purporse a redirect to lore.
> Do you plan to point lkml.k.o to geo.source.k.o with a cert?

No, the final configuration is in place. The only thing lkml.kernel.org should
really be used for is the lkml.kernel.org/r/<msgid> legacy redirect.
Otherwise, nobody should be using that hostname for any purpose.

-K
