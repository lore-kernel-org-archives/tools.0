Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.401.1587654466557442374
 for <tools@linux.kernel.org>;
 Thu, 23 Apr 2020 08:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E9u6o2aw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f193.google.com with SMTP id n143so6694066qkn.8
        for <tools@linux.kernel.org>; Thu, 23 Apr 2020 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HhIXk32ury5RPPlfymEZncr2YCO+AriXGQ4q2f3aapw=;
        b=E9u6o2awVb2nitNB8jZF2TD3T9mTx1oqK4u+MByycwh55Sh6N9hRAj/GLEu7f3sPpy
         cL17FQQFg2cQA6noVz0wYsUdC+9yWOAdMr6drTTC/WzQN1UWcx9Q8KtMpr68uRQ5WCrp
         7OfJE6MXvp5BLaY0huyk/mVinuwKkjDaFXafc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HhIXk32ury5RPPlfymEZncr2YCO+AriXGQ4q2f3aapw=;
        b=jk08NrMA1tNoUgWcdHvfx2nIF4H6rpAPrJgsvnYIaGSjHKfXrq13zI+6ALvIqhEu+g
         tjIuuDKLSceI1lrQcGVli5OebhNQKuvBZCysp7a5AUN/Y/qpFF5gr3I3uNyiEsa2nFh4
         MTPwr6h6CQ8OXbcLkSEWe8FOQn418KiLkwoDt+9SMq5OwFyvklNEB+woon3QkxlMnBlf
         Dm57bS2cbt1CAF7VJ/qsRDDnEleBUtBuYG+uKIRW1GA7S+JwhzXPNj7WLZoUMuqJMzFL
         BBzKpZQerb6An7IswjLnboismXMAmc5ZYGPfuhJENTGYt0t0BfHMpsrmeGuWZqTkgi99
         cwPw==
X-Gm-Message-State: AGi0PuZzYcmSotj4PAemG7xZmN7MhgNLFLBDb2ezaY7LQVNtZRQOu15O
	9VLMtYDKd9qjWht/VkUdEGyegg==
X-Google-Smtp-Source: APiQypJH2wh3mqADlBVS34GJDNwazMEzA1G/hlLlcOyZoShXOhj9OnmWGb1qELuiKJlPZGRWd4QC9w==
X-Received: by 2002:a37:cc1:: with SMTP id 184mr4136221qkm.490.1587654465599;
        Thu, 23 Apr 2020 08:07:45 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id v37sm1908945qtc.7.2020.04.23.08.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 08:07:44 -0700 (PDT)
Date: Thu, 23 Apr 2020 11:07:43 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty doesn't respect -b for prs
Message-ID: <20200423150743.xtjmpgukvidqcghw@chatter.i7.local>
References: <20200422140637.GI4898@sirena.org.uk>
 <20200422224345.jx7f6w7h4aisae6v@chatter.i7.local>
 <20200423101733.GA4808@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200423101733.GA4808@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 23, 2020 at 11:17:33AM +0100, Mark Brown wrote:
> > > (asoc-5.7 is for-5.7 in my sound tree, the merge commit is now 
> > > published.)
> 
> > I see that your message says "undefined" here:
> > https://lore.kernel.org/alsa-devel/158756395814.23495.171205742201395813.b4-ty@kernel.org/
> 
> > I'll see if I can find something nicer for it to say instead.
> 
> I'm not sure there's something fundamentally better - it's basically
> "local tree" and not all of my local branches are tagged as tracking
> branches in git.  Should've proofread properly before I sent it out.

Well, even if it says "local tree" as the fallback default for 
${treename}, that will be more informative than "undefined". That's what 
I'll probably set it to.

-K
