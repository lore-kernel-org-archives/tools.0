Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117A19AD8C
	for <tools@linux.kernel.org>; Wed,  8 Jan 2025 21:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370507; cv=none; b=HZ3B/kESIB6QNnVreEj4z1bkLiXDBUiiljiTFYYt2YP08BnGmnD75jtMDHuFnHY1NMLDgH0XP92iFNmr4AEe87siNeowSgnW1w/q77djXTSXLEGOidglhWile9wf/qmDAbp5o3VOa6Gt62OwVN9m5fbvWgDn/Qyhv8wKV4F6XFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370507; c=relaxed/simple;
	bh=4rnyiS1zeBhPbb1I6LjZgmHKS37w+eSOaP1fJFUevw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0oJbUXg+qFhdZ1EuQJv19RyqcTcWmL3QpSPApQni78NF/LW+M34DFgzphAuZDEoEF/+oSLJUVYTGiFupQg+V2duTTvlIICeOho46gcEkPqaZAhesGKQA4frz7UD5d/cQWpNKLv6qBXj4hfjuvLZKn0SciHuatm7XyDRrcLc4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yhtmMyNp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yhtmMyNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57116C4CED3;
	Wed,  8 Jan 2025 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736370506;
	bh=4rnyiS1zeBhPbb1I6LjZgmHKS37w+eSOaP1fJFUevw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yhtmMyNpz4czbxR4GUsK3tMqccVZBUSRQbuIGm9IaL6CUhh4BqRePUbaV2sSFjWuo
	 JRWuPFm4RkHL3cz3w3iuuFOFg8BLxf4dYLSi0nqF8hkFHvSrVTNi4umIE5YNqOR9s6
	 iMWv4qx4Znt1V9/NX2FBz+buGQoQQACOhT6seIho=
Date: Wed, 8 Jan 2025 16:08:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robherring2@gmail.com>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: b4 shazam base-commit handling
Message-ID: <sy2vko6fzijbkpjqdponqfy5kdkrmjpptgiy7zgbhmdsxdwohl@72pnd72tryds>
References: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>

On Wed, Jan 08, 2025 at 02:58:51PM -0600, Rob Herring wrote:
> Konstantin,
> 
> I found that running 'b4 shazam' doesn't honor the base-commit unless
> you use the '-H' option. Is this on purpose to avoid resetting the
> user's branch to something else?

Right, the purpose of plain "b4 shazam" has always been to just run "git am"
on top of whatever tree is currently checked out and let the end-user deal
with any fallout of any failed merges.

> As I recall you had reservations about that.
> That's fine, but the log is pretty confusing in that case.

It's true, I'll work on removing that line when we're not paying attention to
the base-commit.

-K

bugspray tag me
