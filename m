Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34E1369969
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810816; cv=none; b=omCFRk7VAVPauBfS26Vv13hj2zuLiUW37u82LpuI11ymEOufLsykLIaa2Jmt5CaImWOYj9NiVf6Wuxvoblgd3S2cqIa6eFgnf8yYctngKTtsqRbhpmL6uzP9z/BYgJ7/3gPIUYwWbu8NFQALCqJLKt9vxftbSA1Li8nkfPjQ+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810816; c=relaxed/simple;
	bh=p5HW9/JdTAR50GN9cNbNsoe4WCa3/j7GY8Q3icnf5Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ2neaWYTx5m3yv4EdP4mauGZqAe16av9EussL9jUifpqZqmRsc0411GI9DC44QYCeZ+VX7RfWtAimuI/T9LypiGuUYbLSd/aLhBErDn4/ZhS/EX2ER7NgbOupmjxDNUVgEWHT+XSkMrUJN/zIF8yCjwFNZhdopcteOk7Zaq4XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWqJAzLn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWqJAzLn"
Received: by smtp.kernel.org (Postfix)
	id 99DAEC2BC87; Fri,  6 Mar 2026 15:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61122C4CEF7;
	Fri,  6 Mar 2026 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772810816;
	bh=p5HW9/JdTAR50GN9cNbNsoe4WCa3/j7GY8Q3icnf5Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWqJAzLnVnVI3dAi/HffxWrke3xYL73SmwPINa6dAXa5UhvBYrat2ig9NckR4pGEa
	 KRag6zDFrZMM7tqUjYca8/F89iSVU7M3eIFrwdhTKd+W45VrNufSQ8IPNGp2uh/jqU
	 3c/amVpDcPwokmYVDY82K5HL1LIHuQK+o82wWkM0Vln1/+g4+lwETpA+He608JxmE4
	 d0SQgERkEqaIlpdPDKWEJoSKxZt7dTmzkaD5JxGFHPaFyDXs7bmprE+4zhV3BkGK0W
	 0HUe4HF9In4C8W5qnIQQqAi1pq1HNZSPf+w5ZgZxv0A5eTeQycjBThQOz5UZr3H1kP
	 IiruRKD7tGFOQ==
Date: Fri, 6 Mar 2026 16:26:52 +0100
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>, "Claude Opus 4.6" <noreply@anthropic.com>
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Message-ID: <20260306-seepferdchen-ziffer-c69d1d90fc16@brauner>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
 <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>

On Fri, Mar 06, 2026 at 10:02:39AM -0500, Konstantin Ryabitsev wrote:
> On Fri, Mar 06, 2026 at 03:13:06PM +0100, Christian Brauner wrote:
> > Add a --in-reply-to flag to b4 send that sets the In-Reply-To and
> > References headers on the cover letter (or single patch). This allows
> > sending a new series version as a reply to the previous version or to
> > an existing discussion thread, which is a common workflow on mailing
> > lists that b4 did not directly support until now.
> 
> Isn't this already implemented with send-same-thread?
> https://b4.docs.kernel.org/en/latest/config.html#term-b4.send-same-thread

I don't think so. At leat not for what I want to use this for.
Here's an example where I used b4 send --in-reply-to already:

https://lore.kernel.org/all/20260306-work-kernel-exit-v1-1-8f871f6281cb@kernel.org

I wanted the bugfix to be a reply to the original bug and I didn't see a
good way of doing this.
