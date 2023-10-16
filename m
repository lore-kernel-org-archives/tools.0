Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5AA347AA
	for <tools@linux.kernel.org>; Mon, 16 Oct 2023 20:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tywv1xqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CA1C433C8;
	Mon, 16 Oct 2023 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697488784;
	bh=MNBLFDmyf6bhixASs2W8QKlWrJZrMRhQpd7lvDKVg0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tywv1xqA5HIDSPg3Z2PWc/CsMCL4JhkkUEpH3WgQPkCQlrCKFCTXpBoybtFZYroLt
	 x/s6gJrE0SMZWKG51TUtqTRnrCNhZOIiNoaWtXkHuoeZv2vOvFm/hUAFp1gvVVDN/M
	 Vj/DZsVYQDC8Wq+Zc2L5qPyERgEosjJXVgDxEckM=
Date: Mon, 16 Oct 2023 16:39:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: tools@linux.kernel.org
Subject: Re: "b4 am" quotes parens in S-o-b lines
Message-ID: <20231016-browse-proofing-535e94@meerkat>
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

This should be fixed in master and stable-0.12.y. I will probably release
version 0.12.4 some time in the near future.

Thank you for the report.

-K
