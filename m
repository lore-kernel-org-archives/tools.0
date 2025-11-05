Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B9126C02
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762376046; cv=none; b=ERLw8Blso/HimzOmvAbshFJD28QLb5Wm2RORJCy0B7xAjAad2c432auQ9806pvf6utaLYGzOzDEUgYSJlQB8vlRQ5UF0uOdXIGTO0xS8qjhjuTFeZAI/GeBj3VJR3180hY+WCXqCdHf5LW+SHkRc+e6USBgs7Z08lcJm7ufaZ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762376046; c=relaxed/simple;
	bh=Mc8JD3qNCkpjmu/+syll3dMYcEc1rGLTlxjl+P4W8KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4fwdO1iRNw3b8kW5RYE/esWNc4gs9NIMP4J1UrtpA0oJEiuxKQwHPI+4oqWvTbw02QbdeDGiPkrWyIITbZP4dw0vzShZMkTq92QQmWu4D+B91K3I3dtDRYsCjN+nPE/0ZOqTpmBtfZmSxIbB2oikn0fdDtke7G6qzC7w01hYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mZ2RvBk1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mZ2RvBk1"
Received: by smtp.kernel.org (Postfix)
	id 952C8C116D0; Wed,  5 Nov 2025 20:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2A1C4CEF5;
	Wed,  5 Nov 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762376045;
	bh=Mc8JD3qNCkpjmu/+syll3dMYcEc1rGLTlxjl+P4W8KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZ2RvBk1va7xv5QzsmZBq7nUP904qrYklMzyRtM8Bv026CafdDDuYocRoz9v/nU5R
	 dj8NoA2CYE7paZun7xDXCmtf+M6Z/IW6BLfqvLnt4lvbtj7jAn38Sev2TAjCcrO4QS
	 P4UQJn2VrjXP0Tc38tt9Cl3j19Ub9I0Ufc/myAv4=
Date: Wed, 5 Nov 2025 15:54:04 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paul Moore <paul@paul-moore.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
Message-ID: <20251105-fancy-frog-of-pluck-f4e7bc@lemur>
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
 <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>

On Wed, Nov 05, 2025 at 02:12:44PM -0500, Paul Moore wrote:
> Thanks for this, if gmail throttling continues to worsen it's good to
> know there is an alternative.
> 
> I just did a quick scan of the docs and while I didn't see it in the
> Quickstart or the Usage section, I wanted to check and see if there is
> support (planned or otherwise) for pulling/importing specific messages
> instead of an entire list?

Yeah, okay, here you go:
https://korgalore.docs.kernel.org/en/latest/quickstart.html#one-off-message-import-yank

Note, that this won't (yet) follow any updates in the thread. I may add this
in the future, though, something like "yank and follow until there are no
updates for a week."

-K
