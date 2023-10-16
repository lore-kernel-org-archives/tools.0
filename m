Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF231A93
	for <tools@linux.kernel.org>; Mon, 16 Oct 2023 19:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i6TNlP/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1C3C433C7;
	Mon, 16 Oct 2023 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697485198;
	bh=vaheNdjW83psfmVZ12wUK+3f95kdEXOJOsG/CoGo3O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6TNlP/TzRcwVbeGqps/DjDfpOzPPCVX3ul7uMgvvSX9CiqWvPsJs7hHWHkBrz+sT
	 lIbbde78tTk0cYoce/J+SyR6PT/G9QsP2LS4e3uilip6jG4g1bfngYs07vEodo2Q48
	 5sJnZBP2uTS5JtY+xG45qPAPNl7Mu5ikHx9aanKY=
Date: Mon, 16 Oct 2023 15:39:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: tools@linux.kernel.org
Subject: Re: "b4 am" quotes parens in S-o-b lines
Message-ID: <20231016-glorify-abreast-c89670@meerkat>
References: <ZS2RA6G07+/eYu8C@casper.infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZS2RA6G07+/eYu8C@casper.infradead.org>

On Mon, Oct 16, 2023 at 08:37:39PM +0100, Matthew Wilcox wrote:
> Quick example:
> 
> $ b4 am 20231012195415.282357-1-willy@infradead.org
> $ grep Signed ./20231012_willy_allow_nesting_of_lazy_mmu_mode.mbx
> Signed-off-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Signed-off-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> The quote marks do not appear in the original emails, eg
> https://lore.kernel.org/all/20231012195415.282357-2-willy@infradead.org/
> 
> Adding the quotes around the name is not needed; I have many commits
> in Linux without the quote marks.

It's a regression due to switching to the same code that does actual email
headers (where quote-escaping is needed for special chars like commas and
parentheses). It's not needed for git trailers, so we'll need separate
handling for thise cases.

bugbot assign to me

-K
