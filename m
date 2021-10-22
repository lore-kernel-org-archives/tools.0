Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8068
	for <tools@linux.kernel.org>; Fri, 22 Oct 2021 07:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YvRinDq1rqglWoivcGbhp/yZZAhTO6SJ/cYPJpQn4zQ=; b=DG57EhwgCNzjnttKOfsoC/iX/J
	64d/bT8N1Y4Bo+4zMKUWU398oK+wvwh6obZwxGAUvJhrB/DQaWA2vmVqC+V4ZMCV+QdQZjDQ/jeIk
	riuw/nKXwDSLWHVxrZxPWVKWtLIZXJ5YRlupl8h12X4zwTHJy13zh5yTzwLpy97TreJvETX7chCjv
	TCD2pbNoWj6enYpZEztBQbHVqJmisdChz4BDooYMXEMZTvY2+6HsKXOGAZDG4Ehya/q+J2+RqFhMI
	FpNiLZXhPzNfoaLmXMNdvr5omhm/nHz6c90LG/7GcTB/BF1qDtJ8XHT9eN1Ze4Yp3BUh3+haX6hQS
	uRpLA3PA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55228)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1mdp2w-0001P7-61; Fri, 22 Oct 2021 08:32:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1mdp2t-00010l-Ih; Fri, 22 Oct 2021 08:32:55 +0100
Date: Fri, 22 Oct 2021 08:32:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kees Cook <keescook@chromium.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: Re: injected body trailers
Message-ID: <YXJpJ33SRCTQjoiF@shell.armlinux.org.uk>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>
 <202110212044.D38D0993E8@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110212044.D38D0993E8@keescook>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 21, 2021 at 08:53:09PM -0700, Kees Cook wrote:
> On Thu, Oct 21, 2021 at 10:42:46PM +0100, David Woodhouse wrote:
> > I run the host but per-list settings are up to the admin of the
> > individual list. For the lak list, vince@kyllikki.org and 
> > mouw@nl.linux.org are listed as admins. I don't know if that
> > corresponds with who actually remembers the list password these days; I
> > can set a new one and provide it if that's helpful.
> 
> $ grep -Ei '(kyllikki|mouw@)' MAINTAINERS .mailmap  | wc -l
> 0
> $ grep linux-arm-kernel@lists.infradead.org MAINTAINERS | wc -l
> 157
> 
> How about we reset that password and make the following folks the
> list admins, assuming they're interested:
> 
> ARM PORT
> M:      Russell King <linux@armlinux.org.uk>

No thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
