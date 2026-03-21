Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5282C0261;
	Sat, 21 Mar 2026 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.95.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774126400; cv=none; b=oxE2J3mU9Pi7ElVWrtSCobc5/zzzSJ62m0GRV3/P4hLWT/5l9iASvQnkswzwVDotGNTGCf20nyPz+mYGEXX5LaO2AQeSOEZuu0gU/mvwq0j+X4u2VsU57Ha3OGL8Cdovnof8p6b8C42rZW7hi+DZLoLY3dUj0CiWtLfG0uHpZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774126400; c=relaxed/simple;
	bh=wfIKzdwVURBIW/3ed2UkCn6AV6MiOdy8PVwUlYr17B8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nZqkIxYIB+ecHTo6lycWjFDP2tW5Ws5UXiEMUcJRyoku/A4Ci9d2EL+pcV41PBMJkQsOePK8eqW7Co/x4Pl5aJxpxohx/MVpukJMkuqmnNH5CuBfdFUCBgwkrDutNUuTpO9AQ97q7Mi76OmFhim+gfNJqUCnmxhLd+p2b5ONMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk; spf=pass smtp.mailfrom=toke.dk; dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b=VOBOEndF; arc=none smtp.client-ip=45.145.95.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="VOBOEndF"
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1774126389; bh=wfIKzdwVURBIW/3ed2UkCn6AV6MiOdy8PVwUlYr17B8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VOBOEndFUdFLk882g541inavOiQ/mByXa2pznjIx1CWq2tnWbhoepvrzdX1oJontS
	 TiUXxJqwN1wWxmu1JslarOSKrzQMI5xg4G8qApXmJtDSebtjLBeSFB8NIjZkz8H/XV
	 P4kaK5xSTKZ+m1FafhbUVgERjK/OCQqzbkP1cqxKLMLC/iulAhP7SZo6VPoGIZcqXt
	 OR7uab6DMOCwHjjG8Eg1boyo/2rMD+z6qk3rXHkBnIs9L3j+wSY/n/cqNhfHQu3RQb
	 2XLbiHhTEv0yF//NP9l0KykIzxUEpLpMPDGJi6ygkb1EjwUNZA7drXRoN6ZyBzk3CP
	 U+qZuBLdJf9pA==
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, Chuck Lever <chucklever@gmail.com>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Using "b4 prep" with Stacked Git
In-Reply-To: <20260320-humongous-owl-of-reward-534ea0@lemur>
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
 <87v7euo0vt.fsf@toke.dk> <20260320-humongous-owl-of-reward-534ea0@lemur>
Date: Sat, 21 Mar 2026 21:53:08 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87341soqff.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Konstantin Ryabitsev <mricon@kernel.org> writes:

> On Tue, Mar 17, 2026 at 05:51:18PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> And here! I have been using the "cover letter as commit" mode of b4,
>> which works as long as you remember to 'stg commit --all' before you
>> invoke b4. I requested a pre-hook functionality in b4 to automate this,
>> so will take this opportunity to bump that:
>
> This is now in master, in case you missed the bugbot notice. Please let me
> know if I can do something else to help, and thank you for your patience
> waiting for it. :)

Great, many thanks! Will take it for a spin :)

-Toke
