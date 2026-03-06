Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2465259C84
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772828326; cv=none; b=WmkVylY8tQyfGBlth+WoToB3onnqeuJyGEzz53dkUt84hy6lEsWjrkwW9ebsD4Lltq+iFMBQ5AZYls9Hz5gRZoHXkSiFO8v3GIefEgmAfU7gd0F3YVGeqe2xNTfhva8f8z61vaszOeS74a/TwO8L0l1xHp3OQB40pLbLa/KpTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772828326; c=relaxed/simple;
	bh=WbBC1llR7kYB7/L1XVG1gwaa8k4VCSnWqHVUDoCU6Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWCzIfaRpT3YbFyrGbHcHgJ97v8CYw1bZQNfNciQaZtmP7mcKlfQT5peBSWaa8rm6D32CHo0pSTd+y0NStVGa1LO9tozIEOedT3w6BFaCeuWUmz90SGOaL9aeAV9TDNO4V9QQU+14UfdpbMN0MJmzAxlL2F5oj04bZZAeR3Se2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIwyU6jo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIwyU6jo"
Received: by smtp.kernel.org (Postfix)
	id 7986EC2BC86; Fri,  6 Mar 2026 20:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38036C4CEF7;
	Fri,  6 Mar 2026 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772828326;
	bh=WbBC1llR7kYB7/L1XVG1gwaa8k4VCSnWqHVUDoCU6Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIwyU6jofZbjeGzxbv6FQfKM+1zsrHexAOFe5otqIuutJatBX2foqGxQCxxBGVpAF
	 g8CnQr6k2rF2+C7APnrLPjaDfcbg106e3cWjQf+htJe5yw3iCIGKQmHaimj2GCZfCp
	 Es/tOGocngktIGIlgMj4rAkvsfmnl0/IShjgiS4KqwMI9/qopyoiYcwog2N8DP7xfV
	 aUGp24+xMzqjRFEbpkt0ZT6nYKtSM/aL7Y3qV3Bko9aide/EL9YkJxIhxMRAgrtCDG
	 +g8WjHEFN1ZIB3T+wz5Le1ILVtkjDC3Ia/vHc0qoZ3unNZwYMzKYTGk5t+QRoIV0Rd
	 Mydw8KvKD9Ogw==
Date: Fri, 6 Mar 2026 15:18:45 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: git@n0toose.net
Cc: "tools@kernel.org" <tools@kernel.org>
Subject: Re: b4 sanitizes quotation marks out of my name
Message-ID: <20260306-rapid-adorable-buffalo-93cdd7@lemur>
References: <997706185.418493.1772314169554@app.mailbox.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <997706185.418493.1772314169554@app.mailbox.org>

On Sat, Feb 28, 2026 at 10:29:29PM +0100, git@n0toose.net wrote:
> I was sent here from #kernelnewbies and told that I should share my problem here. I normally sign my commits with the following name: Panagiotis "Ivory" Vasilopoulos (and it's shown like that in the `git log`)
> 
> It looks like this in my .gitconfig:
> 
> ```
> [user]
> 	email = git@n0toose.net
> 	name = Panagiotis \"Ivory\" Vasilopoulos
> ```
> 
> Although the From: header presents this as shown above, the quotation marks
> are removed from the `Cc:` and trailers like `Signed-off-by:`. This is not a
> problem when using `Panagiotis 'Ivory' Vasilopoulos`. Is there a workaround
> or anything that I can do for this?

This one is tricky, because trailers and headers have a bunch of special
corner cases. I have a commit in master that *should* do the right thing. If
you are able to test with it, that would be awesome. There are instructions in
the docs how to run b4 out of a checkout.

Let me know if it does the right thing for you now, and let's hope it doesn't
now do the wrong thing for others. ;)

Thanks,
-- 
KR
