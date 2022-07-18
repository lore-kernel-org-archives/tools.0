Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2DEA4
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 14:33:50 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id l11so8851797qvu.13
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oTT8FBhU3FA/h8zn8e1dhEqtx9QgG8/oVgcetxHf/0I=;
        b=aOs8oAOs6OsjfNTM+1CxJbmsxwMTRWJ0qaUB+k6j5534epp9GktNCOIVeBJf5kbZb2
         ErfRcPgLcsDvEZLWot0VckK7Yg4SlnJJh0H6pL0qzLFpRnBF6OWL4IzkRmNBT6FAhMPK
         /y4i84rqED1hYOxxdzKBssnR43i4rYRCKBvro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oTT8FBhU3FA/h8zn8e1dhEqtx9QgG8/oVgcetxHf/0I=;
        b=0BH/oOqux5sA5HB/UKezA5HFvrtUG4Z+y+auxv/r9vnVsf0/jJd7H0EtuSskr4po1R
         NJ4YuSnlm0xLH9I35ykb1k/DyFX2c83FDp6s9tRO3Shc7I2QjTTXNYj1oxf9EqS9oHOI
         n6rfqLKWCJ8C0hffH8tgfmY6NjCrDbiTaxAEEv4896aU6Vfy1gBDRhx8klGsPqV+fTAY
         RkuMZNK3fcANB83NF9NTckpssEPKL4WVqvjtJRa8uerzntPKU11JVFBZ9KdhIRsrQEqe
         HTkfCzlChcZRpFBWTAcpb1ud6dDLKWjm1IirUh4Wq5ouKWzNXSoDh3CYbpyIw4qt2ZFV
         m4cQ==
X-Gm-Message-State: AJIora8jQ3TIWX9FE17px6NHbxQnrc/GRAsGOpBTrZENYXbnPa2rQbgC
	xosPoDyM2f7a4voN2ZmbQRqJfE4/xHhh5A==
X-Google-Smtp-Source: AGRyM1sFid8S8DsxIRe0lNlER7guSOxqUPQcATZRN9JuoteRYJR/GV9Em2I00DHmz1LmgK71BocGtw==
X-Received: by 2002:a05:6214:20af:b0:473:59cb:c5df with SMTP id 15-20020a05621420af00b0047359cbc5dfmr20843785qvd.122.1658154829356;
        Mon, 18 Jul 2022 07:33:49 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id y20-20020a37f614000000b006b5f7d0d0b6sm602592qkj.4.2022.07.18.07.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:33:48 -0700 (PDT)
Date: Mon, 18 Jul 2022 10:33:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718143347.qo3ton7ocmcksgsy@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220718084927.nlomzhq3ipni5alf@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220718084927.nlomzhq3ipni5alf@houat>

On Mon, Jul 18, 2022 at 10:49:27AM +0200, Maxime Ripard wrote:
> > After the branch is created, b4 will create an empty commit that will serve to
> > store the cover letter contents and some tracking information. You can view
> > the raw commit with "git log" just like any other commit, and you can even
> > edit it with "git rebase" but it's not recommended. It's much better to use
> > "b4 submit --edit-cover".
> 
> So, I've been using a lot git-publish since a couple of years
> (https://github.com/stefanha/git-publish), and this creates arbitrary
> constraints that aren't great from a usability point of view compared to
> git-publish:
> 
>   - The fact that you need to create a branch beforehand prevents to
>     easily use it for one-off series. I'm sure it's doable, but it's not
>     clear to me why you would want a special branch in the first
>     place...

When approaching this work, I was trying to see it from the point of view of
someone who is an occasional contributor. This is easy for me, because I do,
very occasionally, contribute to the documentation tree. So, my choices were
dictated mainly by the following considerations:

1. it should be obvious where everything is stored and how to view it
2. we should use as little git magic as possible
3. it should be easy to blow away and start over

I was not aware of git-publish before you mentioned it, but I did consider
using annotated tags to store cover commit information, just like git-publish
does. My main worries about using this approach were:

1. Pushing tags is a separate step from pushing commits, which is not obvious
   to a lot of occasional contributors. Someone could do "git push origin" and
   assume their cover letters are preserved, but they won't be.
2. This requires us to assume (or track) the base branch in order to know
   where the series starts. For example, git-publish assumes it's "master" and
   allows you to override that with -b, but a lot of subtrees require that
   all series are based off of "next" or some other branch. Using a special
   empty commit allows me to completely ignore any other branches in the repo
   that can go away or get force-pulled into some weird state, resulting in a
   completely unpredictable patch series.
3. This creates a lot of tags that are detached from any heads, and they are
   probably never going to get cleaned up. This is mostly a nitpick, but I
   find this messy. :)

>   - ... Apart from that special commit. I'm not sure it's great either
>     and am almost certain I'm going to screw up rebases all the time,
>     dropping that special commit.

I know everyone worries about that, but I really think this is no longer the
case ever since git-rebase switched to the merge backend. It's really
difficult these days to unintentionally drop empty commits from your history.

> This also allows to easily rollback to a previous series version and
> it's transparent to others whether you're using it or not, the history
> is clean. You can even send the PR directly from the branch if you want
> to.

Yes, this is my main worry -- that these empty commits will somehow make their
way into a pull request and annoy Linus or other maintainers. This is
basically the only reason why I would consider abandoning them in favour of
something else.

> > After you send your series and when you're ready to start working on a new
> > revision, you'll want to --reroll to increment your tracked version. This will
> > automatically update the cover letter commit to add a "Changes in v[N]"
> > section that will also contain a link to the v[N-1] series, creating a
> > historical breadcrumb of revisions.
> 
> Similarly, I'm pretty sure I'm going to mess this up all the time :)
> 
> If you start tracking which version has been sent last, b4 submit can
> just reuse it and add 1 by default, or something else if one needs to.

I wanted to avoid situations like "it got sent, but the list bounced it, so I
should resend it now with the same revision", which is why I didn't want to
auto-increment after each time we send. I will add a check for "are we sending
again with the same revision number as last time", to help avoid confusing
collisions.

-K
