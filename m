Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDE3AE6F9
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809361; cv=none; b=W7W+I19U0uQcQRUJ4TdDHvQlgnTZQ2mVn8GYzhsVqfHZHFXsTcYGNkgBoCu3093mOSHDlAM34hds1EdwphaS5iqK6E/EJP7vBeJkPVuWe92V1hqqctw6tYdddPOfuuexIHqPiqIyxAAZ5HF+PBq8WkXAj7QjCpK1epZL8NMshEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809361; c=relaxed/simple;
	bh=f4GQ1bnf4XKXjmPZsVM43SYlg7bpwa+nTG7BOQKw36E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDWX7O/yt45JT+Jan+Lnhe6JeSuAGmViNSmfhyx1uKEZNHBzEy7fPknMOmP+6IGMLKK5rGWgEV9t0wAGIBPAlL6Udb5cFNa8DecrbitsPGOzXJCTdvtY+aUM8zxV0Wr7UBHH8UlI807dtisx+40DjaZx2DUDNgXqV9lwNM7d2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aVqoW430; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aVqoW430"
Received: by smtp.kernel.org (Postfix)
	id 41045C2BC87; Fri,  6 Mar 2026 15:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE31EC4CEF7;
	Fri,  6 Mar 2026 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772809361;
	bh=f4GQ1bnf4XKXjmPZsVM43SYlg7bpwa+nTG7BOQKw36E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aVqoW430p6bUIuONRFv2F0hi+36n2SPkYj5qUjtTp1CRhKSxChBbAD87dRce2khYy
	 Ff1BakJjOryzVf/4rQZLCrkRMj7ZU96ENyCg5eYvDYaPrPbQg5jCO3YyRkmbYPuhG1
	 /k3g45JX3XA2onb0/rmTY0S1WIMSMF77C01XHi5M=
Date: Fri, 6 Mar 2026 10:02:39 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>, "Claude Opus 4.6" <noreply@anthropic.com>
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Message-ID: <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>

On Fri, Mar 06, 2026 at 03:13:06PM +0100, Christian Brauner wrote:
> Add a --in-reply-to flag to b4 send that sets the In-Reply-To and
> References headers on the cover letter (or single patch). This allows
> sending a new series version as a reply to the previous version or to
> an existing discussion thread, which is a common workflow on mailing
> lists that b4 did not directly support until now.

Isn't this already implemented with send-same-thread?
https://b4.docs.kernel.org/en/latest/config.html#term-b4.send-same-thread

-K
