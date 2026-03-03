Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFA242669E
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536846; cv=none; b=dWg0p0hzmcdMabgm+WYsx3+ghRPGL970llmcJuMcRJqyROCthWpjWvKjH3kEazrcfrBK+2YBtHZE1qvhxa0H1RvWsidjTALARRMIPpF7wQAe1XKkeZ+lkmyTbwPBakfPjG4wth9cfj2DWTzBsbqzcd3ApoywOR193BLRRp8b7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536846; c=relaxed/simple;
	bh=PhRjFSdM/2zP+vsHhyeVfWMEeTXOQvmhxm8TmtVBQHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9l2wd+nMyYxN+jfAsKacd+QaGIqSyO0JnKN7b+F7toQymM17HGzBQXgMFqSbBCwHFrbdmFLOcMiPfIdfKuequ8EI589dkee3onhK1N9wfkGjsTDeMbmPsaIwXcCswffNKg+XCTx01Mv3NEKHkBAQHhvFZOC4bbUpHAA+qBGsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2i9ycyD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2i9ycyD"
Received: by smtp.kernel.org (Postfix)
	id 84BE9C2BC9E; Tue,  3 Mar 2026 11:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ECBC116C6;
	Tue,  3 Mar 2026 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536845;
	bh=PhRjFSdM/2zP+vsHhyeVfWMEeTXOQvmhxm8TmtVBQHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e2i9ycyD1z+SqyNoVrTpSYWSh4XpO64C7PYwPJUbJ2vuZ741y7MRgI5cwou/M8bBu
	 mNdU6HPTtGs4LR2QHRVNE6oRZHA03/d1+UVroyHqix1uH9dOzjggNXUrVnl3ucgRTm
	 nLCr1BZlA6+AziSh54iKD9oBmV6vMWx16mz7EZGN90061gr3+HnmBCFm/2ElHxl9Ze
	 WUjb1TGrT1+UqW09cLTyoafjIKZ1pfTQX3HYlKzfeNONLqOLTSkkYOLAVSBbpxGkFr
	 C9jvZPxxZo7y87Y1XxhH7JTshsKE652+F8oqIRPm98CBlAcYujX0rYGN+U2SRnLYnw
	 8tsMOaJh0Ktaw==
Message-ID: <5947997b-a634-40f2-b4c9-9649e8e3dcde@kernel.org>
Date: Tue, 3 Mar 2026 12:20:28 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 review available in master
Content-Language: en-GB, fr-BE
To: Konstantin Ryabitsev <mricon@kernel.org>,
 Junio C Hamano <gitster@pobox.com>
Cc: users@kernel.org, tools@kernel.org
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <xmqqikbdvfla.fsf@gitster.g> <20260302-proud-ginger-dragonfly-24edcc@lemur>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20260302-proud-ginger-dragonfly-24edcc@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin, Junio,

Thank you for this new feature! And for maintaining git :)

On 03/03/2026 05:26, Konstantin Ryabitsev wrote:
> On Mon, 02 Mar 2026, Junio C Hamano wrote:
>> I hate to complain about trivialities, but the coloring scheme was
>> too noisy and with weaker color perception than normal folks, I
>> couldn't really see many of the UI elements in "b4 review tui".
> 
> Junio:
> 
> Thanks for giving b4 review a try -- and this is definitely not a triviality.
> A lot of it is "rapidly prototyped" with colours that made sense on my
> dark-mode terminal using textual's default pallette and I've not tried it with
> other colour schemes.
> 
>> Is there a monochrome option that is usable by color challenged
>> people?
> 
> There is now. The review TUI is built on top of Textual, which ships a
> built-in 16-colour ANSI theme that defers all colour choices to the terminal
> emulator. You can enable it by setting:
> 
>     export TEXTUAL_THEME=textual-ansi

Just in case, like many other TUI tools and libs, Textual supports
'NO_COLOR' env var [1]. So an alternative is to use:

  NO_COLOR=1 b4 review tui

[1] https://no-color.org

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

