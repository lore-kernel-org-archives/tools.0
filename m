Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978D7A;
	Sat, 16 Jul 2022 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1657982599;
	bh=w2kI1hcLZvzoj5kqt+S8weiMo2Gf9RtMzpA/w1/tlkk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RVXJLSSJHzaNcyhV6dZhFsXxRnELmJAKjY0qzET7mg0ajK5eBqtWLdUEaspLG0gDM
	 znCtCLSVXvVwFq9PiEUnOPrmq/4yciSzLtUxo4Lw+bySn/lyJ9xl+UhWy1iXo7eluI
	 A0opR3Pq+pnT48dwsvpPWGrcOQWPf0e0UcFnkQNo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C70D012804D9;
	Sat, 16 Jul 2022 10:43:19 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAMPQ2GUQFOU; Sat, 16 Jul 2022 10:43:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1657982599;
	bh=w2kI1hcLZvzoj5kqt+S8weiMo2Gf9RtMzpA/w1/tlkk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RVXJLSSJHzaNcyhV6dZhFsXxRnELmJAKjY0qzET7mg0ajK5eBqtWLdUEaspLG0gDM
	 znCtCLSVXvVwFq9PiEUnOPrmq/4yciSzLtUxo4Lw+bySn/lyJ9xl+UhWy1iXo7eluI
	 A0opR3Pq+pnT48dwsvpPWGrcOQWPf0e0UcFnkQNo=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4370212802F8;
	Sat, 16 Jul 2022 10:43:19 -0400 (EDT)
Message-ID: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
Subject: Re: b4 submit ready for beta testing
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, tools@linux.kernel.org
Date: Sat, 16 Jul 2022 10:43:17 -0400
In-Reply-To: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sat, 2022-07-16 at 10:29 -0400, Konstantin Ryabitsev wrote:
> After the branch is created, b4 will create an empty commit that will
> serve to store the cover letter contents and some tracking
> information. You can view the raw commit with "git log" just like any
> other commit, and you can even edit it with "git rebase" but it's not
> recommended. It's much better to use "b4 submit --edit-cover".

Could we please stop inventing stuff that's incompatible with a
standard git workflow ... or argue with the git maintainers that what
we want to do is better and persuade them to add it?  That way git and
b4 are fully interoperable ... for those of us who aren't dedicated to
one or the other.

The standard git way of storing cover letters isn't in an empty commit,
it's in the branch description.  To be honest, this does seem a more
logical way to do it (a commit can get lost within the branch), but I'd
be reasonably OK with either mechanism, provided both git and b4 agree
on it.

Regards,

James


