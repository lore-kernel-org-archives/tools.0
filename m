Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0163D1
	for <tools@linux.kernel.org>; Tue, 17 Oct 2023 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pNhJL8Oy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dNB9dx56/7cE2yqlcn5eLi8pg+d9gD5dnlIivkbSc+8=; b=pNhJL8OyU/tjBD5p+Qkt7zmmBo
	oisM9RNb7r6wEssMJYS1tQBv1LKoxcjzu7pbOG8/BkFUoD2kvhlCHfB10HPhzV6JU6MG2Gn3P3kjA
	MCvwHyMoOrqV5gH4A4RwUBFoJKaF/7kRRFuxX+wOZZE4W0bQbfLL0639gbnDC29Exr63YRQxqoplH
	XL72uyHE7wHUqPDooRe2CR22KA+FI0crpXFLeX8Ex/UTv8MWlanZS3eZ0aYU3ZnspBP1bmrE3XPZj
	X3gurthO5Du5MHsJh19x54d6ynBA2dhDlHncdvipnKnuciRnylnxrv2UhWqmTH9w7L768DB7qqckk
	LVcWEUJw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qsaMk-009sst-1b; Tue, 17 Oct 2023 03:03:30 +0000
Date: Tue, 17 Oct 2023 04:03:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: konstantin@linuxfoundation.org, tools@linux.kernel.org
Subject: Re: "b4 am" quotes parens in S-o-b lines
Message-ID: <ZS35gUsmJq4aWgm3@casper.infradead.org>
References: <ZS2RA6G07+/eYu8C@casper.infradead.org>
 <20231016-b218017c2-ccc058da10b3@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-b218017c2-ccc058da10b3@bugzilla.kernel.org>

On Mon, Oct 16, 2023 at 08:35:22PM +0000, Kernel.org Bugbot wrote:
> Konstantin Ryabitsev writes in commit 26615095533f901d9cbf9eb599f4dc5e305f5036:
> 
> trailers: do not quote names when special chars are present
> 
> When fixing potential email address rendering problems, we do not need
> to be as stringent about the contents of the git trailer as when we are
> dealing with actual email headers. For example, we do not need to quote
> names containing things like commas or parentheses.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>

Surely that should be ...

Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>

;-)

Thanks for the quick fix!
