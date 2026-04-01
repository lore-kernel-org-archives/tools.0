Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350135B65D
	for <tools@linux.kernel.org>; Wed,  1 Apr 2026 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027607; cv=none; b=Es2smfLYnRBentG5wml/ANIWqTASFwsXtzS6L/oROezf9fBaGZdTprj6KxoQCnjGea/uaDz/Cyij+Gx9Y2le5N+CUP5MGy/be2Phu5mproeMfkqvthOrIyCjZFJLWhI6mnT7wjeys2lDEX0z2Rq3opoQh6w55Qx+Mdw9osJSdQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027607; c=relaxed/simple;
	bh=p+uhv5Xlv2uts5pTgF/du2BDKi6w1FqzFcVYTxorB6w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TM+MjonQORTG/PLjJrp0IemCEBJ1p49Z9NAlefeXvOeQEWqR3V3SFNfXe+JA7WFeKKXmQA3tqW9srPynZs9HcD+LbcIKEQniXfa+4UgPCPvNhNROix1/EJXgJmtZEDVWtw9tAHLHRv4AiiLEngkBiwmpqMXmxEqsxRTem6J2qlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfyXMTCK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfyXMTCK"
Received: by smtp.kernel.org (Postfix)
	id CDAA2C2BC9E; Wed,  1 Apr 2026 07:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6A0C19423
	for <tools@kernel.org>; Wed,  1 Apr 2026 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775027606;
	bh=p+uhv5Xlv2uts5pTgF/du2BDKi6w1FqzFcVYTxorB6w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=IfyXMTCKOfhHddwyJ5L5X5VnzzOVRurMa6/ieyc3Ax7KYY1/qaAUlxx1SB86yxKsC
	 gmGtbdJOGhBtlth/Ou/M1FuZcmfM1OhkuY60dFrp3VQtocgylefNI/g5GcxgB+PNgf
	 Bptuwmueiyw1kY5Ls8ou+ZoQhN/ky2cRfdd8VkirpJGNl+efE3IVKK6LTcTPO2S+8t
	 o6dUsBUfZYMCv8pSs6ikFzwKKGOXsKDis2iUbZQazp5wcGZ9GAhPbh5RgwvUt7tdzo
	 UPpERIZ9JFqqPe21JBYsFjwefxXEi2J/lO2iQsETeAXK7LJl0pqhiDzgxItaqLZ76m
	 0GDQ+5OjqQorA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9C69CF4006F;
	Wed,  1 Apr 2026 03:13:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 03:13:25 -0400
X-ME-Sender: <xms:lcXMaYbi-OWusQNLPXixMPfNfMlOicAikK_fu-JXkXud5oIY-xRlUw>
    <xme:lcXMaeOqk2mbkz6vxCx6njXW_dojP2SQklGfDVpSDg4vcFDHlnGYf6lChcNc3NAu1
    qlEMbRP4EsCy0_Gn-sBULSLPTES-CBI8vgVb1yxCrvChP7jXhaYGoY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:lcXMaW6zTa6xhrpCRQNlh9lXwvkHRa1CTe3GJQA1Nv9-D9aoDoFJKQ>
    <xmx:lcXMaV7ZRazM3gMVkkOi3no2mlfhigdHxQ35Z3kcq5XqbhNa7oVtRA>
    <xmx:lcXMaTH3-DVC0vA_Gs7w6efLxE62YR36dhmTVBzCJ2Vk4qUiEJLmsw>
    <xmx:lcXMaeSOHTCFfrRHvwVCdzaxLpDhWL3ofLdDfbzb-4Gqx4vAWBap3w>
    <xmx:lcXMacss7WZJUQTICRWdRP5CIaodKnyEnI-IfXiZ5zZF_pqkmZ-seYGo>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B821700069; Wed,  1 Apr 2026 03:13:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMWi8b3sQivR
Date: Wed, 01 Apr 2026 09:13:05 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: tools@kernel.org
Message-Id: <e77298ce-1e3e-449f-9864-b4fcf77a00b4@app.fastmail.com>
In-Reply-To: <25a3c713-4fee-4a37-b535-58d9da34e008@app.fastmail.com>
References: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>
 <20260330-uptight-leopard-of-awe-ee7afe@lemur>
 <25a3c713-4fee-4a37-b535-58d9da34e008@app.fastmail.com>
Subject: Re: another korgalore issue with linux-crypto
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026, at 08:45, Ard Biesheuvel wrote:
> On Mon, 30 Mar 2026, at 20:43, Konstantin Ryabitsev wrote:
>> On Sat, Mar 28, 2026 at 06:53:44PM +0100, Ard Biesheuvel wrote:
>>> Hi Konstantin,
>>> 
>>> Not sure whether this happened because my local fork was in a funny state, but I got the following issue related to a 'rm' commit.
>>
>> Yeah, I think it's a real bug, but testing is tricky. I pushed a commit to
>> master/stable-0.6.y that should hopefully fix this (or, at least, make it fail
>> differently). Can you try that out? Using stable-0.6.y may be easier, as
>> master currently pulls in a new library.
>>
>
> Thanks for the fix. I've upgraded to this version now, but the 
> underlying failure condition is no longer there, so I can't really say 
> for sure whether things are any better now.

Actually, I still think something fishy is going on. In my log below, it seems that linuxcrypto is still in a funny state, as the number of messages keeps going up. The last message that was actually newly delivered was

