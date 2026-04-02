Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8777938837F
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115983; cv=none; b=mxxD8ei7CzuurqTUt5Ab4q1ClE2DD+cg/cUXeB0EAIICwIfsEakhZbAotBFTFVmvvQWcrgS7HM/PB20/4T5d1u7PWdjGUHLaxqtLgKH4pxlpdGawe95r6kDMMrhxehBXVXEIrX9MPlatsci8JQrM8G4185rQROveq2Cwhw9BVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115983; c=relaxed/simple;
	bh=l9SYgWtTBbKq4kp6+96PKeWGHJJzGiSZcB7eVFSRDGU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qGcIyeMdcWnOi/tO6DytnX5/1WySpez3mQrInacMJxuv629Ra1udH8DNYoFnnQdjp93/G76uouFcfOEeVGl8TU7NjJzKGRP94JnsBURp8vAxKPDdJ4w7wv4LFMM5IFtRQS1vuoh7RKitcmmWPNIN2VZWtYRSFf7CCSPfdB8Wgh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQqJn1+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQqJn1+L"
Received: by smtp.kernel.org (Postfix)
	id 03828C2BC9E; Thu,  2 Apr 2026 07:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7607C19423;
	Thu,  2 Apr 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775115982;
	bh=l9SYgWtTBbKq4kp6+96PKeWGHJJzGiSZcB7eVFSRDGU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oQqJn1+LGQ9pxt8XJJtrgTAj2wmz5Y92J7dYrWrEhICt5E8MYUzj99CNbpWErmG3r
	 7wmtaxUNE0yhRGOYkznmSVdXMK0kXkK4Lwslmq3LP7W5hFjW9P9DlVdB6oLgBk5uFg
	 CLIP+xn445QWHjCsAA63S0gbliyAZ/iXhT4CV63fafRf4ppeyuugrNkzs31y+JJAdy
	 kuLIDy2ThIgiUC/F3spa2XYS6wYax4TtJN93BD1dX/Huc8AkR2dm096v12NkXiJbUu
	 Ah4R4la+3kDLQplGps7xxCo04FFB+gBCLYyzWGgzMKLj3qTyqOl0ma5ZlN+sDcJcNt
	 azviZqSObjKig==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 946B9F40077;
	Thu,  2 Apr 2026 03:46:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 02 Apr 2026 03:46:21 -0400
X-ME-Sender: <xms:zR7Oacx4NUp0vlSwZihSvKoKo-Paw3aQMACke4HqGKKFP8huj4WKKQ>
    <xme:zR7OabGK6sImJ_oB9o7xZBIyFRD25uK1iiwClQPVYDb-WPnH_WEpT0EAwmYUBPVoO
    HGNHfkehmM_wBXgMsqLmksoxY-A5cu9wBIIE2ky09tcymZTWooUjJZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehgeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtre
    dttdenucfhrhhomhepfdetrhguuceuihgvshhhvghuvhgvlhdfuceorghruggssehkvghr
    nhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepvdeuheeitdevtdelkeduudetgffftd
    elteefteevjeevjeeiheefhfejieejfedunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgvrhhsohhnrg
    hlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppehkvghrnhgv
    lhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohepvddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihgtohhnsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehtohholhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zR7OaUS0m3662vcf5Ettu_GleC3KB-TYbcjGtaohO3UbH1QBw5U65g>
    <xmx:zR7OaXx4hMtq6y5lpnsoZcezZrGdLUYqDTkQE01a7SepE-4hyzv-GQ>
    <xmx:zR7OafeqP3raknGCdw67IgPDvbVNXBelhR5ZGTupxpbHr6xiieTxtw>
    <xmx:zR7OaTL-QzbUfWnI-RZsb5LG2rOc2wolBY8gWFi1aMZqc5vHwtP9-A>
    <xmx:zR7OaQGlMs3rjXhvP6r5_AoAbFDwKvrjly9-zuPPYDUCO_CUCF6QRmuS>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 472E9700065; Thu,  2 Apr 2026 03:46:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMWi8b3sQivR
Date: Thu, 02 Apr 2026 09:46:00 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: tools@kernel.org
Message-Id: <cf26ce43-89e7-453c-b066-f1fdbe03a959@app.fastmail.com>
In-Reply-To: <20260401-cunning-lyrical-foxhound-5f5d6e@lemur>
References: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>
 <20260330-uptight-leopard-of-awe-ee7afe@lemur>
 <25a3c713-4fee-4a37-b535-58d9da34e008@app.fastmail.com>
 <e77298ce-1e3e-449f-9864-b4fcf77a00b4@app.fastmail.com>
 <20260401-cunning-lyrical-foxhound-5f5d6e@lemur>
Subject: Re: another korgalore issue with linux-crypto
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 1 Apr 2026, at 22:58, Konstantin Ryabitsev wrote:
> On Wed, Apr 01, 2026 at 09:13:05AM +0200, Ard Biesheuvel wrote:
>> > Thanks for the fix. I've upgraded to this version now, but the 
>> > underlying failure condition is no longer there, so I can't really say 
>> > for sure whether things are any better now.
>> 
>> Actually, I still think something fishy is going on. In my log below, it seems that linuxcrypto is still in a funny state, as the number of messages keeps going up. The last message that was actually newly delivered was
>> 
>> Date: Tue, 31 Mar 2026 13:22:14 +0100
>> Message-ID: <20260331122214.103145-1-julianbraha@gmail.com>
>> 
>> When I run kgl on the command line I get
>> 
>> $ korgalore/kgl.sh pull linuxcrypto
>> Reattempting delivery  [####################################]  1/1
>> Updating feeds  [####################################]  1/1                                      
>> Pull complete with no updates.
>
> This helped. Please try another update of stable-0.6.y -- hopefully that
> actually fixes this condition.
>

Yes, that seems to do the trick. Thanks!
