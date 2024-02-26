Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ADF12BF11
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708962589; cv=none; b=KGoDtQCU/J5WNRTyqxgBfq9sIviMnDaJEM3YgaK1k2iaNl+Di4Sfx0IS598xzOjFJpdX5NONG8ZrRNW4aiGxwZUMZ6FK0verxU3KhjB/eR8KfA+xZT7MZOesjMsX65Z6b0fO0+0RjjDBeM413a4TZ6+cBAL3dP0nP3y2WaNTAoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708962589; c=relaxed/simple;
	bh=87sEbIIETQnYtbH75Cv/Qedk9mRnbvSFfcMvySEACB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxXaSZmEar2NvA6s6Mjh7JReBZdS4YtxSdKAeXJXlQWoftT8nMZ+ok6/h6JounElf4GLYSGc0gogNDwOoJd3aT/fGqeNpYdoNVdaSNnNj+A50SdRjAz9V9RK6+Em2rX6zRc+bBYO2wcgw4C1LLH9LKtxczFw9q6nu+bGKj6t4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OTX1FeSk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OTX1FeSk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C0BC433F1;
	Mon, 26 Feb 2024 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708962588;
	bh=87sEbIIETQnYtbH75Cv/Qedk9mRnbvSFfcMvySEACB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTX1FeSkZjcfkQsGA+q/D372CGm6sRZYB4JWbBx1ROvieSlhkBqf7xqdYoWJypKQ2
	 P8Z7ZmM1ZMWKTXD+gaQw8U/BGgJGjpONnsY+0xOvddqkRiG7SxrIWdGylVZf2ONWf6
	 9gZ15pwvFbMuV326pEGyth/DxMYfKpwIgtIwkOgc=
Date: Mon, 26 Feb 2024 10:49:41 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: tools@linux.kernel.org
Subject: Re: b4 using specified base-commit yet still fails to apply?
Message-ID: <20240226-industrious-meticulous-jaguar-bdacbc@meerkat>
References: <82bdf374-b96e-4cc8-995b-addfbab91dec@suse.cz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82bdf374-b96e-4cc8-995b-addfbab91dec@suse.cz>

On Mon, Feb 26, 2024 at 03:34:40PM +0100, Vlastimil Babka wrote:
> Hi,
> 
> When I do:
> 
> git checkout v6.8-rc1
> 
> b4 shazam https://lore.kernel.org/all/20240221194052.927623-1-surenb@google.com/
> 
> I can see it detects the base commit (which is v6.8-rc5+)
> 
>  Base: using specified base-commit 39133352cbed6626956d38ed72012f49b0421e7b
> 
> but eventually fails to apply something:
> 
> Applying: mm: create new codetag references during page splitting
> Patch failed at 0019 mm: create new codetag references during page splitting
> 
> If I do first
> 
> git checkout 39133352cbed6626956d38ed72012f49b0421e7b
> 
> then it applies cleanly. Is the base-commit handling buggy?

No, this is expected behaviour -- the bug is that we write out the "using
specified base-commit" line. By default, "shazam" will attempt to apply the
series directly on top of your current tree, and so the base-commit doesn't
really matter directly [*].

What you probably wanted to do was "b4 shazam -M" or "b4 shazam -H".

[*] that said, when we do have base-commit info, we can try to do a 3-way
merge instead, which we don't currently do. I'll make a note of this.

-K