Date: Tue, 31 Mar 2026 13:22:14 +0100
Message-ID: <20260331122214.103145-1-julianbraha@gmail.com>

When I run kgl on the command line I get

$ korgalore/kgl.sh pull linuxcrypto
Reattempting delivery  [####################################]  1/1
Updating feeds  [####################################]  1/1                                      
Pull complete with no updates.



2026-04-01 02:36:48,183 - INFO - Pull complete with updates:
2026-04-01 02:36:48,183 - INFO -   linuxcrypto: 305
2026-04-01 02:36:48,183 - INFO -   lakml: 1
2026-04-01 02:48:43,747 - INFO - Pull complete with updates:
2026-04-01 02:48:43,747 - INFO -   linuxcrypto: 306
2026-04-01 02:48:43,747 - INFO -   lakml: 1
2026-04-01 03:09:04,468 - INFO - Pull complete with updates:
2026-04-01 03:09:04,469 - INFO -   lakml: 4
2026-04-01 03:18:03,423 - INFO - Pull complete with updates:
2026-04-01 03:18:03,423 - INFO -   lakml: 1
2026-04-01 03:21:04,713 - INFO - Pull complete with updates:
2026-04-01 03:21:04,714 - INFO -   lakml: 1
2026-04-01 03:24:03,478 - INFO - Pull complete with updates:
2026-04-01 03:24:03,478 - INFO -   lakml: 1
2026-04-01 03:48:03,506 - INFO - Pull complete with updates:
2026-04-01 03:48:03,506 - INFO -   lakml: 1
2026-04-01 04:00:04,528 - INFO - Pull complete with updates:
2026-04-01 04:00:04,529 - INFO -   linuxhardening: 1
2026-04-01 04:06:04,315 - INFO - Pull complete with updates:
2026-04-01 04:06:04,315 - INFO -   lakml: 2
2026-04-01 04:12:04,709 - INFO - Pull complete with updates:
2026-04-01 04:12:04,709 - INFO -   lakml: 2
2026-04-01 04:21:03,486 - INFO - Pull complete with updates:
2026-04-01 04:21:03,486 - INFO -   lakml: 2
2026-04-01 04:27:04,117 - INFO - Pull complete with updates:
2026-04-01 04:27:04,117 - INFO -   lakml: 2
2026-04-01 04:33:03,445 - INFO - Pull complete with updates:
2026-04-01 04:33:03,445 - INFO -   lakml: 1
2026-04-01 04:45:06,278 - INFO - Pull complete with updates:
2026-04-01 04:45:06,278 - INFO -   lakml: 1
2026-04-01 04:48:03,127 - INFO - Pull complete with updates:
2026-04-01 04:48:03,128 - INFO -   lakml: 1
2026-04-01 04:57:03,697 - INFO - Pull complete with updates:
2026-04-01 04:57:03,698 - INFO -   lakml: 1
2026-04-01 05:03:04,044 - INFO - Pull complete with updates:
2026-04-01 05:03:04,044 - INFO -   lakml: 3
2026-04-01 05:21:03,855 - INFO - Pull complete with updates:
2026-04-01 05:21:03,855 - INFO -   lakml: 1
2026-04-01 05:24:03,694 - INFO - Pull complete with updates:
2026-04-01 05:24:03,694 - INFO -   lakml: 1
2026-04-01 05:30:04,115 - INFO - Pull complete with updates:
2026-04-01 05:30:04,115 - INFO -   lakml: 1
2026-04-01 05:36:03,918 - INFO - Pull complete with updates:
2026-04-01 05:36:03,918 - INFO -   lakml: 2
2026-04-01 06:24:04,093 - INFO - Pull complete with updates:
2026-04-01 06:24:04,093 - INFO -   lakml: 3
2026-04-01 06:57:06,730 - INFO - Pull complete with updates:
2026-04-01 06:57:06,730 - INFO -   lakml: 8
2026-04-01 07:12:03,525 - INFO - Pull complete with updates:
2026-04-01 07:12:03,525 - INFO -   lakml: 1
2026-04-01 07:27:03,849 - INFO - Pull complete with updates:
2026-04-01 07:27:03,850 - INFO -   lakml: 1
2026-04-01 07:33:03,035 - INFO - Pull complete with updates:
2026-04-01 07:33:03,035 - INFO -   lakml: 1
2026-04-01 08:18:03,301 - INFO - Pull complete with updates:
2026-04-01 08:18:03,301 - INFO -   lakml: 1
2026-04-01 08:39:03,805 - INFO - Pull complete with updates:
2026-04-01 08:39:03,805 - INFO -   lakml: 1
2026-04-01 08:42:04,690 - INFO - Pull complete with updates:
2026-04-01 08:42:04,691 - INFO -   lakml: 1
2026-04-01 08:51:03,168 - INFO - Pull complete with updates:
2026-04-01 08:51:03,168 - INFO -   lakml: 1
2026-04-01 09:00:50,173 - INFO - Pull complete with updates:
2026-04-01 09:00:50,173 - INFO -   linuxcrypto: 306
2026-04-01 09:00:50,173 - INFO -   lakml: 1
2026-04-01 09:03:48,518 - INFO - Pull complete with updates:
2026-04-01 09:03:48,518 - INFO -   linuxcrypto: 307
2026-04-01 09:03:48,518 - INFO -   lakml: 13
