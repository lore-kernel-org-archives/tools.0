Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75594B436
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 22:43:57 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id fd15so2397641qtb.9
        for <tools@linux.kernel.org>; Tue, 10 Jan 2023 14:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Td19yuWjpPHa/0ElgKydvuJIfxk+ZdoboIC1OCNTnFo=;
        b=A1bJOhho2LZzj37LK/vFv0hy8Z08W7xSCo+fBU3MhZWxnGMBcEq55LjMTTb1VbZrzC
         FAf8YhiAN2D/OJppWIMLfXblzF6G7LzRbasr5rZSL/8/SObiczttyBB97506hH3QjY4+
         vMqqKgdZuE7623JBjBYx8wCRojRNywqkzo/vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td19yuWjpPHa/0ElgKydvuJIfxk+ZdoboIC1OCNTnFo=;
        b=ylu1oT8aSpVeyJ05LaDUR5Lj0Iexty7EsqFKPLhWqLNgFTd7RWK5fJFtiu/GWd2MhB
         XGoQ8WixmPMevmbz/ulUqtbdByX52NkbN3BkIoRc+PQVPWs9QnPBUyWeNqTYAzX8LToA
         /C6s+AzYeqhuzgIKjAItosGx9vfQCFC4kgvqiJPUiof2iVM+MjLHGXHx/fG27PoSITPW
         tYDBXqL1V6w44mSqLse6iUfRQFSv9Uj2l+hJlhDOAkox60TuBLoIIFSZnSIHmJhcSSJd
         mEVXJGwzb7/WoofrbP9vVCaHuBsEKic+47fblL0RTpCRce1MHt8sm2KOyZxyKvmeebsc
         vKQQ==
X-Gm-Message-State: AFqh2kp5L4KlsHg+N7YbDkpCN3dnwc6li3LfIelpoQg4gRdBlvBkpegc
	YkNxnBROdWVfUOEstN7jE8Onhnysdv00ProT
X-Google-Smtp-Source: AMrXdXvwj4jVtUEm5zwaIUdAU/kbEZ8A1/sXl5FxCpSw0clzhko4qtn5eS1j2TPEMgcQXd15jzWSxQ==
X-Received: by 2002:ac8:6601:0:b0:3af:c63b:8ecf with SMTP id c1-20020ac86601000000b003afc63b8ecfmr3777191qtp.65.1673390636128;
        Tue, 10 Jan 2023 14:43:56 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id bk25-20020a05620a1a1900b006ff8ac9acfdsm7980589qkb.49.2023.01.10.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 14:43:55 -0800 (PST)
Date: Tue, 10 Jan 2023 17:43:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [PATCH b4 0/2] A prep splat fix and rework of option handling
Message-ID: <20230110224354.rnzyqvpe4ljkoepl@meerkat.local>
References: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
 <CAL_JsqLU8qb-aNGDZ45mq8_e=Oin6QY+8vBdfyUSPBFDVCFJEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLU8qb-aNGDZ45mq8_e=Oin6QY+8vBdfyUSPBFDVCFJEA@mail.gmail.com>

On Tue, Jan 10, 2023 at 04:15:34PM -0600, Rob Herring wrote:
> I ran into a few more issues sending this. The first was b4 is
> configured to use the web endpoint by default. Is there some way to
> override that other than editing .b4-config? I didn't see one, so I
> just edited the config and sent this.

Ah, yes, I didn't think about this. You *can* override it by setting
b4.send-endpoint-web = no in your local git config, but we should change the
default so that we always use SMTP when we find it, and only fall back to the
web endpoint when SMTP is not configured.

> The second issue is quite critical as users' work could be lost! After
> I sent this, my (uncommitted).b4-config changes were gone! This is due
> to the reroll to v2 and it seems git-filter-repo wipes out uncommitted
> changes. I guess the '--force' option disables all checking, so we
> need to do some of our own.

This is actually because we create a detached head for the purposes of tagging
it. This needs to be improved so we don't modify the current worktree, I just
didn't research how to do it.

For now, I added the check for the state of the tree to make sure that we
refuse to operate if it's not clean.

Thank you for the report.

-K
