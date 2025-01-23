Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592B7153BF8
	for <tools@linux.kernel.org>; Thu, 23 Jan 2025 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737655493; cv=none; b=dJxhsmPIeyS99aBRPIRNGtL5Ln+95mbOflfWI9xfX3LP+3gVmC6Vw3L4f46O80OlDfBnUD8iDx9uZWuNGOHYcGrcz4OA3/ILMvi8doCoQSwXvv9qNFGcvpgBbqsn1+flIC3pLKx8xoi9rKkho0+/GvZ70STnEHGZx5axSvMM4TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737655493; c=relaxed/simple;
	bh=ELNeNjtjwLUXUuHhu3kv/jEpYxG81IYR9oYZ6ZoVLxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qwjc6qQ8ld9e881Rd3gJtscdwhtnNLq7BGwX+Kj6IDHA3jZwc7PRoemsJc3MzAe6NCBr2+YwFR//YFkaAboMalLLbC3RSNfM8yVhGA3R2J+5YYp406Tj7egP7+0YkdaYT2VsZF7Rhpx4HB7o0oRdGnowrh9dEm+RQo8Z1pOi1Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iOmndtPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iOmndtPx"
Received: by smtp.kernel.org (Postfix)
	id D9403C4CEE0; Thu, 23 Jan 2025 18:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7017C4CED3;
	Thu, 23 Jan 2025 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737655492;
	bh=ELNeNjtjwLUXUuHhu3kv/jEpYxG81IYR9oYZ6ZoVLxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOmndtPxt6qriRzVT5TozRh/g51ZOyQz1s16KHBqBD3fg7z4xQvPHJPiib3qEAftk
	 My+UmbZthZyXRssHQVmantp7MQM5f91n3ejejk/VG+o+viVOArulbVt0+VOMAH60ss
	 Mj7jiyqCoNPtJ0TWbjA4f86DsWgJ5JSJOw0cGwGc=
Date: Thu, 23 Jan 2025 13:04:49 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Message-ID: <20250123-macho-sidewinder-of-acceptance-8dea0f@meerkat>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
 <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>

On Thu, Jan 23, 2025 at 12:04:37PM +0100, Matthieu Baerts wrote:
> > What does everyone else think?
> 
> I guess that's a particular case, because I happened to send series
> including such email address :)
> 
> Please note that since then, a new "sendemail.mailmap" option has been
> added, set to False by default:
> 
> https://git-scm.com/docs/git-config#Documentation/git-config.txt-sendemailmailmap
> 
> Maybe this could be read before adding '--no-mailmap'?

Ah, that sounds like the best course of action. We already parse sendemail
configuration options, so looking up if sendemail.mailmap.* is set is the
right way to go.

Thanks for the suggestion! I won't take the patch, but I'll work this in and
give credit.

-K
