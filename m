Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB21854
	for <tools@linux.kernel.org>; Thu, 21 Jul 2022 00:02:59 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id h18so4986351qvr.12
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 17:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FATxzEJGaO/v8vnmDOphJFvU30/HQ7VSfNYox3QH/7w=;
        b=MQv6Ayiz8jzEo1T6FJEQL3ukNtTm7vDUFIqNuAeE7F3Wn6HDWI8oUpDjbZLBHscbCs
         zjn0tc80DqgmuKf525JOJp1RlKX20Xcair0I6VoBDLffsr1OiVyFKgPTo7X8PF1km1rw
         diq+5rItBLDPxMCRwG8TsKeQ8MbRnIf3iPuOnWTizpgjHyfGkAJn04/QCMJv7U2yBdIO
         JZsZL0qjbr79+mKYj12q3B7yPhvg6P0mYo1GlsDm+LQ9PX1EsufDzJ3jynExg0nzReVe
         7gaodGSq5331rBZ9nlB60dIVmrjlTqUZWiuf4wlb6cHLBrGDTAgQOIU/W7iyhTGj7Trp
         Is4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FATxzEJGaO/v8vnmDOphJFvU30/HQ7VSfNYox3QH/7w=;
        b=ex71tecptyrYMleREi6SWWDwEmlMIt94w54S77Y3DkQte1w5fGGFEO7TkmNHJLVdDb
         I0YmJ1dwjgX93937aABK1QcR6nh5Ue1vRSgyEB1pZ5S4Sp2O8fjpLILdLzycHETv+rnK
         Sh0YAd/zDyUyfMr0oIlBQjSYp2eqjL9N2cq7LvNiTyGvv0WSCm6M0kRlS+8HKwnVKna+
         sAqlOZoBlWaCTL3PK1Fyfv1Qk7RXCBq8D3I00JJtHd3BvkB3SfrZaX9kNQPEfrSFhlKF
         DcdsnwG3mD3+upBSYTeqGKacuw8iy0l/EbHUTHbk0NeQjprpgg+1a5D/DxINGmkE8ZIE
         Tbsw==
X-Gm-Message-State: AJIora9gqTxYRZffbLg1uVpmKIXEFLrNehyVuxWngEvHDVpctaA2+31k
	YHKcYAd2cJkICKcu/CksapW9UA==
X-Google-Smtp-Source: AGRyM1v79x0V8XoJIU9/bTH+hNRmmXY1HXER+e0iPAf7a9Q8p8uWLd4EfgI/AhMEuG9z+KRGw9J6aw==
X-Received: by 2002:ad4:5966:0:b0:474:5fa:69af with SMTP id eq6-20020ad45966000000b0047405fa69afmr3946774qvb.128.1658361777812;
        Wed, 20 Jul 2022 17:02:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id cb8-20020a05622a1f8800b0031ece8b6666sm377436qtb.43.2022.07.20.17.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 17:02:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oEJea-001hys-9r; Wed, 20 Jul 2022 21:02:56 -0300
Date: Wed, 20 Jul 2022 21:02:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Junio C Hamano <gitster@pobox.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220721000256.GS5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca>
 <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>

On Wed, Jul 20, 2022 at 04:42:44PM -0700, Junio C Hamano wrote:
 
> On Wed, Jul 20, 2022 at 4:41 PM Linus Torvalds <torvalds@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 20, 2022 at 4:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > If the cover letter is the last commit then 'git commit --amend'
> > > allows editing it as easily as 'git branch --edit description'.
> >
> > .. and what about adding new commits during development?
> >
> > That sounds oh-so-*very* inconvenient.
>
> "git rebase -i" is your friend ;-)

Yeah, exactly.

New commits are not even that likely to be added at the end of the
series anyhow. A new commit needs to be added at the logical place it
belongs in the sequence, so someone should already be proficient using
rebase to shuffle commit order around.

Either write the commit at the end and 'rebase -i' it into place, or
'rebase -i' with "edit" to directly author it where it belongs.

An empty commit is trivial to reorder with 'rebase -i' - guarenteed no
conflicts :)

And when there are issues in the commits I generally end up with
fixup! commits and repeated "rebase -i --autosquash"'s until the
series is done.

I'm getting the impression that people are building series in git
without using a lot of 'rebase -i' ? How is this done ?

Jason
