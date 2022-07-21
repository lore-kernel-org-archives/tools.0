Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D1D1FA5;
	Thu, 21 Jul 2022 00:59:40 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-118-63.bstnma.fios.verizon.net [173.48.118.63])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 26L0xVKZ002402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 20:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1658365173; bh=ZHTYxMug+BsRXfz9anHCjQwFZB5+ekvjOtFW41X+o74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JvLCnOudkrFmXYK29CmgKTd3ewwrnBLN9rLPZDw/TuHbRdZRTZLuXKqXaMTkLC9LX
	 JI5Jl+fp7hA3WVpQsu7QaGblOZi7F3m85L660XkmO7LyGjUPGwJzBcDEQ5M6zWRJ5u
	 z9i1fWIJPl3Q3uSzkpLAOxNENHlFU4I88bYHd6m8WkWc3q04K9lDfG/WNgNKVFMWAH
	 7lJkcg7f5yYxEffOXDgY3PQAtECkiYNV4VkEP95FrRpyh9Lh4pKyyR9ho22E9BeNRI
	 zieHCDCW6uVbrL4cVW9YJTzt/2DKu3+Bj8OIFPkCWDPSCF1WdUpfKywydtSvIEfipj
	 UIF8haDpevEcg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 6BB5A15C3EBF; Wed, 20 Jul 2022 20:54:07 -0400 (EDT)
Date: Wed, 20 Jul 2022 20:54:07 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Junio C Hamano <gitster@pobox.com>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <Ytijr4YQn1OB88P8@mit.edu>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca>
 <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
 <20220721000256.GS5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721000256.GS5049@ziepe.ca>

On Wed, Jul 20, 2022 at 09:02:56PM -0300, Jason Gunthorpe wrote:
> 
> I'm getting the impression that people are building series in git
> without using a lot of 'rebase -i' ? How is this done ?

There are lots of different mechanisms.  Some of them are syntactic
sugar on top of git rebase and/or git cherry-pick.  For example, there
is "Stacked Git"[1].

I used to use "guilt"[2], which I liked because it stored the patch
series as a quilt patch series, but when you used commands like "guilt
push" it would apply the patch to the current git branch, and "guilt
pop" would remove the patch from git branch (i.e., the moral
equivalent of "git reset --hard HEAD^").  You could then edit the
current using "git commit --amend" and then "guilt refresh" would
update the quilt series to reflect the changes made with "git commit
--amend".

The reason why I liked guilt is that since the source of truth was a
quilt patch series directory, I could keep the quilt patch series
under checked into a git repo, and so I could easily look at a
previous version of the patch series if I screwed up.  Rebasing to a
newer baseline was also pretty easy --- "guilt pop -a; git pull .... ;
guilt push -a".

Alas, "guilt" is now unmaintained, and I've gotten a lot matter at
using "git rebase -i" and tagging different versions of the patch
series.  But there are certainly a large number tools for different
developer's work flow.

[1] https://stacked-git.github.io/
[2] https://github.com/jeffpc/guilt

					- Ted
