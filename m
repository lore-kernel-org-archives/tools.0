Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC002770E
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 17:00:42 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id bp44so2683987qtb.0
        for <tools@linux.kernel.org>; Fri, 06 Jan 2023 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwiH7wg29pVr3CAEXSr38JexvNWxjKBUXDVhAx1Us9s=;
        b=BR8QTDvHHDkOAYapENvYJhpFq9SAQP5yBI8k+8T5wCkAwBuusHCX6sDpi+3G7ieME5
         cPQBDcJtAHvHOgrEbLS5oTnE2tXv/FowHX4xTwwuavEoJljvaOrALOz0F6i7mk3+k4fK
         W8HSZ6B0D2kDFTFTBToxb6GJCzqtbI90uB7bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwiH7wg29pVr3CAEXSr38JexvNWxjKBUXDVhAx1Us9s=;
        b=o2W+VrdJ9HTbIWkqnlLu8AziAkI8eTwrtsaAhY0wlGJZmLYyxLLap/QSqekbEuyPgd
         o8JZBAF5O1aTHJ9oSTyJhI4//QMgUFD/objVL3XH+HRa+ODA4KHhV6e4JKSEeS0EeQXY
         Kmx6fE3mWywGgpSmBdlAw0/UMMVZereSsmEIbyUk0tiCMSJXY0FGQYIvH3o8Zd55eNkC
         oIblNdZ8cGf4mOGxg0rJ1IgVmiBs8JSqdbICi/Gb/XSOD8BrzOEhSGwb0XgfWqqUKIyF
         NYnzieUZ4c5/2/qQcJRbBwWCXSIHLaUyBjjc4eyliwkbmkiPWqwolp7MV+DusfhzeWS0
         3+tw==
X-Gm-Message-State: AFqh2krHfZveRTMSPqEQCcoAuhskEAbOf/XmzxZIgkVt2vbET6i7hSx/
	gFF6BkB232lHPL3C/ee9lrNCj7HWHu5N7klG
X-Google-Smtp-Source: AMrXdXs8T9SvR5qsKEfi1M5joDeynuzncplxcl4pkGebU9mAj8BGOGTfd2880yZvoJz2GGcY+WmU0A==
X-Received: by 2002:a05:622a:30d:b0:3a9:86dd:3c67 with SMTP id q13-20020a05622a030d00b003a986dd3c67mr56116038qtw.3.1673024440099;
        Fri, 06 Jan 2023 09:00:40 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id cq12-20020a05622a424c00b00397e97baa96sm764377qtb.0.2023.01.06.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:00:39 -0800 (PST)
Date: Fri, 6 Jan 2023 12:00:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 am doesn't fetch all recipient headers
Message-ID: <20230106170038.tbdihuu667upvqnr@meerkat.local>
References: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7hLWvgqqJCK7+yM@sirena.org.uk>

On Fri, Jan 06, 2023 at 04:24:58PM +0000, Mark Brown wrote:
> Hi Konstantin,
> 
> At some point recently b4 am seems to have stopped including any To/Cc
> headers in the mailboxes it fetches and I can't see an option to get
> them back.  They're not needed for the am itself but I do find them
> useful in my workflow, what I'm doing is grabbing the mailbox with am,
> putting that into CI and then ideally if there's a problem I can just
> reply to the mail in the saved mailbox to tell the submitter.  I can go
> and get the mail with all the recipients separately but it's an extra
> step.

This change was a side-effect of implementing how we handle trailer updates,
but it's also "more correct" because there were situations where you would
send info to the wrong people, e.g. when we restored the in-body "From: "
committer info:

    From: Sender Person <...>
    Subject: [PATCH] ...

    From: Author Person <...>

    Commit subject

    Commit message

became:

    From: Author Person <...>
    Subject: [PATCH] ...

    Commit subject

    Commit message

So, replying to this message wouldn't actually have gone to the sender, but to
the commit author.

Here's one way you can get the full thread:

    b4 mbox < am-ready.mbx

This will grab the entire thread that you can then reply to (plus see if
anyone's already replied to it). You can even fetch that into your existing
maildir:

    b4 mbox -fo ~/Mail < am-ready.mbx

I know this adds an extra step, but this is also more proper, I think.

-K
