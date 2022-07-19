Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA31C04
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658236327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qun2DCA/m5Hj/dYVEhAKPLH9LS4dMHIhMLWcE8lpPoA=;
	b=O6rjtaTtcngMBaPxjf6sQH0L1Px4Wp05f0uEpWoFyWhNUl73Ja2dHnlQh0yKmM2mDml0kr
	p69moaESmN8oNJkV+Z3eWhcfELKVW7y+HBx0VNnVKhMJbDiw9J9HUnoHB8tA4qtz3vlDYe
	wa9pHiHB2Y6M3fLLA7pmVSnD3gVwM7s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-36c4dzl_P5e_WY8vGScclA-1; Tue, 19 Jul 2022 09:12:00 -0400
X-MC-Unique: 36c4dzl_P5e_WY8vGScclA-1
Received: by mail-wm1-f72.google.com with SMTP id c62-20020a1c3541000000b003a30d86cb2dso6857945wma.5
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 06:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qun2DCA/m5Hj/dYVEhAKPLH9LS4dMHIhMLWcE8lpPoA=;
        b=GHXJXZ3GXxBN+JZ3p5zgQfv7mm/0/WI5RXG3G+865PRDkw8ZjhZ3eK9ugjdw9phl+B
         pIR1JlAN9NMnfU9vV/99h1zAYxk8MQWDueDOv9Iz/8SLvBIc/UHCtt+wpb8VD+BS6NU+
         A+N2eo7QvMFmpd0CZTJlJFpMCwSBiYXzseFollNcEFvp0NkLvk5BAtUwywS1pqWC3VhM
         nkEjJK3/QT7YPzL8ooPJ1m5cXtMXhAwzj0dP6XBO/cGt0wTIX6xMAg59D5sgWw80Zt1s
         5PGB+K5doUNJyJeAy1QDWlJqPue6lssfwqs/0V9amXB0XK9Uq/zZpsyp6ycVCDf5ixaO
         vayQ==
X-Gm-Message-State: AJIora8EAYHkoauULwbAYitMceHQS7PvYzap7BA7F8SHL4dtURo7xPMX
	uRn6eOQQzADf3TWz1vfHFi4GlIbaDUfx4OnwYOgsWWTa6AFwqndAWZqCl90pb5Uz1sWOSbRjkz+
	4aU0pxGEAnHL3fmA4
X-Received: by 2002:a05:6000:1681:b0:21d:85a7:4ed with SMTP id y1-20020a056000168100b0021d85a704edmr26562600wrd.345.1658236318817;
        Tue, 19 Jul 2022 06:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSQzxqEMerKOd0GSTwpougNbkILEfKrcncflGJpIR/3gZDYta07u5fMvNVj+if9kBkRB8LaA==
X-Received: by 2002:a05:6000:1681:b0:21d:85a7:4ed with SMTP id y1-20020a056000168100b0021d85a704edmr26562583wrd.345.1658236318578;
        Tue, 19 Jul 2022 06:11:58 -0700 (PDT)
Received: from redhat.com ([2.55.46.60])
        by smtp.gmail.com with ESMTPSA id v192-20020a1cacc9000000b003a2cf1535aasm18498440wme.17.2022.07.19.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 06:11:58 -0700 (PDT)
Date: Tue, 19 Jul 2022 09:11:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719090415-mutt-send-email-mst@kernel.org>
References: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <Ytae3XK2uA5z93rV@sirena.org.uk>
 <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 19, 2022 at 08:44:31AM -0400, James Bottomley wrote:
> It's just really annoying none of our tools supports all workflows: 
> git-format-patch can't work nicely from a tag; the pull workflow seems
> nicest but has no tooling at all around cover letter maintenance and
> the empty commit will be b4 specific.  I think this means there's no
> general agreement on a preferred workflow, which possibly means none is
> deal, but now your tool decides your workflow.

Well the empty commit possibly also with something
special in the subject (e.g. cover! prefix?) sounds like
something that git could learn to support well, no?

Maybe patches in the patchset could gain a prefix too (set! ?)
to make it possible to detect a situation where an unrelated patch
appears in the history after the patchset.

With that I can see some projects actually pushing history like this,
keeping the cover in the tree.

This doesn't require too much work to integrate into git - for starters
just rebase and commit to handle cover letter specially and then git
format-patch to strip the prefix.

-- 
MST

