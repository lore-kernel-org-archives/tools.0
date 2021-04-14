Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9C6D32
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 17:40:09 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id h15so500355qvu.4
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=vhpvzZdRlT1JNPE+G9X0HD+Y+QVdR98OScCtEXZbDxk=;
        b=H9Rc4+oRPLwnqoCiaKL56esBBzz/8xQVXmhvQ70bjdFAlxjSmwRjPBDARnTHle+eEB
         nn3+JL5GJ64eHG1UfZEWVptjAfH5Z4D5mWBJBNlWsLJ4Jt5G/GDFTEWO1B5CsezHah4o
         unMhok0yNeWumGayT5YacbFobpQ6kS9R3hfec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=vhpvzZdRlT1JNPE+G9X0HD+Y+QVdR98OScCtEXZbDxk=;
        b=iOK3bxA7eYs5yl0iipExUdPyPLyl06GGXc2q5rT/0Vqlm7/hi1OyYdqU8YVmOijWnC
         b3WJgaFVkoKWrBF73nffwn6/YGey6HziL8nHhQC2bJV+iZsaf4EVrRkBoEn4wlbUAx9g
         gV+Zg3S5J2HyTbrCYnU1LCpo2SHVLwJ0NGEom0nyjV1y1Ggm/Bh0KN0p5N4LG+A0cUrz
         edv7Au9gBAuCSm0OaF6jfqVqj9r2xA74vi/SN0Vh0OachFSjCc6KizqZMPHthJLuYcwJ
         ZVhexKIebk9PGGgK40fuF1A3P3hTMI7UKA5upEFIW9ZniC2tbSO9FbOMsF8wWJRPovZg
         SfAA==
X-Gm-Message-State: AOAM531Qer1oamXo0own+r/3lkYWKlyBaebhYsUTtNZ/u5K/0UW4d0pp
	vmUgn+eKR4xo+clv9qUxfRM4lA==
X-Google-Smtp-Source: ABdhPJyS4JK0BwP+Fid3rycmtp4V2iyQNNwICpoqMR6+VdRsxW2a2+xQfnSzMINKr5eb49S9/35uNQ==
X-Received: by 2002:a05:6214:36d:: with SMTP id t13mr26278164qvu.49.1618422008682;
        Wed, 14 Apr 2021 10:40:08 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t4sm72554qkg.75.2021.04.14.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:40:08 -0700 (PDT)
Date: Wed, 14 Apr 2021 13:40:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414174006.jiqjanaelhqvpspe@nitro.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414145619.packpzwjauqj4fug@nitro.local>
 <20210414155733.GO227011@ziepe.ca>
 <20210414170751.cpdciflb4vqtkvau@nitro.local>
 <20210414172449.GP227011@ziepe.ca>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210414172449.GP227011@ziepe.ca>

On Wed, Apr 14, 2021 at 02:24:49PM -0300, Jason Gunthorpe wrote:
> > 1. "b4 am" learns a --newrev flag that populates "Obsoletes:" trailers 
> >    for your own patches it grabs from the list
> > 2. when you're ready to start working on the new version, you run "b4 am
> >    "git am" it to a new branch (similar to what I described above)
> > 3. b4 additionally learns a command to grab new trailers from the list by
> >    matching the Obsoletes: message-ids and auto-amending commits with any new
> >    trailers
> > 
> > This would allow you to start working on a new revision whenever you're ready
> > for it and give b4 a precise match it can rely on when tracking new trailers.
> 
> While I understand the interest in exact matching patches, I'm not
> super keen on adding more headers to every patch - this feels alot
> like the gerrit change-id header that everone hates, just in another
> format.

I know what you mean, but we can also take steps to make sure that it doesn't
leak into final commits:

1. a sendmail-validate hook can move Obsoletes: trailers below the ---
2. regular "b4 am" runs can drop any Obsoletes: trailers they find
3. even if it does leak into the final commits, it's not as bad as Change-Id
   because it's not just an obtuse string, but a link leading to a mailing
   list discussion

I think just setting up a sendmail-validate hook will be sufficient to prevent
any negative problems with this strategy.

-K
