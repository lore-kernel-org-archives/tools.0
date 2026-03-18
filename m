Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8EC3DB623;
	Wed, 18 Mar 2026 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.95.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845081; cv=none; b=UZmBJ2y8uC5Y3AO2WjrHdXDPTcewGtXV7ZQFbmx2KGdPKUWJXOU/kZwYHXqUs2JNtgqR/XjO9Puk9yaDkO4HPQpkXXX3JgQBhOS6sw54+GtQHHIxs1nE+6YfXP48plthk/LQ0DD8pSl7z73lwI9b5SQ6uxRCKF+FkgBLhDuOoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845081; c=relaxed/simple;
	bh=74PkM8/gCSVvVNEVvEEfeVSIEsPsk86WlIv8cg49rno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HqEhRxZC9D9sWYUdxfXf83qHsG3ZTq7J9iZfPlz4cNcafAeqmbA6m8JM4t7W9TO2q9JnmesniZlii7VaJnCLtEEEEN/r8gAHaToSny1P/w1gBV26XlDdwtmw4vJQQ9H+iEnTJJx25AF0WICassqbrPd10qq0Ff9C6VOV2utq0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk; spf=pass smtp.mailfrom=toke.dk; dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b=OZYS/BLn; arc=none smtp.client-ip=45.145.95.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="OZYS/BLn"
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1773845075; bh=74PkM8/gCSVvVNEVvEEfeVSIEsPsk86WlIv8cg49rno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OZYS/BLnmpy8AC2yKWN647umwX8GKy3cry8Hw8GYfV14DskQR1fPB00PJZeflmzp0
	 2Q2+xQIBJC3fm9IOeOaeoXxCNtQfcedi/wA90TmLJJPUwmHPQemomrMf+eEiHNBOPj
	 Be2b0uJ7GLEEx18NhA8XyA+7yu4+dA5Y+INgMq83ZwtdO0t6vR7WR3CXNntYbnoe5Z
	 KQHooV4apX5/Rsze67BoWZh9ZReCPWHJ5xVIwbE4A3mLx/mOtN8wKO1YX9dsyYt/Kx
	 2RV6JE0hIZKIsvc7a/WsvH//kVWoIRLSEaC1MT7fV7rpUehxSzXBjPF+2eGZhJ6sbu
	 a+kcYIxq3DwLw==
To: Chuck Lever <chucklever@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, Konstantin Ryabitsev
 <mricon@kernel.org>, users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Using "b4 prep" with Stacked Git
In-Reply-To: <CAFMMQGu3FZKde_EK29Croffoqt_xucM--8CCJQ8QT0uHoeZUSQ@mail.gmail.com>
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
 <87v7euo0vt.fsf@toke.dk>
 <CAFMMQGu3FZKde_EK29Croffoqt_xucM--8CCJQ8QT0uHoeZUSQ@mail.gmail.com>
Date: Wed, 18 Mar 2026 15:44:34 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87jyv9nqnh.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Chuck Lever <chucklever@gmail.com> writes:

> On Tue, Mar 17, 2026 at 12:51=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen=
 <toke@toke.dk> wrote:
>>
>> Paul Moore <paul@paul-moore.com> writes:
>>
>> > On Tue, Mar 17, 2026 at 11:08=E2=80=AFAM Chuck Lever <chucklever@gmail=
.com> wrote:
>> >>
>> >> Hi Konstantin -
>> >>
>> >> I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
>> >> juggle the many data items involved with posting kernel patch series
>> >> for review. "b4 prep" seems to fit that bill but it has some issues
>> >> when it comes to large cover letters with Stacked Git.
>> >>
>> >> The branch-description strategy is the least-bad option for StGit
>> >> right now, but it's fighting git's design -- git config was never
>> >> meant to hold multi-paragraph prose, and there's no way to tell StGit
>> >> "don't print the branch description in stg branch --list."
>> >>
>> >> A file-based strategy would solve all three problems cleanly. Somethi=
ng like:
>> >>
>> >> .git/b4-cover/<branchname>/subject
>> >> .git/b4-cover/<branchname>/body
>> >> .git/b4-cover/<branchname>/changelog
>> >> .git/b4-cover/<branchname>/recipients
>> >
>> > Fellow stacked git fan here.
>>
>> And here! I have been using the "cover letter as commit" mode of b4,
>> which works as long as you remember to 'stg commit --all' before you
>> invoke b4. I requested a pre-hook functionality in b4 to automate this,
>> so will take this opportunity to bump that:
>>
>> https://lore.kernel.org/tools/87ttdkrylx.fsf@toke.dk/
>
> To quote your 2024 email:
>> So, my feature request is this: add support to b4 for a hook command
>> that is executed before any operation that will rewrite history - and
>> abort the rewriting if the command fails.
>
> Ha! I set up a hook in my stg skill to interrupt Claude before it
> tries to modify the series using raw git commands. Same hazard.
>
> I looked at using the commit strategy and felt it doesn't work well
> with my own stg muscle memory. I didn't think of using a hook.

So that's a +1 for the hook feature request, then? ;)

-Toke
