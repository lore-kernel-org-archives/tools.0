Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740927492
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 23:39:43 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id b25so167340qka.11
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3pmyim3eLkUGO1W4EQARx63jh+6ewapw5hbNSQNs2Nc=;
        b=dojeGFvozQURCgdz3e0wIiV7hKz+i9fNrnFKpGTw9W67vVLp3sFBQzCXHaxMbQmPJA
         nveQcav1sAly0bg05+CVI5aLckDQSCFgzXj1O9FjNM6jsJuppuA1U6JzqVbXTWWCWvAq
         KxR57rs143AkfG5bFj1172ykKwYfDksEY+SRbwA0MAoIxdBTQnLaJgEDNXuwCZGU7DKe
         4tzP0S2qJOrI+rmo3bJCMtxXG0ePOqf9/gLebheKB0d51hun83zB97LXjy6JfnN4Qnm7
         fgm0fNGxG8ORL13dv/qnXeTH/S21kOp9XdteIWSOhjE+RtL7cXhBk8sBfv86arv5xPfE
         HRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3pmyim3eLkUGO1W4EQARx63jh+6ewapw5hbNSQNs2Nc=;
        b=f3SzKWBqKuK8UPUndKgFIM3ilFU5Gg5ppxeGXqnciI8NhqbF5T6josjMgssqj2TPm/
         Gdg9rjzNcJWXsFmtXN+jeTf6xExsqPCtJE4p9O62+758VHhcN8y8X8N6sV1vNy0ZQ7V9
         iTwtRy6LYmL4E8GMb/4+rPJPkj9ND1RrTpV5Tfs4fkS0Q5Flxs/Jy9fAOQawJ45BO0+r
         tTxaBoLHXnNCFl4fvtfOmzFdztFHB9eNAzsqULdrRAwgYBzGerRY7u5m9Ag4bHHNH4Kz
         i48ZmQpptjz1fnPzRWAx8bWtBhTNXRYH4ZmYHTx+qrhGQdT+EDGLpZxTd859Tkth0Yop
         1OxQ==
X-Gm-Message-State: AJIora+Om6SP4/Y8T9WNFmrFLqtdLfKLyxGhOFVny0hFVg/qoAvaJEtw
	7x96j1czfWEYIqdMaEN4xPuoEw==
X-Google-Smtp-Source: AGRyM1sUaAEDsGGbzwD18koX8G3+1BxGNsNqsK1SEgRcfNwVlHNS7yaXJ/xf5DM1Lfq7qisiM4S7FA==
X-Received: by 2002:a05:620a:2710:b0:6b5:bf24:10e9 with SMTP id b16-20020a05620a271000b006b5bf2410e9mr24040120qkp.28.1658360382303;
        Wed, 20 Jul 2022 16:39:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a454c00b006a716fed4d6sm394689qkp.50.2022.07.20.16.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:39:41 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oEJI4-001hgi-SJ; Wed, 20 Jul 2022 20:39:40 -0300
Date: Wed, 20 Jul 2022 20:39:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Junio C Hamano <gitster@pobox.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720233940.GO5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>

On Wed, Jul 20, 2022 at 04:23:57PM -0700, Linus Torvalds wrote:

> The argument against branch descriptions was always that they didn't
> move around with the branch when you use git pull/push, but for the
> stated use of "branch for sending emailed patches with a cover
> letter", the notion of just having it in the branch description seems
> to be exactly the rigth thing to do.

The thing is not all workflows are "single developer working on their
local machine and then emailing patches". We have "team" workflows
where patches are being shuffled around with push/pull, not email, so
those push/pull problems quickly become relevant. 

Quite often the person who writes the patches and the cover letter is
not the person in the team who is going to git send-email them.

> It also has the advantage that you can edit it at any point, so people
> who don't want to write the cover letter until the very end (as
> somebody piped up in this thread) can continue to do that

If the cover letter is the last commit then 'git commit --amend'
allows editing it as easily as 'git branch --edit description'.

Generally though I think git could use a good built-in tool to edit
commit messages quickly without having to rebase or touch the working
tree.

Jason
