Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F729A0
	for <tools@linux.kernel.org>; Thu, 16 Jun 2022 15:37:31 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id u8so2620488qvj.2
        for <tools@linux.kernel.org>; Thu, 16 Jun 2022 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zfD+mxI9ajWoJZttVlB3KuLXpSNtbez/wzym6AvD7Q4=;
        b=I58O1s2ivppKZZV25RZxET/eZYrNvmYoSxyO3EAzIsQE6fp0WrBZKyLm7I/AUNOwQz
         O4NkV+XaqfkCkoYcOCICjo5K5yUuYF/ztIOKAGfhacOY2VzClwxIS9qtlYaO0H789u4B
         0PD7KaUCr9VO3C3UyFLRglfjxqRgqV610Q6vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zfD+mxI9ajWoJZttVlB3KuLXpSNtbez/wzym6AvD7Q4=;
        b=ldlV1bqeG3n7eKpclgcOWK32D0Y8XaZ6WvB48ts16YuSsg26nS6Pw7ksLyQhzcSN7D
         yfzUkNnwkT2v7mnrjoqYB1QF3K7QjFwpSryhUoYwUNUYpFCH94n3REs1uKTDNCTPh71m
         HJ29FrGCzNMOcK/SMHrTk7dgMM41zk6UtErB8pbT2k3dpKWO8cVy/ySKdQK7UWpfoTpu
         uuqEdq4JduSRkA2WQjfrYoZ1knaXaqBTGsQDtn4jxXbVO9ORrScdIwiEHnlN+GwHNd8L
         c2wT+ZrwspT8mp26o9vXdvsBYuXWTbckpSgKPLi9BpWC4Q4m4gmroRtS+rgxuPQBxYPB
         ZUzA==
X-Gm-Message-State: AJIora/aUsiVCX173VZkNsLd5lf1fqzt/IoHxi4Zp0zkA/rVb+E4T/76
	m/gzalROCAIpbgV4be/ROayGgvFlML7H/w==
X-Google-Smtp-Source: AGRyM1sUvzLiZwHnLWFYHWwk4PLiqbxWCTjig0FVnQveX23Tf45SA0LoyiZSJ5+lrqEbMc1xhhqMsg==
X-Received: by 2002:a05:6214:2468:b0:466:1bce:6c74 with SMTP id im8-20020a056214246800b004661bce6c74mr4520214qvb.77.1655393850642;
        Thu, 16 Jun 2022 08:37:30 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id x5-20020a05620a258500b006a75a0ffc97sm2358252qko.3.2022.06.16.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:37:29 -0700 (PDT)
Date: Thu, 16 Jun 2022 11:37:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: Fetching mails for b4 am
Message-ID: <20220616153727.o7m3cicjxehmvhiy@meerkat.local>
References: <YpTI9lhCfA7shi6j@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YpTI9lhCfA7shi6j@sirena.org.uk>

On Mon, May 30, 2022 at 03:39:02PM +0200, Mark Brown wrote:
> Hi Konstantin,
> 
> I'm using b4 am to fetch patches and generate notifications that
> things have been applied.  I can't figure out how to make it
> fetch the patch:
> 
>     20220529141250.1979827-1-u.kleine-koenig@pengutronix.de
> 
> It's been sent in reply to an earlier thread and b4 keeps on
> picking the series the original thread rather than the single
> patch that is this reply.  It's not an insurmountable obstacle
> but since there was a subject change it feels like I should be
> able to pass an option that tells the tool to ignore the rest of
> the thread when working out which patches to download.

It's an oft-requested feature and I finally got around to implementing it. You
can now break threads at the message-id specified by passing --no-parent to
the "am" or "shazam" subcommands. In this particular case:

	$ b4 am -o/tmp 20220529141250.1979827-1-u.kleine-koenig@pengutronix.de --no-parent
	Grabbing thread from lore.kernel.org/all/20220529141250.1979827-1-u.kleine-koenig%40pengutronix.de/t.mbox.gz
	Breaking thread to remove parents of 20220529141250.1979827-1-u.kleine-koenig@pengutronix.de
	Analyzing 4 messages in the thread
	Checking attestation on all messages, may take a moment...
	---
	  ✓ [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
	  ---
	  ✓ Signed: openpgp/u.kleine-koenig@pengutronix.de
	  ✓ Signed: DKIM/alsa-project.org (From: u.kleine-koenig@pengutronix.de)
	---
	Total patches: 1
	---
	 Link: https://lore.kernel.org/r/20220529141250.1979827-1-u.kleine-koenig@pengutronix.de
		   git checkout -b 20220529_u_kleine_koenig_pengutronix_de beed983621fbdfd291e6e3a0cdc4d10517e60af8
		   git am /tmp/20220529_u_kleine_koenig_asoc_intel_avs_fix_build_error_on_arc_m68k_and_sparc.mbx

This feature is in the latest master and will go into 0.9.

Best regards,
Konstantin
