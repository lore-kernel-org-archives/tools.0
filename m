Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565915B556
	for <tools@linux.kernel.org>; Thu,  9 May 2024 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262496; cv=none; b=I8tvHlnsuJcgiDT7KVlv1fmfCUWmh+qmf7Xk3CtOgJfGvGXN9hviYq3OayTa/cVbEzhnD3q9SaK6Iue4gdBrvv+C/+oyUvorUhTfaGniol21z8VMRZHsmLvyHBNcA85AreOqL1bqczSYp7OYAXxQasKSS7q66A5sEA2k052lFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262496; c=relaxed/simple;
	bh=dkoOozuYbAYj8HaD1cYOkUBephPutIT/Dc1/pTsvZIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NA8pIafUp+8PWEnPQPsis+8nHThgCmDfcU6QlCHX4botTq+DLtYe91yB/LoKDvXkSsitkh000EMvQdpoEyp4aHqPtJRHqh4HLxUHMnIXvqYKxUgpBi9zyLPAZ7JZ3lhgllbBRwfCNQko6k7yubJpAprz6c+yXZwGCPCQba1IdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j4G3wLPN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j4G3wLPN"
Received: by smtp.kernel.org (Postfix)
	id 1F2CFC32783; Thu,  9 May 2024 13:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0E0C2BD11;
	Thu,  9 May 2024 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715262496;
	bh=dkoOozuYbAYj8HaD1cYOkUBephPutIT/Dc1/pTsvZIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4G3wLPNF2q4yY2pgY32VeJYpY99KTkWEIOC5dH5cxhrtfIx8Ss5kdD6W5bu0Blsx
	 Nj3hWoEObyBWrP4LZ+oUceCdJ45l8oO7oPWfDCixMc0v5GhED11rDD8U4OhHh56siE
	 WeIReulvfkAHcMDIoM7I0w8w5u8oHA93bDKqUDEM=
Date: Thu, 9 May 2024 09:48:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 shazam not stripping ---
Message-ID: <20240509-prompt-omniscient-chipmunk-dfff23@lemur>
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>

On Thu, May 09, 2024 at 01:05:40AM GMT, Andrew Cooper wrote:
> Hello,
> 
> b4 shazam 33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com
> 
> is leaving the notes under --- in the commit message of the finalised patch.
> 
> I cant spot anything obvious that should cause it to be mis-recognised,
> although it isn't a git-written diff.  Reproduces with 0.13.y and 
> master.

bugbot assign to me
