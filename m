Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7926ED59
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 01:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766023029; cv=none; b=WmUSo4cZpA1kUKetD68MHU7mHu+bjb6ZyYnDbcY9xawEN7xhsdaHKebnmkHXO7HYikSjRyVXEplonAM5W46XnI7kCzp7gdVhWwp6cHwoLcDBtFhJ8Xes9MashORw0AMDamJRD8nVwRsFJjRGtF9InWn9qcXUh5q7x7+NxupP8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766023029; c=relaxed/simple;
	bh=TbFZDRavfYpDfMXfIYUHmUYdapa8mVMyYFRMxr96gwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQgRXlKFOAcL69daqo8J9n5XwOelYMu9yE2jWOWzWwzwUU6K1ZZ59Pn91HEF2BuQKwhvvFQFLwbSIJJaOuIP+TDXZ/u4/pSgQpBThWL8L/V7Pxwb+OA0KYaTjPnHol5ReWcv7nCi845y5GZwRRhzRlWLpCQ9ilFpSrT0faLsC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ILB0ZKm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ILB0ZKm5"
Received: by smtp.kernel.org (Postfix)
	id 691E8C116C6; Thu, 18 Dec 2025 01:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C3FC4CEF5;
	Thu, 18 Dec 2025 01:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766023029;
	bh=TbFZDRavfYpDfMXfIYUHmUYdapa8mVMyYFRMxr96gwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILB0ZKm5W7q4OSCTiMMjW5LnTbWOGEGr1sR7PuTNmC7lJveNIrFXFFUXhqGQErqrw
	 hkDEZczBFxOTDYEmYRl6OyBiDt/Epn2DrBeGCbNejSNQDDBZ+yA1walgUUCBcKseai
	 q0k1BXWM/ZhsbeIFWzuEl/LLg2alTfgLdVZa134o=
Date: Wed, 17 Dec 2025 20:57:08 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251217-yellow-cormorant-of-debate-b55a75@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>

On Thu, Dec 18, 2025 at 01:24:51AM +0100, Linus Walleij wrote:
> With a simple LKML inbox, I got this error:

> [...] 

>   File "/home/linus/.local/lib/python3.14/site-packages/korgalore/pi_feed.py",
> line 386, in feed_lock
>     lockfh = open(lock_file_path, 'w')
> FileNotFoundError: [Errno 2] No such file or directory:
> '/home/linus/.local/share/korgalore/lkml/korgalore.lock'

Ouch. Yeah, this should fix it for you while I push out a better fix:

    mkdir -p /home/linus/.local/share/korgalore/lkml

Thanks for the report!

-K
