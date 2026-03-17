Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8B3F54A5;
	Tue, 17 Mar 2026 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.95.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766709; cv=none; b=lUPyfBzch3unzvZUVdUFJK3wZUlWfDQkico5USGdQKskBbeqcJT80HRFOO001mnBNhZjKoA9Tj9kHiTaT4ojS67B+uWWxeiEwQr7lz0NmnIhE1ru0mZ4nhXC3+14bWDGsndE/ZQqFabEUiGXt8+o0fKou/v/o4Z4XdupaSIlddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766709; c=relaxed/simple;
	bh=xJGVFSz7J7RTuWThX++HP+JtsH/E2hNViNNUnLMggR4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c1xyC6NDnJS7f5xtqFmssxEty2fyKy4OqAjNhoU9Bvi+L0jaXDIMI6p0wjkJ7Mcy4/QW9vQwlafxMC6amrlaM/7KHE4sHkyCAqRLPqTcvY+GsqaPlinZKZdtFJbFY+RAXlFk+ythIUmhwBgbIshMX2pg+Qa9ehIZAOjfeHW+Eh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk; spf=pass smtp.mailfrom=toke.dk; dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b=oJIgvoyC; arc=none smtp.client-ip=45.145.95.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="oJIgvoyC"
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1773766279; bh=xJGVFSz7J7RTuWThX++HP+JtsH/E2hNViNNUnLMggR4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oJIgvoyC9QpSj5N/9CQPA2V6rDQgfeKu9BSAnvtPVtJUHMYHntQ+Bq5n/lPKjUMdU
	 8LrmP4a4O4xUu2EayAh6/z9gFQIMbDTQZ57kQKR6DQ8p8zDBh6056jKCadCupwdT9m
	 XgWeys/gNinV1x0DctbUYI78WNwPtIoNES/3lnC8+08yew/FAedm+D1XJs89UKqfAw
	 KlbCgtsTjnNvlNqyeHhmGo6tZ0P7Wgqh+26Yi3jhur/MKY22zbPZTmTsey1LO6r8jQ
	 S3Fl7FD0rZQYwxiyG/BdjKcATfE9Hrr2OyhWLoSSTq+QNu05WsA3EyG9cDLUsk4Nnn
	 7T19Bdpaawj5w==
To: Paul Moore <paul@paul-moore.com>, Chuck Lever <chucklever@gmail.com>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, users@linux.kernel.org,
 tools@linux.kernel.org
Subject: Re: Using "b4 prep" with Stacked Git
In-Reply-To: <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
Date: Tue, 17 Mar 2026 17:51:18 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v7euo0vt.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paul Moore <paul@paul-moore.com> writes:

> On Tue, Mar 17, 2026 at 11:08=E2=80=AFAM Chuck Lever <chucklever@gmail.co=
m> wrote:
>>
>> Hi Konstantin -
>>
>> I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
>> juggle the many data items involved with posting kernel patch series
>> for review. "b4 prep" seems to fit that bill but it has some issues
>> when it comes to large cover letters with Stacked Git.
>>
>> The branch-description strategy is the least-bad option for StGit
>> right now, but it's fighting git's design -- git config was never
>> meant to hold multi-paragraph prose, and there's no way to tell StGit
>> "don't print the branch description in stg branch --list."
>>
>> A file-based strategy would solve all three problems cleanly. Something =
like:
>>
>> .git/b4-cover/<branchname>/subject
>> .git/b4-cover/<branchname>/body
>> .git/b4-cover/<branchname>/changelog
>> .git/b4-cover/<branchname>/recipients
>
> Fellow stacked git fan here.

And here! I have been using the "cover letter as commit" mode of b4,
which works as long as you remember to 'stg commit --all' before you
invoke b4. I requested a pre-hook functionality in b4 to automate this,
so will take this opportunity to bump that:

https://lore.kernel.org/tools/87ttdkrylx.fsf@toke.dk/

-Toke
