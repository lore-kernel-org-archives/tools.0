Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2C3ECBD4
	for <tools@linux.kernel.org>; Wed, 29 Apr 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459800; cv=none; b=hVoeSBdr3wL6yqN/iQJd+AZzTkCdcYhjq2t3ygjkoquPbA+olnJ8B1sOU0UtdKku3iHGnVUPQLL3BvsGj3Q5y0HIbb0xePYQdPebE+FPLpF9XfG8SPfRf1fcNjSVYgMt8iOgbJaDup48axaE7qjeXg1skOsoYGhX5+rts770F98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459800; c=relaxed/simple;
	bh=/lt6/1yhjhViUDZdBU6FCpaEjk/xy44RjrtljInLrb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OG5eW39R58QMsOkF9VMFwX2KmaiHtVdiwHaK/j2H9QbnFaGHInl9/d7othfNZNCKtpvsJKDwP/BTvAlrtWm8UqU+70BT43Exa+KLd/epxXO9Fco58OJdCGp5AjwuMFxvAbxdFpMgj7Fpg4c4RbAhuhq3X1Ttr9ME+O4i63glsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhriNJnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhriNJnK"
Received: by smtp.kernel.org (Postfix)
	id 48539C2BCC4; Wed, 29 Apr 2026 10:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F87C2BCB3;
	Wed, 29 Apr 2026 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777459800;
	bh=/lt6/1yhjhViUDZdBU6FCpaEjk/xy44RjrtljInLrb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lhriNJnKXnvXwVID7o4qw+RV0prjfMeblwqyqUkxQvZalNkh5z1dpM82yUqu0cmnV
	 vex5CIFGg3NMvTbpUj0pnyHP3yDoF67XVWAHLanuRT2TJIiQQI5B3Cz9ey8G96/XW9
	 Wx2ie9ldn/yfWb0uuJxkxvFlM0SoD0Y2f8KZiwelUXKkkgsgxh1piF/i/T3FwYUc63
	 GRwZFqSoX4KBK4X8D/1NzKkEjMvPNX6fKek6GqkLPopGI7IIk3hF1Eko+75ceQFMFY
	 +oU5tr+24acR924lXbiV36IwPxhb+3UamMCvWAwxebXTKqqqgkb6Yk6ux4WF6vGsV0
	 4vDJW2YAgawWw==
Message-ID: <f26c0d9a-518d-47c4-8ace-595866b493fc@kernel.org>
Date: Wed, 29 Apr 2026 12:49:57 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: b4 review tui: patchwork integration
Content-Language: fr
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <f329a913-b0b3-4f5d-8bb5-a57b5b814081@kernel.org>
 <20260428-unyielding-fat-chameleon-a264cc@lemur>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20260428-unyielding-fat-chameleon-a264cc@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Thank you for your reply!

On 28/04/2026 23:16, Konstantin Ryabitsev wrote:
> On Tue, Apr 28, 2026 at 01:02:11PM +0200, Matthieu Baerts wrote:
>> Hi Konstantin,
>>
>> It's great to have a built-in patchwork support!
>>
>> Something that is blocking me to use 'b4 review tui' more is that not
>> all Patchwork status are supported, e.g. I cannot mark a patch as
>> "Queued", and delegate it to someone.
> 
> The issue here is that patchwork doesn't expose what statuses are available
> via any API call, so we can either hardcode it to whatever we have on
> patchwork.kernel.org (and have it not work for any other patchwork instance),
> or we can hack patchwork to expose it. :) Either option is... not that great.

Could we eventually set all statuses in the config file?

For git-pw [1], I added them in my .git/config:

  $ git config pw.states

new,under-review,accepted,rejected,rfc,not-applicable,changes-requested,awaiting-upstream,superseded,deferred,mainlined,queued,needs-ack,handled-elsewhere

(I think I'm missing 'in-next')

The ones from kernel.org could be added to the documentation as an
example.

[1] https://github.com/getpatchwork/git-pw/

>> I see that patches are automatically marked as "under-review", but it
>> would be nice to assign myself as well, so others know who is reviewing
>> what. Eventually, it might be good to ask for a confirmation: I might
>> use the "review" mode simply to validate a patch reviewed by someone else.
> 
> OK, I'll take a poke.

Thank you!

>> Something that was already reported by someone else I think is that the
>> "patchwork" view only shows the "Action Required" ones, and it is not
>> possible to show more patches.
> 
> Kinda same limitation as the one I described above, but I can take a closer
> look.

Maybe another config option, instead of using hardcoded values?

>> One last thing: it might be good to have other automations, e.g. when
>> the "Reviewed-by" tag is sent from the "review" mode, then the patch
>> could be marked as "Queued" on Patchwork.
> 
> Noted!
> 
>> (And eventually, have a way to run script as an action during the review
>> and from the "patchwork" view, e.g. to apply a patch using a script that
>> will do extra quick checks and select the right tree.)
> 
> Hm... from the patchwork view I'm not so sure, but I can take a look.
Only from the "tracked" view is probably enough.

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

