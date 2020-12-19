Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by mx.groups.io with SMTP id smtpd.web09.8342.1608380951761697929
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 04:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toke.dk header.s=20161023 header.b=euXRM9HP;
 spf=pass (domain: toke.dk, ip: 45.145.95.4, mailfrom: toke@toke.dk)
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1608380947; bh=UM6C5qGinfdxeotUtMaWbMdgnbMGL0g24QhyLBzrA6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=euXRM9HP7HKWupxgxbov/24O3jlhNpb5fRhlVge8Re0y4IgWBv1DBtW5bD3BWPHhu
	 E81pq/ej141nAX0xX0xUwp701ikR4M0xNEn4CYvGSyP83w2OwqkiyU0Zrn3L5OKaaB
	 RIcGVzrVmy3wy/4Str+JWRcH0skyeEMh7OmnFV9EQZBvg3jL3SFIKufwb+fvLY7iFJ
	 GGEHBRyMo2SrM60uDKxcgQGxCy5bazpCeqUAtAFjfmB/4Yq3HwmeCwQ87zd4KTbSZT
	 uf2Ryy38rkGYZsyYbB/t2/VTEoMThyj9pu5R2MjvIg9n20wGH53aQC10ycZlH7sUo1
	 ZzqpRx2k/7Cqg==
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: b4: encouraging using the cover letter in merge commits?
In-Reply-To: <20201218220916.p2yzwotpantfqtss@chatter.i7.local>
References: <877dpeol5w.fsf@toke.dk>
 <20201218220916.p2yzwotpantfqtss@chatter.i7.local>
Date: Sat, 19 Dec 2020 13:29:07 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <871rfmnfn0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Dec 18, 2020 at 10:32:11PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> I notice b4 will already save the cover letter along with the patch mbox
>> file, but maybe it would be possible to automate the workflow some more?
>> A 'b4 merge' command that wraps 'git merge' and pre-populates the commit
>> message with the text from the cover letter? Or some other trick? WDYT?
>
> I've been careful to operate on the "principle of least surprise," which =
is
> why I try not to make any changes to the git repository directly. B4 will=
 use
> git commands, but in a way that don't modify the tree (only prepopulate
> objects behind the scenes, etc). For this reason, I'm wary of wrapping any
> git commands directly with b4.

Fair enough :)

> One way I can think of is to save the payload of the cover letter into the
> .cover file, if we recognize that we're in a git repository. Then, when
> performing the merge, you would run:
>
> git merge -F .cover --edit --log branchname
>
> This will preload the cover letter into the merge message and let you edi=
t it
> before performing the merge.
>
> What do you think?

I think the above would work - just putting the text of the cover letter
(without the email headers and diffstat) into a file for easy inclusion
like you suggested would likely be helpful. I'd probably name it for the
branch, though (e.g., .cover.$BRANCH ?) so that it's possible to create
multiple branches, flip around between them, and still have the cover
file be there when merging later.

I played around with creating an alias for the merge command itself, and
while having to include the branch name in the filename rules out a
simple alias, just dropping a script like this into $PATH and naming it
"git-mergedesc":

#!/bin/bash
exec git merge -F .cover.$1 --edit "$@"

makes it possible to just run 'git mergedesc branch' and get the right
behaviour (although obviously a real script should be a bit smarter
about argument parsing and validation!).

-Toke
