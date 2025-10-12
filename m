Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33E52A1C7
	for <tools@linux.kernel.org>; Sun, 12 Oct 2025 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760229581; cv=none; b=jDwiOMdubaTb1KcBqQWAxy1KqKkNBpo7RAT6EYE2sdszj46RvIh9d1QlUXeUv8iiQkdwWjLe89NUeJZ8nxwDJd4+kega1O4Z4ZWB9+/y4Ag9T2axPCiYZ+XvXSDluHVlGlBjd4HSrHJzs2cF/mg4AbZBojUnkQZWI2hRdY5Zcg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760229581; c=relaxed/simple;
	bh=JCQ09QRVzSSnqIurPExggaihxoSjupqwbIweDPYQjOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnrNxFsidXQkGc1lCLPA1COBJQxXis3iK12OVCay3tKZ4ByXsD5FF2DeZ7t+kC/rodVMCzRhhC4Srv4/Q5RIi55Z35HqBeVOLG/JsC0hn2jqvO5ZDZKIGzawSZNtz7gK/h2xZBWhBXIVFXoXcrgf+z1ju44S5foTYseO9W2SeYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JydRu3ri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JydRu3ri"
Received: by smtp.kernel.org (Postfix)
	id 4F42DC4CEF9; Sun, 12 Oct 2025 00:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E93C4CEF4;
	Sun, 12 Oct 2025 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760229581;
	bh=JCQ09QRVzSSnqIurPExggaihxoSjupqwbIweDPYQjOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JydRu3riCYPH6Gxatz+OsPoLKspdmvtJe8ZIQI5qwfFaJh7cJo3zQTXD/CXzxJdRw
	 TMgvDk3Qu9NRsXMgw1OQYsugyQbdVmmTuRTO11yNmtEY+QfmFAhv4WxTnYRL8688E6
	 dhPD20edcnRvtuoP48GqIpFFOlqVviNUNPLHMelyXy3LQ/aIJ8NpbGcvvAv7QNjcvy
	 oU90cRDvFl8KYPJG5x4rRmaC4wgVj2gGa0qFzsO4dtS4nd49SRMOJEy9l7MnW8gZrw
	 MPAOTbzTByniTgu+x0+7Smr00BFWq061TRXb2Zkx6toeRTdBMmF2kpERQpvcopXDhG
	 2aZc/ZKwQGP7w==
Date: Sat, 11 Oct 2025 20:39:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <aOr4y6-BYHlWFVEB@laps>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com>
 <aOrqZsBZemu6MkAd@laps>
 <CAHk-=wismGKUUxSRmUr2x8_fXF+L4G1POSs=w+Duu6PVZz4R=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wismGKUUxSRmUr2x8_fXF+L4G1POSs=w+Duu6PVZz4R=w@mail.gmail.com>

On Sat, Oct 11, 2025 at 04:44:00PM -0700, Linus Torvalds wrote:
>On Sat, 11 Oct 2025 at 16:38, Sasha Levin <sashal@kernel.org> wrote:
>>
>> We have plenty of headers in stable-related mails that you can filter by to
>> avoid that noise. Something like the attached patch?
>
>I was reacting to Konstantin not feeling like making it
>kernel-specific, and I kind of agree. It's a generally usable feature
>for any project that uses lore or something lore-like.

Ah, I understand.

>And the commit date seems like the obvious cut-off if you actually
>want a "what led up to this commit?"
>
>But it's not like having special cases for avoiding stable back-ports
>is *wrong*, I just feel like "hey, you have the commit, you're asking
>b4 to dig for the source of it, then the commit date should be your
>*first* filter".

I ran a quick test to see how many commits do the (obviously) wrong thing w.r.t
commit date, and we only have a few of those in the past year:

$ git log --since="1 year" --pretty=format:"%H %at %ct" | awk '$3 < $2' | while read hash author_ts commit_ts rest; do echo "$hash Author: $(date -d @$author_ts) Commit: $(date -d @$commit_ts)"; done

