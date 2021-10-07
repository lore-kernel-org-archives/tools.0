Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF362C88
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 19:11:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 611C9993;
	Thu,  7 Oct 2021 19:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 611C9993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1633633872; bh=aTzZ65Q2Zxy4oSfx2GhjdjhV2pRbYJNqlrj6elNLbqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OjhjGvF7RnN6Y0+zbhd4zZ+wnwzzqRyBieHTBze69mUyv2ZTdZ9vpVbeUznyTcciH
	 QlPYA4if413tY+F0cXb/LdtOfcLLxrnPZKd13VCxmJIFapXzsQQYYNpPE2fAHkc3eA
	 i36JhOJLQzRioiF5s0wWQj/hnKILB7pN4d5v8rQ8//FXM1caAzvGSFaBkn7FGyMSJD
	 Ap2Ely/Rmjl6qhc9nSNmMLmN8tLZYJxkOWl4y3qiriwVEv60uQoH/40eWLU1A99A9D
	 v83pRuCj+mpIDZV3sw/n7EGeOpQMQ8uW2B6XhMYja/oCpKVBGxkrwAxPXQ8mqN5wJt
	 Gy0FpJtQwnmxA==
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 and git am -s errors (was Re: [PATCH 1/2] ext4: docs: switch
 away from list-table)
In-Reply-To: <20211007182257.tj6vrjgfusizv3ml@meerkat.local>
References: <20210902220854.198850-1-corbet@lwn.net>
 <20210902220854.198850-2-corbet@lwn.net>
 <20210916095455.GE10610@quack2.suse.cz> <877df9tt5d.fsf@meer.lwn.net>
 <YV8EGFcPtM9u+ihl@mit.edu> <87wnmozy9i.fsf@meer.lwn.net>
 <20211007173854.v6wy6cpekbv3lf2i@meerkat.local>
 <87o880zp4n.fsf@meer.lwn.net>
 <20211007182257.tj6vrjgfusizv3ml@meerkat.local>
Date: Thu, 07 Oct 2021 13:11:11 -0600
Message-ID: <87fstczm40.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Thu, Oct 07, 2021 at 12:06:00PM -0600, Jonathan Corbet wrote:
>> My script is still "b4 am | git am", haven't tried shazam yet - it's
>> definitely on the radar, though.
>
> Okay, now I'm curious which version of git this is, since I can't seem to
> replicate this problem -- I just get:
>
> - multiple identical Signed-off-by lines if my S-o-b is not the last
> - nothing added to trailers if my S-o-b is already the last trailer

2.31.1, as packaged by Fedora.  b4 0.8.0 from PyPI, for what that's worth.

Specifically, I do:

  b4 am -o ~/tmp -n am -c -t 20210902220854.198850-1-corbet@lwn.net
  git am -a ~/tmp/am.mbx

...and that prints "Duplicate Signed-off-by lines." and leaves the repo
in the "in the middle of an am session" state.

jon
