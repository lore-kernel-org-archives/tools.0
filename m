Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA363CFF7A;
	Fri, 20 Mar 2026 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023928; cv=none; b=Gy6Nqu+tPiw0REPtAb0YWm+xvp4FM53AcUZ7xcdwmQ6PskHXhlsuFPwXd5oveYLWI5T+iiHvDLi9UEOay383WHF67lI1+VruHPml/lgm/lIiuIgzXqufEe4lywyrNcIrizE7WLGNNvvF8uLFAPuEE+UMLQvqvpywcMbjF8KbCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023928; c=relaxed/simple;
	bh=/ucd36xhVUy52SeYqTtGsVyvtuHq8pTCKobe30iyUCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKtiwpsNtUWHZ84LLPLz4tYLlnINzls7qYCMpRvdlQkk+Rkz2cIYmIicuAV71xsva0Uu9u4vMS8kNa25IsI0WnrSk/+peapdyf4LY+hdTexJbShCysvrMI5kvV9tVobX2AsrHxeHNvk3CZWLjS5BESrDpJHaDO5sjOmMjSAxFJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hj0acbMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hj0acbMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE350C4CEF7;
	Fri, 20 Mar 2026 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774023928;
	bh=/ucd36xhVUy52SeYqTtGsVyvtuHq8pTCKobe30iyUCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hj0acbMZ4VMFimqqwBjpQxZFdY+Hl3y6zV+Hs42Owprt3AedxAly+B9kNKlxabM8N
	 SacUmwuBMVVUo1boXPzMc+s563U5YFT3A/ZftAwQVJUsKKab+ZHiZfLtUb54rJXxKi
	 IefykwPte5/jCOsP9ZsCqdaaQ82Po5jRKC6n4hXCiZHvBGWfg4rEw56/b1szF1/LWK
	 SPUYm+Tmq61TP+e/RziSy10xQt7o+GjqTC3FC2JF1zckB/h+oLk/VwOEDGIZYpfz7E
	 XAG7w7lHFn0TVQkN33euerxcGgT09Iki7fO/Zf7BqwCgV05C2BLe8FwUIn5xTCJETV
	 lURv0jjRGS1rA==
Date: Fri, 20 Mar 2026 12:25:26 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Paul Moore <paul@paul-moore.com>, Chuck Lever <chucklever@gmail.com>, 
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Using "b4 prep" with Stacked Git
Message-ID: <20260320-humongous-owl-of-reward-534ea0@lemur>
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
 <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
 <87v7euo0vt.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7euo0vt.fsf@toke.dk>

On Tue, Mar 17, 2026 at 05:51:18PM +0100, Toke Høiland-Jørgensen wrote:
> And here! I have been using the "cover letter as commit" mode of b4,
> which works as long as you remember to 'stg commit --all' before you
> invoke b4. I requested a pre-hook functionality in b4 to automate this,
> so will take this opportunity to bump that:

This is now in master, in case you missed the bugbot notice. Please let me
know if I can do something else to help, and thank you for your patience
waiting for it. :)

Regards,
-- 
KR
