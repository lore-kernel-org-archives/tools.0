Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7F2877D9
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 03:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760413147; cv=none; b=GxIhatyzCsB/EMTgTRIccbHF9wnwNFQQXbpbLECuQ+XCN73SgcIUNhYTXCgWyx3n7uKd6dsMp5MB4z4mmK97jg87XmT4jZIdNGRGD8THxiGwyxdQjvsalidX6ZOo/GLymdQFYu78XsL0f3AMMaC3CvAW0VcL4OGyGuAzHFcKNaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760413147; c=relaxed/simple;
	bh=7lqQMzOEo5VRq51dzo750icb7uc/bRQJoodMEEKTIVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhlrWr8Eb/5wVbSFdk8QcUd6zxvWqqeqkO7HF/mRbyzpDxZbtnx0eYQ1WgvwKSFM1gpprz+2Z9DAKibb4wz72bqC7juXTQ5kAQ3ZxyDYfmdE4BEBW5+qQSrAhOz+IBW6n6sTylOtNZIThWcLG3WAJ5lDWejWG3S6Ua2RWSsbG0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=AKug6iFy; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="AKug6iFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1760413140; bh=7lqQMzOEo5VRq51dzo750icb7uc/bRQJoodMEEKTIVI=;
	h=From:Message-ID:From;
	b=AKug6iFygyjoCfF4wFkd7S6kweIRntqv/3ej60b2Y35UowixIFq53x8G9MdUJL7Dp
	 wxU0+RB7FzEbOE2GsVWDjPTkWIpbz3tctmwMLQh3mIdapzh0l61FcJqchdZS+yRJHR
	 5uYQzkG71pgvTCIFeje1yMerOQaL+7I10diNEzjA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id B40D5C0926;
	Tue, 14 Oct 2025 05:39:00 +0200 (CEST)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 59E3d00S003170;
	Tue, 14 Oct 2025 05:39:00 +0200
Date: Tue, 14 Oct 2025 05:39:00 +0200
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Junio C Hamano <junio@pobox.com>, Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251014033900.GA3126@1wt.eu>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
 <xmqqy0pezhm7.fsf@gitster.g>
 <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Oct 13, 2025 at 02:44:28PM -0700, Linus Torvalds wrote:
> So rather than doing a separate branch, rebasing things there, and
> going back and rebasing away the things in my original branch, doing
> just 'git rebase -i" in the original branch and having some way to say
> "this is the start of this series", and a "this is the end of the
> series", and having git rebase create a set of linear series with
> merges that delineate them might be quite convenient.

FWIW I'm using "git rebase -i" a lot, that's probably the command that
really makes git magical from the developer's perspective. While I know
it's possible to keep empty commits, it"s usually not welcome because
the purpose of rebases is to be able to rework a series by moving things
around and eliminate those that have been nicely integrated.

Thus I think that what would really be nice (and that I've been missing
many times) is a type of commit that git recognizes as a delimiter, i.e.
it doesn't contain data, but *something* (maybe a dummy diff on /dev/null
vs itself?) allows git rebase and git am to say "OK that's not the regular
empty commit, it's one I have to keep anyway". Then one specific option
of git am or git rebase could be used to turn that commit into a merge
one.

This would allow to keep the history linear the for the longest possible
time with cover patches at the end (or maybe the beginning, like 0/X),
it would ease running git am on a patch series starting at zero, and
would let the merge commit be created at the final point, maybe even
just on the side of the final recipient (you in your case).

> I say that without having actually tried it, but from a "I think I
> would have found that useful in several situations" kind of way.

I'm one of those. On projects moving slower than the kernel, it's easy
to avoid merge commits and keep the history linear for easier backports,
but clearly series delimiters are missing.

Thanks,
Willy
