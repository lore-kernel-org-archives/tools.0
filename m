Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E681F31A93
	for <tools@linux.kernel.org>; Mon, 16 Oct 2023 19:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zxdi6J5X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kEMpxJV4VDxIU488JF6KokgY6aEoKhnB3njM1MvZbv0=; b=Zxdi6J5XbJ4OPAgiertDonMfSQ
	TOe/FWMolkYb3PNp2XVEz32PIt2ZSxjrWivfuTDgPBSBVXUWYUZHj2R83ia670JKqJYQc+ixlukdv
	/VAqLzrngM5kapVChJDSPqybIDeScae54G2y0+U+8XNyeWJvU/dGEvE8HPJC/8k4PHo4Ttrdb+AVF
	reKYTWSCJ33DOycPTgMNxCjtT/p3qIgBslMaWK03hj7k6TWHN4iwyU2bXhQ8U3Nix7FXeEKQIGehg
	ZRBw8sfdO6u75xpfmY8JCNZztHS+trAWsuNVBtO8qBCm9AfCISa2d3FhDIO70OmUsDPWpowU32jCY
	qVQUSyxQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qsTPH-007v7Y-Lr
	for tools@linux.kernel.org; Mon, 16 Oct 2023 19:37:39 +0000
Date: Mon, 16 Oct 2023 20:37:39 +0100
From: Matthew Wilcox <willy@infradead.org>
To: tools@linux.kernel.org
Subject: "b4 am" quotes parens in S-o-b lines
Message-ID: <ZS2RA6G07+/eYu8C@casper.infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Quick example:

$ b4 am 20231012195415.282357-1-willy@infradead.org
$ grep Signed ./20231012_willy_allow_nesting_of_lazy_mmu_mode.mbx
Signed-off-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>

The quote marks do not appear in the original emails, eg
https://lore.kernel.org/all/20231012195415.282357-2-willy@infradead.org/

Adding the quotes around the name is not needed; I have many commits
in Linux without the quote marks.

Thanks!

