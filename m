Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B98376
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 01:11:03 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id fz10so15201995qtb.3
        for <tools@linux.kernel.org>; Tue, 06 Dec 2022 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Stf2nOMBvuelisi6Nq1lxd2NAuYDHJTYjkDqyP8b7hQ=;
        b=bM0VU5TTlzFytoPKekplt9jJ/xoa5/B+hDrimOKKh5oS36/b+g0pQunUl+/fC2DWgw
         zM7onkbSBCYRRt1fCf7nhLnu26c5dhWseYt816/MdhbCY08PTWsdbxfuGeAWKWn3NVls
         8pII412oX4KFT+C7eJPG7aZiAlGAH307OX/+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stf2nOMBvuelisi6Nq1lxd2NAuYDHJTYjkDqyP8b7hQ=;
        b=PC07mJEooJbSqKYTwx9OCenwaUiUBX40Fzft0dr2ApXudFlfYfZxxuJQ2vOJim6Bi8
         W4t9iOYi7rt5nUeghHWwI9ASMkHg8HB67R6wshN4qS4IsdCPkEjxDOq4nhfgIgqNxA8U
         yoLHit9gOtIS4ByXtmtQL7kAah/GLzMOzM86h4A8YhSawLFiO1dIMuN8Wmhi/e11B5Ze
         gXOFBw/GCs+fjt4/5uxbkCAZAE1zhjtfxssyqeiA7LTMUtaOrcm20HL8DQL+Wc/5Qjxz
         k4ATtU43FauRXwbWG9+R11Rm49mVJkChbyIhTIXhC/wYOHKn9bMbUc4ZxyCIWJWuNs5C
         DE7Q==
X-Gm-Message-State: ANoB5pkNb2IThohEYmXABVFlB9gMZaTJ0H7I9tRCzW++TesFXc0ZERln
	8rNhgeMEworZFlfskJsPh9AWqg==
X-Google-Smtp-Source: AA0mqf6UQ3fn4G2/oxJhwZx1A74Oa3JxED9LfxszJtdbC8MxAPM5uz97mhBAWvIaJPd8SnqXX+FDGw==
X-Received: by 2002:a05:622a:18aa:b0:3a5:1acc:3760 with SMTP id v42-20020a05622a18aa00b003a51acc3760mr65617552qtc.260.1670375462707;
        Tue, 06 Dec 2022 17:11:02 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id j7-20020a05620a288700b006eee3a09ff3sm16557391qkp.69.2022.12.06.17.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:11:02 -0800 (PST)
Date: Tue, 6 Dec 2022 20:11:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep HEAD fails when specifying branch point
Message-ID: <20221207011100.v6dyvrma53hv4oor@nitro.local>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
 <Y4/I/dzuV+s00L8k@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4/I/dzuV+s00L8k@sirena.org.uk>

On Tue, Dec 06, 2022 at 10:58:05PM +0000, Mark Brown wrote:
> > Thank you for the report -- looks like I broke it when I fixed it last. ;)
> > It shouldn't break in the current master.
> 
> Thanks.  That fixed the immediate thing however I ran into
> another issue while trying to test it:
> 
> | $ b4 prep -n b4-test2 -f next/master
> | CRITICAL: This appears to already be a b4-prep managed branch.
> 
> Given that I'm asking to start from a specific point I'd have
> expected that the current branch shouldn't matter.

Right, this can be more nuanced than it is right now. It's this blunt mostly
because we can run into multiple troubles here if we're not careful. For
example:

- if you specify a fork-point that's past the start of the series, we will run
  into trouble because we will end up with multiple cover letter commits in
  the history
- if you specify a fork-point that exists on multiple branches, we'll need
  some logic to make sure that we don't use another prep branch as our
  tracking branch -- but only when we use non-default cover letter storage
  strategies

Since my primary goal with this work is to simplify the process for newbies
and occasional committers, b4 tries to enforce the workflow of 1) switch to
the branch from which you want to fork, b) specify the tag in this branch that
you want to use as the fork-point.

I may either add the logic above, or just give a less obtuse error message,
such as:

    CRITICAL: This appears to already be a b4-prep managed branch.
              To avoid possible ambiguity, please switch to the branch
              on which you want to base your work and then try again.

Or a bit of both.

Thank you for the report.

-K
