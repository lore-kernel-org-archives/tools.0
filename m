Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8215D286408
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367774; cv=none; b=jjdMHliRueva6gO1dah4XYZfCU31HVHSHeDH8uZCYmMEzzh4LvjEzRR5c2J6Aiv4SJ+hmMLNKVTnmPpgeDN4L7AnqZjjkPcXq5AjGvoH7IEhiUrLEhtmmZqcufH3L6Oo70YUMzwy9CBOLRXSXc7oEjuPfCHJsHq+NZ5XzMVXCkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367774; c=relaxed/simple;
	bh=yeEh4N8yT9K+I/YI+hrmqWvAcQCYAEjHFgWwJr8dPgk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtb8Ygx+encyOIbL2wW2OFqSgXmJh2FEvKgvTB3UsspVn1a76UqF6ecdY2w0m5Wl+Nmq8iEWKIHCErdysnZLzMHdeYF4HUfGgn8pkifBl3bvlz6VRSrRu3aBS1cMYORIB4R1vqUHl05H/g3PiJPsFUu8DeJREBkSN/PMOnOwxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oCgaq4Ot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oCgaq4Ot"
Received: by smtp.kernel.org (Postfix)
	id 36DB3C116C6; Wed,  5 Nov 2025 18:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63F0C4CEF5;
	Wed,  5 Nov 2025 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762367774;
	bh=yeEh4N8yT9K+I/YI+hrmqWvAcQCYAEjHFgWwJr8dPgk=;
	h=Date:From:To:Subject:From;
	b=oCgaq4Ot3UY/P20kMv8SX91qZoSaLWAuc27frxUXBE6q1iBnvz06Ik4MJsoBw+roH
	 KTRg3859/aJo4ryD0b4GX46RGRL1vj0ibJ3qjayO+fABP11ojENYTzqTpINdYBhSGH
	 Amp7WcPhxIrzKu2iBVsQ7usXxxF/JEkUjM3BQptU=
Date: Wed, 5 Nov 2025 13:36:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore: a tool to put lore/lei messages directly into gmail
Message-ID: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

TL;DR: korgalore lets you pull mailing lists directly from lore and put them
into your gmail inbox via gmail API. It can do the same with lei searches.

Docs are here:
https://korgalore.docs.kernel.org/

More info
---------

Gmail has recently announced that they will be shutting down the ability to
pull messages via POP3:

https://support.google.com/mail/answer/16604719?hl=en

This is how some people (including myself) have been following high-volume
mailing lists, because directly subscribing to something like netdev, mm, or
LKML lists almost immediately runs over your gmail incoming messages quota.

As a replacement, I wrote a small tool that can follow mailing lists or lei
query results and put them directly into your gmail inbox using gmail's own
API.

The good:

- It works well -- I've been using it for 2 weeks now with much more reliable
  deliveries than SMTP or even POP3, because now patches don't get randomly
  tagged as spam.
- You can follow any public-inbox remote without needing to configure anything
  locally. The tool pulls underlying git repositories and is very light on the
  remote servers, resulting in quick operation.
- I'll probably add support for JMAP (Fastmail) and generic IMAP, so the tool
  can be used with providers other than gmail.

The bad:

Getting Gmail API credentials and then authenticating is HORRENDOUSLY
COMPLICATED. You have to enable developer mode, create your own project, and
then enable the Gmail API just to get the credentials.json file. Then you have
to have a web browser on your workstation to authenticate. It's mind-blowing
how hostile Google is to the idea of people using their own gmail account for
something as straightforward as accessing their own inbox.

So, unfortunately, this tool is not a drop-in replacement for most people who
want to subscribe to LKML or other high-volume lists. However, if clicking
through 10 screens doesn't scare you, this tool can be a good alternative to
SMTP-based subscriptions and will likely get you the list mail faster and more
reliably.

-K
