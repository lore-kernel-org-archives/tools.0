Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5C32D0D2
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418640; cv=none; b=WekZO2+NZprbA6oVC2NPhARscgFBV+wGEc1NCta7D5L42cZNsembfftYIjIREfBCV0aY7ziqiNIlyJ4VwP24/Z5cF+cAwub2mmCB4tIFmA5TeHyOm9VaeR1Zz9VLBTn4ugWAe792eFluZpUxwwsawiUiE0+MmTFQQmHbtqUkv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418640; c=relaxed/simple;
	bh=GMUgKrFBfJb60SXmtmhpbr3cxqaxngdg8j25koN3u1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiJ+/SkMPFDWOFPEXLX7vPtBXH7tBtcgzz3oez9M4C33IS0MOZjo3fHMPfZRdpt9jaV3IvD74Iqn//cERs0ZJW/hxXPGXRXAwDko9wRc249OZLWB9OvOAFZshMhtimBPnlTO9ldpTwYPRArfTwlpYJSu9H2Lf+pT4d7SIQvmXZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CLaf3Wfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CLaf3Wfy"
Received: by smtp.kernel.org (Postfix)
	id 73EF3C116C6; Mon, 22 Dec 2025 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3218CC4CEF1;
	Mon, 22 Dec 2025 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766418640;
	bh=GMUgKrFBfJb60SXmtmhpbr3cxqaxngdg8j25koN3u1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLaf3WfyMmWJKcd2tme7v7AWG8ZPZ9n7XQAqySNu7+MzmX3Jp2jHkmEzNAsaOf3lM
	 KpdzqzT+Yv2N4zSRXpuxZyEuWAdlIRGlhOg80lBS9BgDVjAB25OAP5FVa+yLHPGp+r
	 UIZ7dZtorT4pbaCw2/vi6v48/hU6vLtIOQf1hPHo=
Date: Mon, 22 Dec 2025 10:50:39 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, 
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>

On Sat, Dec 20, 2025 at 09:56:31PM +0100, Linus Walleij wrote:
> Some examples on how to use it to get "your personal developer
> feed" using lei with korgalore would be deeply appreciated.

This is the next step -- this tool is a stepping stone towards the "maintainer
container" I talked about in my tooling update. I'm hoping to have a small web
frontend (accessed via localhost) that can manage most of the korgalore
configuration, which would also assist with putting together lei queries.

It could also help automatically convert F: and X: patterns from the
MAINTAINERS file into a lei query, so that someone would just have to pick
their subsystem to have the (mostly) right lei query set up for them.

> In my old gmail setup I have a "!TO-ME" folde which labels all
> messages from all subscribed lists where I am listed on To: or
> Cc: and put into that mailbox, I assume I can achieve the same
> with lei I just need to figure out how.

You want:

    tc:linusw@kernel.org

The following query should do the trick:

    lei q -O https://lore.kernel.org/all/ \
        -o v2:/home/[username]/.local/share/lei/to-me \
        --dedupe=mid \
        'tc:linusw@kernel.org AND d:1.month.ago..'

Then you can add a korgalore lei feed:

    [deliveries.to-me]
    feed = 'lei:/home/user/.local/share/lei/to-me'
    target = 'work'
    labels = ['!TO-ME', 'UNREAD', 'STARRED']

-K
