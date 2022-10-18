Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB34C64
	for <tools@linux.kernel.org>; Tue, 18 Oct 2022 14:23:36 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id g16so4884821qtu.2
        for <tools@linux.kernel.org>; Tue, 18 Oct 2022 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MT1gVnjxZlWQkvppbyXf2rlHhpErir7RQboqMqsgUOQ=;
        b=EYne0ly2kYoWfUxY3XyFfPa3dH9r2tlTb7k1TzG/+wlbBEDv2beR9FwFM/6JzK3OHa
         Gw6A4HuHY8zl6tz3BGn77VOV4ksraKOc+DjmZcqVr+cmoFDm14svDBD1RGIF9rt+Cn0y
         lDYyRXNfCEZQ/Eg19/S9IiSqrcWFGbUrQ0E7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT1gVnjxZlWQkvppbyXf2rlHhpErir7RQboqMqsgUOQ=;
        b=Q4uA5k8LA1l1cDoTfOHJVscZ9XOkazjTgyJtnRXvYUum+g6o1V0zLG/rT6Z9WC9RF1
         kJr8wNcWCuZ1zoPe5xWGu4wpM8ed6nvkr1c8utMfE33eBBghMOSlwazq9rp0iFzAvQVS
         2UxqrQWflXzcUBJfiHjYKyUYeuMmUe/GRbowpvEpKyoL9wFfZY75+1aq3J+1e/A/+w1t
         xjW759jrNNCioA5Bhrvz2m4LoItAEFqjlRwO6ieEZ5PGW/+dPYqjMRoKLLjtxdXu5s1y
         WLFpymt4jdHh7xhBqxsbeIcscRUOHLKxmA5r2ZFQCKIM9wz4xIlAsaaRVF3riLlTKA77
         BhSA==
X-Gm-Message-State: ACrzQf25KYMpWo7rH4+PoXPrJxzgStnSZkYyp01qfG4dTcuAdTgRGCOy
	7ufReGCd6l1YxKahKH5b7Pi9j1gY0Zd1+A==
X-Google-Smtp-Source: AMsMyM4bzpii3eg/qtwvl/U+ba7Jd74EGl2Y5v8NhtwC6dTXhXRYQjwYJB3E92rpiFcr7eMRzrdFRg==
X-Received: by 2002:ac8:7f8c:0:b0:39c:db49:29cc with SMTP id z12-20020ac87f8c000000b0039cdb4929ccmr2295970qtj.224.1666103014958;
        Tue, 18 Oct 2022 07:23:34 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id c25-20020a05620a269900b006ec51f95e97sm2442717qkp.67.2022.10.18.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 07:23:34 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:23:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nicolas Schier <n.schier@avm.de>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] mbox: Exit with error code if no messages were found
Message-ID: <20221018142333.h5qme44sz6qqpl5l@meerkat.local>
References: <20220825064109.550092-1-n.schier@avm.de>
 <Y01gfNMHorrzMkZq@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y01gfNMHorrzMkZq@buildd.core.avm.de>

On Mon, Oct 17, 2022 at 04:02:36PM +0200, Nicolas Schier wrote:
> On Thu, Aug 25, 2022 at 08:41:09AM +0200, Nicolas Schier wrote:
> > When mbox.main() is unable to retrieve any messages, some kind of error
> > happend (e.g. msgid has not been found).  Forward error state to the
> > parent process by exiting with exit code 1, to allow proper
> > handling.
> > 
> > Signed-off-by: Nicolas Schier <n.schier@avm.de>
> > ---
> >  b4/mbox.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/b4/mbox.py b/b4/mbox.py
> > index 9a6ea9c..0d258da 100644
> > --- a/b4/mbox.py
> > +++ b/b4/mbox.py
> > @@ -755,7 +755,7 @@ def main(cmdargs):
> >  
> >      msgid, msgs = get_msgs(cmdargs)
> >      if not msgs:
> > -        return
> > +        sys.exit(1)
> >  
> >      if len(msgs) and cmdargs.checknewer:
> >          msgs = get_extra_series(msgs, direction=1, useproject=cmdargs.useproject)
> > -- 
> > 2.37.2
> 
> ping.  Any feedback?

Yes, the feedback is that I clearly need my own patchwork project. :) I've set
one up now, so I'm less likely to miss incoming patches. Thank you for your
patience.

-K
