Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF32EB5C9
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343228; cv=none; b=Iv66eunPAdrffX7EiAifwcuNXUrl7I4RjNY4e2pUz79jpWtVGCRwCMbktNpAnoDTUiUT1OZ3rDDbPnRdbTL/kJc7zyjX+rmbeidvIqWOMMUluLYHuOr3rwa/HtoLhqbysMhnw2VWHrOUUVcPaeCVoGd2aDU+NBjHhoagk44GUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343228; c=relaxed/simple;
	bh=UMmErZxbgOBWXphRH5Wl8f3HT1BQ2RbCxP+miNM3sbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY/l1PMPXsbqco0y0FDvHLiOAlG33Ue4fk4NXIsG+JbBJXQCq9/oSotIFEokUEB6hbSpaSFoZr/S1zM0v09wW8/La1UE2+4QbqFerCHxthb2QFUNyxXPr8cngu/Y2t7CZRexNWHhO7fatNBIKqZkgEcLlhKKoFIUITwYfyEq8so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EKfZBZh0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EKfZBZh0"
Received: by smtp.kernel.org (Postfix)
	id 4FC9FC4CEFE; Mon, 13 Oct 2025 08:13:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71AAAC4CEE7;
	Mon, 13 Oct 2025 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71AAAC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MEXonq67s3ir+HX5MAXQirh+gCIGzNaO/sE4sEbzDDQ=; b=EKfZBZh0wBJyNVPMlO/3g4rCkH
	U1vZI7zsaq/OUxpbIyS9aCvZ2wB+f4X1Mi/fnThSg6y6b+Z4RkPRMbz0YSjRxwWH1gOxR6VjKyHpo
	LMT1HnsdZ0wNbTqZ6DkRtOWpQsYZPokj7e945zhYAzh2SZ3x9WepIV63YSZKHpmKPUNiV6hXaZKZh
	Kkw7AiyvqxF+Kn6bFdgTuF7pVrGg47ZdX7ciispCJPq4mYxU/8gG+KHKYPDvFfEvuR2XA8KSPviax
	jHXNHJoPDJNaoFvDrYkdPhwUkozIP63HuT88atApuVcY7i1ysvAJ7aufhFWwlDyEiVKj43kgLYSBt
	BmuBrcZg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dgd-00000004CAH-32kI;
	Mon, 13 Oct 2025 08:13:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4D2BD300212; Mon, 13 Oct 2025 10:13:43 +0200 (CEST)
Date: Mon, 13 Oct 2025 10:13:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	tools@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251013081343.GK3245006@noisy.programming.kicks-ass.net>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <2025101125-supper-fable-e127@gregkh>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025101125-supper-fable-e127@gregkh>

On Sat, Oct 11, 2025 at 02:39:24PM +0200, Greg KH wrote:

> > I'll work on getting that fixed, but for now if you're missing the presence of
> > Link: trailers, please test it out.
> 
> I'm already missing them :(

The tip.git tree, per the tip-robot needing it to know what email to
reply to, still has them, except we now stick them in the git-notes,
and Linus isn't pulling those.

But for anybody that wants them, you can fetch the notes for tip.git and
they should all be there.