82ab67d762e922bb5df1cbb442e8d4f12c26a7ae Author: Fri Sep  5 05:20:44 AM EDT 2025 Commit: Sat Aug 30 04:38:55 AM EDT 2025
11f74f48c14c1f4fe16541900ea5944c42e30ccf Author: Wed Jul 30 08:49:06 AM EDT 2025 Commit: Wed Jul 30 08:48:43 AM EDT 2025
ca652cf0c2612add5d3c9283bbc742dabc704a77 Author: Tue Jul 22 11:18:41 AM EDT 2025 Commit: Tue Jul 22 07:41:12 AM EDT 2025
a099b09a3342a0b28ea330e405501b5b4d0424b4 Author: Fri Jun 13 11:18:38 AM EDT 2025 Commit: Fri Jun 13 05:38:25 AM EDT 2025
f1a3fac4095c7bc0b30e2aa9921c232af8faeae0 Author: Thu May 15 10:53:59 AM EDT 2025 Commit: Thu May 15 10:19:22 AM EDT 2025
856366dc924a9561dae39f252b45dfd6cc6895ce Author: Mon Feb  3 09:10:51 AM EST 2025 Commit: Mon Feb  3 09:05:02 AM EST 2025
4343af66b8e1df1d3a2e6f1f8612506cb45b2afd Author: Mon Feb  3 09:10:50 AM EST 2025 Commit: Mon Feb  3 09:05:01 AM EST 2025
320155a61f7fc810a915644e9e2a451bdcea90b1 Author: Mon Feb  3 09:10:49 AM EST 2025 Commit: Mon Feb  3 09:05:00 AM EST 2025
f0173cbe7fa79eafbdf32eed32337209f84ddacd Author: Mon Feb  3 09:10:48 AM EST 2025 Commit: Mon Feb  3 09:04:59 AM EST 2025
cbe37a4d2b3c25d2e2a94097e09b6d87461b8833 Author: Mon Feb  3 09:10:47 AM EST 2025 Commit: Mon Feb  3 09:04:58 AM EST 2025
e995c51903384be1c7aead246dc30cb5244179ac Author: Mon Feb  3 09:10:46 AM EST 2025 Commit: Mon Feb  3 09:04:57 AM EST 2025
b9fb91692af881736f8fa1741fa0dbadf07d99ee Author: Mon Feb  3 09:10:45 AM EST 2025 Commit: Mon Feb  3 09:04:56 AM EST 2025
79ebb596201c86712fe38b0ef73d25d07b932664 Author: Mon Feb  3 09:10:44 AM EST 2025 Commit: Mon Feb  3 09:04:55 AM EST 2025
7d92a38d67e5d937b64b20aa4fd14451ee1772f3 Author: Mon Feb  3 09:10:43 AM EST 2025 Commit: Mon Feb  3 09:04:54 AM EST 2025
e92f042642aed6f6206caace892d9df2d0166841 Author: Mon Feb  3 09:10:42 AM EST 2025 Commit: Mon Feb  3 09:04:53 AM EST 2025
dc561ab16d8be9cbe8f07a49a7b2f5428fbcfeea Author: Mon Feb  3 09:10:41 AM EST 2025 Commit: Mon Feb  3 09:04:52 AM EST 2025
0b12850ddfb0032376ef1be10b5b46be00bba4d4 Author: Thu Jan  9 07:22:16 AM EST 2025 Commit: Thu Jan  9 07:14:28 AM EST 2025
ef724707788325a53ffa4cf58fceb94654e4793a Author: Thu Jan  9 07:22:15 AM EST 2025 Commit: Thu Jan  9 07:14:27 AM EST 2025
3eede0fc99c684df6f3f35866761036dabf89d05 Author: Thu Jan  9 07:22:14 AM EST 2025 Commit: Thu Jan  9 07:14:26 AM EST 2025
aea305d28551bc213aab3a41a0f59412247ae2b4 Author: Thu Jan  9 07:22:13 AM EST 2025 Commit: Thu Jan  9 07:14:25 AM EST 2025
480d9bb9cfb7b774b22cf82ff21903eb50d64cb9 Author: Thu Jan  9 07:22:12 AM EST 2025 Commit: Thu Jan  9 07:14:24 AM EST 2025
0ca529926c5d9d0a3c0b1609fb7034ab870e4770 Author: Thu Jan  9 07:22:11 AM EST 2025 Commit: Thu Jan  9 07:14:23 AM EST 2025
94aa347d34e079859a5378272c9452c728e4183a Author: Thu Jan  9 07:22:10 AM EST 2025 Commit: Thu Jan  9 07:14:22 AM EST 2025
33228036ff655ebed1bc4bde9c9b6329b569b27b Author: Thu Jan  9 07:22:09 AM EST 2025 Commit: Thu Jan  9 07:14:21 AM EST 2025
e3146775f05d18c667a2e26082da3ac105f87d9f Author: Thu Jan  9 07:22:08 AM EST 2025 Commit: Thu Jan  9 07:14:20 AM EST 2025
e9ca3db9f01a7ce91ceab35cd5fa52f0c5aca174 Author: Thu Jan  9 07:22:07 AM EST 2025 Commit: Thu Jan  9 07:14:19 AM EST 2025
cf4d74256fe103ece7b2647550e6c063048e5682 Author: Thu Jan  9 07:22:06 AM EST 2025 Commit: Thu Jan  9 07:14:18 AM EST 2025
dbda5c35b88794f6e5efe1b5b20044b0b3a340d4 Author: Thu Jan  9 07:22:05 AM EST 2025 Commit: Thu Jan  9 07:14:18 AM EST 2025
bca0fa5f6b5e96c03daac1ed62b1e5c5057a2048 Author: Thu Jan  9 07:22:04 AM EST 2025 Commit: Thu Jan  9 07:14:17 AM EST 2025

-- 
Thanks,
Sasha
