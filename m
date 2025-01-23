Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE320CCE3
	for <tools@linux.kernel.org>; Thu, 23 Jan 2025 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630289; cv=none; b=Rzo0RP7FMTe4mErJ8vUBlRpHXA7ApgMbgRmU3AE8aFrSyDOddNUaWZhqXcdfZY7cRqZz4jS6ZF5dRRFr+6+gz5NG7SXjTgVZiC3rtq/Fw7yakvW2Ft6FhUbsYEApixRc2O/Cac704kUTsA1Iofyr6mlPTER2d/Rm2Oc5LKBQVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630289; c=relaxed/simple;
	bh=Kd2MuiCUVVYC97NBa6p3XUY4YzPBtu7OsfW25ByVEG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKuMOdxDaPK1WvaaRKnvQjOFMlxd4xtoAXB8BWmww5+JfinYrJ1ND5Sgwmv77418jRDGPa15d4MDc7OuTV58ajC6tBwwucMAxr9bU4clV38sDjUtbCThlQDqLd5+D6i+wKe76JcAKbn7koJeDd2Eif9rMzjDTeGcJRL9JLdE/9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alqbhURm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alqbhURm"
Received: by smtp.kernel.org (Postfix)
	id F3D5BC4CEDF; Thu, 23 Jan 2025 11:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DF6C4CED3;
	Thu, 23 Jan 2025 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737630288;
	bh=Kd2MuiCUVVYC97NBa6p3XUY4YzPBtu7OsfW25ByVEG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=alqbhURmjWenZWjwKtKQNVBV25nrOWzGw7UhBforz0korRx7l2B8diI9dxjDsdmx4
	 c9Ax3B7xGKPEj9IWf+s8JHa2+RrwnJlIeEtNC32YQKz2uHJGBtblliq9u6CHW87Tdn
	 oMwWx+6bZuF3wJQZv535/NK9BqVMLwtOgbAXDgTksGxoUsUm56SHytKWa69NgxFAAG
	 cVPPgrfswomp0Tq5xNa3C7M9xmK5xxKU5kmRd/VSdgvdWjD0DeG19NArz14eHhkkfs
	 NnC2Egms5tl1LdwUSBTggRWOAAlqCKgoeecWcyJ0MiwFvmWe+rW8fIMDJ2f2+PjRdL
	 DUX1nk1bhN3nQ==
Message-ID: <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
Date: Thu, 23 Jan 2025 12:04:37 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On 22/01/2025 17:10, Konstantin Ryabitsev wrote:
> On Mon, Sep 23, 2024 at 06:04:31PM +0200, Matthieu Baerts (NGI0) wrote:
>> b4 uses 'git show' to generate patches. By default, this command will
>> use the mailmap file to convert author and committer names and email
>> addresses if there is a match.
>>
>> That's good to display the last identity when looking at old commits in
>> the history, but it doesn't sound like a good idea when sending patches.
>> 'git format-patch' doesn't use the mailmap file, it currently doesn't
>> even support it, and it is not planned to support it apparently [1].
>> Note that 'git send-email' might support a new '--mailmap' option, but
>> it looks like this option will not be enabled by default [2].
>>
>> In my case, I had to send some patches, including one from someone else
>> who has to use the email address from his company, but has an entry in
>> the mailmap file to his @kernel.org email address. When I sent his
>> patch, b4 seamlessly converted his email address, and caused checkpatch
>> to complain, because the From and the SoB entries were different.
> 
> I've been sitting on this for a bit, simply because I'm 50/50 on whether this
> is the right thing to do. On the one hand, I see your point, but on the other
> it seems that if there is a mailmap entry, then the person would probably like
> to prefer to receive mail at their new address, not at their old one.

Thank you for having looked at this patch!

To me, most of the time, it doesn't make sense to change the 'From'
field when sending a patch: it might remove attributions, create
differences when sending patches for stable, incoherences between the
From and the Signed-off-by, etc.

(In my case, it was not an "old" address, but the owner is not able to
use it to send emails on the mailing list. Still, his employer asked him
to keep his email address in the patches he sends. That's why his work
email is in the mailmap file, even if it is still used in patches, but
not in the mailing lists.)

> What does everyone else think?

I guess that's a particular case, because I happened to send series
including such email address :)

Please note that since then, a new "sendemail.mailmap" option has been
added, set to False by default:

https://git-scm.com/docs/git-config#Documentation/git-config.txt-sendemailmailmap

Maybe this could be read before adding '--no-mailmap'?

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

