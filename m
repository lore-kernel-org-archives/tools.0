Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543329B77C
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696938; cv=pass; b=RdiuEBgkpbhE7lg4MzNlXlA5ztu+XyDAChnWln8pBJ29FI5BbbEPgOeC0oiBgqzMXDBMRp13Z9oRwGk9p3yb621mfGAxyrpLbZ35eyE6E34hO37izrv7l4ndaftKTQ59zE+PeXyZGRN6tMcgGNfhrl8pcUntiZMlXJ8lSg0n1A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696938; c=relaxed/simple;
	bh=3Ty6yLrTaaLdgJBocyEINP7Mp2ILkzfSal670zPaSog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAB6vv0T83kxU/6vRf4hCrhH8ur/bfnDC+GKhwBHOlTlX1tgv+EZqn7vWEpSNvXsxg9fED2pewL+i/Hnibmd6ckeIDf6xDvTMl/Wgd9NFjVmznkP1s0wGkR74ApbCVbgTTdfujc56R1s2Fvj6ort2rh5Dl9D+6Hph057vM6X4IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=O/6o/B2l; dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=88I6owIz; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="O/6o/B2l";
	dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="88I6owIz"
Received: by smtp.kernel.org (Postfix)
	id 8F57CC116D0; Thu, 29 Jan 2026 14:28:58 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AA3AC4CEF7;
	Thu, 29 Jan 2026 14:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AA3AC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=hartkopp.net
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=hartkopp.net
ARC-Seal: i=1; a=rsa-sha256; t=1769696572; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OUmidUoPfBj1ThjKdVjXVGat293DpY1w8lb1LyIoMcALuwGPVbH7FnnkcZqObHFHf5
    iNN/BHHOTvcLiePebHeLANHL4vt1NkeeY7+qluN1im0ofy6AzpnJ0YHkQ5NxkXd/CJiu
    T56jbLTd3c7SHt7nrZbAwS2R8fnISq0S4MNkGr0C69pZ8iyFlc9hAs4WTWZ5mj1+0PK4
    iDEss7WxrEFGxLwJ1GMQ+TTahU9MCImQnp3Z2tusT4uY4dRAM8rm2D9awQAIiRSa/pmL
    H3WBY9Kh8/jli5pCw+WotT6bZ87yvye8CLu142CS88YFnxMAbgbGckGGTGHXYcTlSZkn
    GuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1769696572;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ihfiW0Xw7c08MazCMbPbwynJx8gmZIcbKafMl/4VMDU=;
    b=LU2JZOdVu7Wl4fc6y6GAh9UvtQWnJqE1uf8TAI+gmnXaQHJEarBTSMtcDDQ7RDDkoD
    fmK473OKuSahbFWSj7z78fRikuwNrgEyvq1efLHZsMw+FTpBzp8u7c1YvZ1eCbod05yb
    WpiaVm75HOGXagNAMQ5m6PQqRNNIlYsGFl7IeHneRTxLwCupriqE6sBnTdtYJ9Sy3hUM
    76M+YpRAQXAFjZ8lbdygO4+IierEBL/CK+sR27WwytslvOOLpiTt7Wc3gLJA4DUBq2V8
    u8uHGab1gLJOMUwzYiHHwsdVWcLg0/gIeACedTYmCztGHfjEsZNBWFG4B7twzid3OKZ2
    hXHA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1769696572;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ihfiW0Xw7c08MazCMbPbwynJx8gmZIcbKafMl/4VMDU=;
    b=O/6o/B2lV1yMao+lA19fefYXRs5DiUZglgz/0QnIH9T54mXMtosBswJvbaAx23TugJ
    LvYPhFA+OA9SBkhPBUhb9YqZsBPdb717nAb0WrDroumyVZTfxYndYyJ54IqUYmzn2wP9
    5MqNZFEeKgqRKaE/3WWKn8XBAiKxvGKSdPJkhHiCoiR2w/TbcDEMVCAfnVf4pTQDDIeS
    ELfykXk2jCbB3FYjPoAqn0yax0Kf+EMxyyG82BBOWY4ESX1bbt/0Re2U3CfTKJfyMluQ
    mZCm3uhyUUqH+HNHX9V99mm3ZTMHWhUZwqH1F1zWDj9lEhgFJJcfrl70oo2dzfHZeQ6z
    7rZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1769696572;
    s=strato-dkim-0003; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ihfiW0Xw7c08MazCMbPbwynJx8gmZIcbKafMl/4VMDU=;
    b=88I6owIz1dmWY4wgELQ4hsk0GXd1OM5ORHuRB3Ol6yqzNrFG5rvlOOuZnHS0h7qHzD
    GcmBUkJ1nevFOwkDEmCQ==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tTUsMrZpkO3Mw3lZ/t54cFxeEQ7s8YjX10Q=="
