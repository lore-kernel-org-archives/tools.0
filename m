Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90D23A9B3
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766172036; cv=none; b=eKEnAllycgOZvGhd+cE9GuxmmkAa6lH2oban9KAQu5dUkf5cx5bStBqAGee+h+AACYq2zyDYFBWtTnMwCTYDAR5Bpu3ab9MIVujSqUdU9BxEyN0DK9yOuSgmXhCgDej3p8ONNINa1KEDrYh7+++sx50zNepzuBuAAI3HVSBnC4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766172036; c=relaxed/simple;
	bh=BTZAWYXCZpHe3pOifVGYTN0bevEfnyE+mGxrgeiwAvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvCjk/0Lj2gV9kG9N7QVf5ZWBDRFw48/IzPUL131rr8EP/6Tq9FgnxANaichQwXTZcp2Etl7C7dXNaGKUXmbPrEW5vDwVWQE9K+9jHSB4bI9RW/qCKvzExgw6+fJ++SE5LhSKsE39S+uVQG/29ZCM3XRefxQd2wWS60J0OnqCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZtYUJzjH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZtYUJzjH"
Received: by smtp.kernel.org (Postfix)
	id 8392CC16AAE; Fri, 19 Dec 2025 19:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50303C4CEF1;
	Fri, 19 Dec 2025 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766172035;
	bh=BTZAWYXCZpHe3pOifVGYTN0bevEfnyE+mGxrgeiwAvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtYUJzjHlpxR0Sr2IdTt/GvGWuYq7XXz6ratuo8w6FZn91S3fO8PdzgLAVSKgx7Zz
	 NKyYu3y1jAECGPnJ9fYf2ctsjYo/50UhsRQ9XUVzmGj9KfIdokaZXovzTvo+dcWiWC
	 6wkYVIFw+clOnDjltv02d7vn0jP6s5YSFylpm+74=
Date: Fri, 19 Dec 2025 14:20:31 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251219-melodic-unbiased-tarsier-e4f9bb@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <aUWfbRAHjNI-lNOz@bogus>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aUWfbRAHjNI-lNOz@bogus>

On Fri, Dec 19, 2025 at 06:54:37PM +0000, Sudeep Holla wrote:
> > Oh no, this is what happens when I don't check adding new feeds after a major
> > refactor. I think it's working correctly now in 0.2.2 -- please check!
> > 
> Thanks for the fix. I can see the pull doesn't give any errors but it doesn't
> seem to push anything to my gmail label.

On the first run, or on all subsequent runs? It only initializes the feed on
the first run, but the ones after that should result in mails being imported.

I see the following in your log output for pull

> debug: Connecting to Gmail service for linux
> debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git show ba387a13f1918fbd9bf2ccdea11d5184c6c1774f:m
> debug:  -> Re: [PATCH v5 02/36] compiler-context-analysis: Add infrastructure for Context Analysis with Clang
> [...]
> Pull complete with updates:
>   lkml: 1

So, that message was for sure uploaded to your gmail account.

Since it's LKML, it gets upwards of a few thousand messages a day, so you will
definitely notice if it's working or not after a few "pull" runs. :)

> I have also added my config file with feed urls at the end. I have chosen
> lists that I have not subscribe to in order to avoid any confusion.

That's an important thing to remember with Gmail -- if you already have that
message *somewhere* in your inbox, Gmail will quietly drop the import. So, if
you don't see it in your LINUX/LKML label, that means you probably already had
that message.

Let me know if that helps!

-K
