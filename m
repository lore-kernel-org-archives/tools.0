Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5C3FC2;
	Wed,  1 Sep 2021 13:13:08 +0000 (UTC)
Date: Wed, 1 Sep 2021 15:12:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1630501980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8e4HkWyHCtvgZBPHqzQrxLrlNBGa8+iHa4W5xhbQ4Yk=;
	b=eSvaLxiMvxGIGinvzp8it+q5JRMGZ4J+NuIKb73kBg+48+5+ZGmLrXDpPupwRtDkwvi7VG
	2FnH6P2l3FqQkWaT82NbCudWSN1Yzj8aLON1Rlv3ORmLfXZ+5xbnz6p6hnMEL+oA9f+UFG
	hkHwKqEcswRk7NdeCHu46zcvo0JDPPse+MdhtyEyvh5XEsMtfTL+v9luq0Cw971oC/Kz3t
	VyS+WVU/dKvvlZuB6SDpfhlKwq06f1k94TQs45+W6uLA6PJryaKvKiGIKP5r1EtSpApIsN
	nXJhd0lrrdNqFH1whZNiGHEhOrqDquULTCRxNB5K2++KLbCccOdTzAN/wcp1dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1630501980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8e4HkWyHCtvgZBPHqzQrxLrlNBGa8+iHa4W5xhbQ4Yk=;
	b=OZvr8Xw/PzZe1rs8h2mC6HzzcZgZQLguIIgsCCiT8rvcKsSmkj/inpZb3hFY7k7TZRzIbh
	A+MNwo9KWMe61TCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210901131259.7slxtcftirxb4bhp@linutronix.de>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210830164626.tq5emfrht4o46x33@nitro.local>

On 2021-08-30 12:46:26 [-0400], Konstantin Ryabitsev wrote:
> Hi, all:
Hi,

> My tests of the new lore.kernel.org service (currently running on
> x-lore.kernel.org) are looking good, so I will be putting that into production
> on Wednesday, September 1, 2021.

x-lore misses a hostname in its cert:

| This server could not prove that it is lkml.kernel.org; its security
| certificate is from ams.source.kernel.org. This may be caused by a
| misconfiguration or an attacker intercepting your connection.

> Best regards,
> -Konstantin

Sebastian
