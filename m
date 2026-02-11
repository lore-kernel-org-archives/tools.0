Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDB352FA4
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836168; cv=none; b=dujmeDKFnc5vwv2YoI8dQlUJNvJlnqOdOazosXz3kYw60NIho99wBFs2nbLDmyVP7qjm8RdKj4SptIfMmEkkqkAnbDwYMIECNIs63T8cSjf0/qZGEaUQGopoiSXrU4wu9dTIFp74GLN3u2Eywk05tZAC4TXZ9GlwCO0TRYH1448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836168; c=relaxed/simple;
	bh=62osjk6IhT3c3nB27KLL0IYMFJ66uGMdGU1FvPtKP34=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UBnryclfSJkMhmuQamrX6kuQTd3hubEdJasxhPAbIvqDoGJ94xxf++2v58p5a0/6rEA6hG8kZ/r6WKf/2uXNTPFxiicONqo6gaTcqY5GLGEw8IwJ49GusbYV1uRW+ALLUuNsTv2xnUB7ERtyb6Cux/xBhzphze6dGbx4PkIMTg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igTODBkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igTODBkX"
Received: by smtp.kernel.org (Postfix)
	id F3157C19425; Wed, 11 Feb 2026 18:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAD2C4CEF7;
	Wed, 11 Feb 2026 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770836167;
	bh=62osjk6IhT3c3nB27KLL0IYMFJ66uGMdGU1FvPtKP34=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=igTODBkX47nYhaM/oMDoi5ZjjTSM7d6Y779EbFOitxjJbkfX2t+SYo3NNPN2EG3pL
	 b2Ld80RNy+CuZDFhnqoOQa/4I2w3B3M5rUMXsFtp2S4heG2AVM9IjKD6Zq+j2BiVkX
	 Gcf8PMp5HuxCTPWyd0Xje1gxoHs5vbfl2VTHO8e2f6f8yJSy3KCtgrPa/59QDQygAo
	 9ZOJLGMGafDFR19u3OrpDREfLMze9WEBtfLrjPwmidgs0JjPgSV/udfwrS3kx+M09l
	 h/J6b1la/LhETSOstQLB0QDC8yQeKe10jp9PnycqIoWZgf/w/LCJl7vaEnJ6PTzo7i
	 Ya9EpVk+KfSlQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BE36FF40068;
	Wed, 11 Feb 2026 13:56:06 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Wed, 11 Feb 2026 13:56:06 -0500
X-ME-Sender: <xms:xtCMaYWCrO7epVMDq6Ku6Cge9tQ1WsiUg5HR3lsnzpYmrGhAWEKlhw>
    <xme:xtCMaXbk4SDL-c-dGUUWsz6bo2BHt7dgt5kSSG-VCqWGSJY28eW2sfG5jQGyT-axB
    fD8mM2JaPpvUBM_mljhCQtnGzHvaBa8soYbyszx0Lx3um4s8gUNYZFx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeffedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfmfhonhhs
    thgrnhhtihhnucfthigrsghithhsvghvfdcuoehmrhhitghonheskhgvrhhnvghlrdhorh
    hgqeenucggtffrrghtthgvrhhnpedtkeekjeeiffdvfeeiheehheetffeigeefteegueei
    vdetgedvtdevfeekgeevleenucffohhmrghinhepsghorhhishdrlhhotggrlhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrhhitghonhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeigedttdduvdeifedqvddutd
    egjedtleeiqdhmrhhitghonheppehkvghrnhgvlhdrohhrgheskhgvrhhnvghlmhgrihhl
    rdhnvghtpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtohholhhssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehushgvrhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xtCMaR2GquCFfPBt64ZUg6FD2-IdA-522JsYZ0FTjN9GyDW6Jq004w>
    <xmx:xtCMafgfp1eCI5jXOuN6F4FoGG2HHllFG6IVkdyr5Y___FfsocOoew>
    <xmx:xtCMafR0_zUwTeKJWMnkLOp4Ey-eGGUKOChj2OBkPH9M4dkR2noU6g>
    <xmx:xtCMaYiHktLJV0vDpYoVLIOCjQ_ZJmXq2Wk0XE3o1w9ZCT1u9-mtng>
    <xmx:xtCMaX5g6Zn75eDiHKBvKKL93hnHsNiAL76msvRC5Hx7eo-0znX_Mm5F>
Feedback-ID: i40364868:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9A85D15C008C; Wed, 11 Feb 2026 13:56:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AaRULT8oiOAZ
Date: Wed, 11 Feb 2026 13:55:45 -0500
From: "Konstantin Ryabitsev" <mricon@kernel.org>
To: "Borislav Petkov" <bp@alien8.de>
Cc: users@kernel.org, tools@kernel.org
Message-Id: <9305e0e4-b6e6-4cb2-ad71-a929bf282565@app.fastmail.com>
In-Reply-To: <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
 <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
 <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
Subject: Re: korgalore v0.5.2 now available
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Feb 11, 2026, at 13:52, Konstantin Ryabitsev wrote:
>> $ pipx upgrade korgalore
>> korgalore is already at latest version 0.5.dev0 (location: /home/boris/.local/share/pipx/venvs/korgalore)
>
> If you installed a dev version, you'll need:
>
>     pipx upgrade --force korgalore3

No idea where that "3" came from. Just korgalore.

-K
