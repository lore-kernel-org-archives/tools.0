Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBD2C81
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 14:55:36 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 73so6224583qki.4
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L4lgv7e9QExEpb1BqIC8tp1JMIW1UF+NsjPbEbb1afA=;
        b=H1dspq7s3hUhYbeObwEw2YjcFEQcIB5uPL/DhUHsikcTYLKjfwoANCYp+tKx2QPS0U
         naWrkjQDi1C61IhXECu1BSIq2TXTaEHvi4ro/7IwFB6a44vzP7rpp2xnDjOpa9F7OY1B
         oFvTzWy1Dh8oKVWlNVREui/kaVInGQ50DpHSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L4lgv7e9QExEpb1BqIC8tp1JMIW1UF+NsjPbEbb1afA=;
        b=XvIrqpA6XnuIvUPULDwGNVtfoRNIP+efU63G8ZLb27pbR/ZnYlxkxLzxtblEl4oumR
         GVK3YKV38bbc5x/+4LTEvp9Is2aOERraInX40ZfCFfiZu/dbYMdr9sRWQGz9dMp7h443
         qhYC0+s9G2ssTqtoya5atdjhXbagjNiFURUtoAsc73rsMfvZQK33bta6tsbiwsPGV4Gz
         I4oPLcZjVUyM6O+4uzVc4frGbVkCsBwogOi/+m9N/CZzel3qjQn6iirzFj8b33dsI+P6
         gPavIG3ZPZwgU+sHumaCynq0Q4vn0EiaT3mXLr+QHzhOsno+e3zpvWleVUzSZeG1kCch
         bvlw==
X-Gm-Message-State: AOAM530hkFYsXISQKVozA2ef50J/nlp9aAVlcT2HlapxBuNIYyqlpUNF
	4tfYArbOOs4aau5dmgjNZekVjQ==
X-Google-Smtp-Source: ABdhPJzDK5d5fm1WZSJEXob1HOqH1xnuSAsp1+RSVA7muQtYZ4CHaS+H56vhPMWaq9vFfEv85p4/cA==
X-Received: by 2002:a37:bfc3:: with SMTP id p186mr3638226qkf.479.1633618535470;
        Thu, 07 Oct 2021 07:55:35 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id r196sm13907190qka.119.2021.10.07.07.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:55:34 -0700 (PDT)
Date: Thu, 7 Oct 2021 10:55:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: tools@linux.kernel.org
Subject: Re: b4 - imap support?
Message-ID: <20211007145532.nnp574cgz2xz34bq@meerkat.local>
References: <YUoZn+BTT7VPdZ3L@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUoZn+BTT7VPdZ3L@shell.armlinux.org.uk>

On Tue, Sep 21, 2021 at 06:42:55PM +0100, Russell King wrote:
> Years ago, I moved away from mbox files for receiving email to imap
> with mutt, but from what I understand from your talk today, b4 doesn't
> support imap. Am I wrong?

No, you're correct, there is no support for imap in b4. Introducing ability to
read and write to IMAP folders would pull in too many dependencies and require
a bit too much effort to properly implement.

There are two alternatives that I think are much better suited for this
purpose. One is to use something like isync/mbsync to do two-way
synchronization for remote imap folders locally. I've been using this setup
for the past few years and I'm yet to run into any significant problems.

The other alternative that is currently being tested is using the new "lei"
command that is able to fetch from and write to imap folders. I'll work to put
together documentation on how to set it up as a way to fetch threads from lore
and upload them to IMAP.

-K