Received: from [IPV6:2a00:6020:4a38:6810::76e]
    by smtp.strato.de (RZmta 54.1.0 AUTH)
    with ESMTPSA id K0e68b20TEMqsLz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 29 Jan 2026 15:22:52 +0100 (CET)
Message-ID: <437408f7-95b6-472c-9a30-7a3ad647eced@hartkopp.net>
Date: Thu, 29 Jan 2026 15:22:47 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 prep --auto-to-cc fails with 'NoneType' object is not
 subscriptable
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-can@vger.kernel.org, tools@kernel.org, users@kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260125201601.5018-1-socketcan@hartkopp.net>
 <20260127174937.4c5fc226@kernel.org>
 <67cb17f4-2f72-4847-aa04-3633f3d8df33@hartkopp.net>
 <20260128-booby-of-phenomenal-proficiency-4db5ab-mkl@pengutronix.de>
 <20260129-versatile-tuscan-mongrel-f9b173-mkl@pengutronix.de>
 <f47126ee-8256-4077-a09c-47a1ed461f65@hartkopp.net>
 <20260129-fortunate-pompous-chinchilla-dcb99f-mkl@pengutronix.de>
 <c5e95a45-9aac-4a67-82b5-ac4ed8ae2844@hartkopp.net>
 <20260129-skilled-placid-lori-f58fb9-mkl@pengutronix.de>
 <1d9966d9-877f-46d4-a2a8-56b6d621bb36@hartkopp.net>
 <20260129-savvy-vicugna-of-drama-aeefac-mkl@pengutronix.de>
Content-Language: en-US
From: Oliver Hartkopp <socketcan@hartkopp.net>
In-Reply-To: <20260129-savvy-vicugna-of-drama-aeefac-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.01.26 13:35, Marc Kleine-Budde wrote:
> On 29.01.2026 11:31:18, Oliver Hartkopp wrote:
>>>> I didn't fiddle with https://kernel.googlesource.com/pub/scm/utils/b4/b4.git
>>>> nor pip.
>>>
>>> Try the b4.git, you can directly use it after cloning. I'm using it
>>> successfully on Forky.
> 
>> ~/net-next$ ~/b4/b4.sh prep --auto-to-cc
>> Will collect To: addresses using get_maintainer.pl
>> Will collect Cc: addresses using get_maintainer.pl
>> Collecting To/Cc addresses
>>      + To: Marc Kleine-Budde <mkl@pengutronix.de>
>>      + To: Vincent Mailhol <mailhol@kernel.org>
>>      + To: Oliver Hartkopp <socketcan@hartkopp.net>
>>      + To: Robin van der Gracht <robin@protonic.nl>
>>      + To: Oleksij Rempel <o.rempel@pengutronix.de>
>>      + To: kernel@pengutronix.de
>>      + To: David S. Miller <davem@davemloft.net>
>>      + To: Eric Dumazet <edumazet@google.com>
>>      + To: Jakub Kicinski <kuba@kernel.org>
>>      + To: Paolo Abeni <pabeni@redhat.com>
>>      + To: Simon Horman <horms@kernel.org>
>>      + Cc: linux-can@vger.kernel.org
>>      + Cc: linux-kernel@vger.kernel.org
>>      + Cc: netdev@vger.kernel.org
>> ---
>> You can trim/expand this list with: b4 prep --edit-cover
>> Invoking git-filter-repo to update the cover letter.
>> New history written in 0.41 seconds...
>> Completely finished after 0.81 seconds.
>>
>> ~/net-next$ ~/b4/b4.sh --version
>> 0.15-dev-47773
>>
>> Then I can remove the b4 Debian package again.
>>
>> Thanks for the support!
>>
>> Btw. that it does not work neither on Trixie nor on Forky out of the box is
>> not very satisfying :-/
> 
> Hmm, I cannot reproduce the problem with b4.git, maybe you can try
> bisecting:
> 
> | git bisect start $(git merge-base origin/master v0.14.3) origin/master
> 
> then
> 
> | b4 prep --auto-to-cc
> 
> followed by:
> 
> | git bisect good
> or
> | git bisect bad
> 
> depending if auto-to-cc works or not. Then try "b4 prep --auto-to-cc"
> again...

Maybe that was a misunderstanding. It works well with b4 git.

Only the original Debian b4 packages (apt install b4) do not work.

Best regards,
Oliver

