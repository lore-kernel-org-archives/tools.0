Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D73FD2;
	Wed, 15 Sep 2021 13:00:09 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:00:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1631710807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+TVZe3+UyLDRPg1AKCIZFeEgg7qblIinUPd+YzDAKE=;
	b=HKgTM+DEyfG5DC4QfmW02YIR7Tf842GS8rsxRIaRxrh3k2g9Aq7D7ZK0ZRMAY8VutXczqZ
	+c21Dmt/CwIbhLMSdT0oaZnTd/t1pHyg+vB7RhJwffX6+OSmOWNpz6YVs5Iu9ySWy3TUs6
	W8+K1qhXunY5ra1tnENpcbNGyFJxRoAPsfNLd9fVOwqe0l7MvKNs9TtNWuXISJiVgWnbmz
	Xu87zxZj2ch4wcfpzuTyJ78SguSdkkWZsMsMtxEa9KWjJP34676k9+0QPdAqA+c5/Pn0N/
	H93Eia8pTmw32DYtnbaqIoyCX7N4xeAPYEWkpf2FlNMgnoIoS96SI72XmyRbEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1631710807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+TVZe3+UyLDRPg1AKCIZFeEgg7qblIinUPd+YzDAKE=;
	b=QiXssap/bu7twpsiomaw6BvGZxph8Q5UTYR0hDwAhG4EQV3uvt7IRSatAR2mEbfDUYrz9F
	EfJkaN7Zsvj+DlBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210915125305.far7k3clx3tvyokl@linutronix.de>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210901131259.7slxtcftirxb4bhp@linutronix.de>
 <20210901132519.vxw2wrly4pifnorv@meerkat.local>
 <20210915120555.3goilbwqeertbexe@linutronix.de>
 <20210915121521.fdsoxbwsfphbxyab@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915121521.fdsoxbwsfphbxyab@meerkat.local>

On 2021-09-15 08:15:21 [-0400], Konstantin Ryabitsev wrote:
> 
> This distinction is intentional -- lkml.kernel.org is the primary system from
> where lore.kernel.org nodes replicate. Being able to access lkml.kernel.org
> without a redirect is a feature, so I can't easily fix this.

ah okay. Don't worry then. I assumed its purporse a redirect to lore.
Do you plan to point lkml.k.o to geo.source.k.o with a cert?

> -K

Sebastian
