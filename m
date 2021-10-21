Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAB72
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 22:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7EzOoEfovixqs3i04j7dR3Bs68AY601X00mKzDwoK6U=; b=h3IEW76bqQybr4bhJVI03Qxyu7
	WzhjNQ386KrmGc5jV0buk5Y2sMqjH2LSisuvF3CvWQkM144zfWrfTW9ZTDNvRi43R8aKjO/6PPOKT
	fSjB5QVmUmqhRd9MqA99dQQutSs6grCTnGdx2QuVIhwgio4aEwT1tPKrECYANnrxEl++WWvCGAdlh
	Krrjd/OHwg6ssi8vJ/+gm51OE0DAI59oeGv9VIgxdo/uafEUQ55C4V5Ys7VP7+B0bngl3oqLqVKXw
	ME364BfrtwgjsE6Jkt0JpjGi8nNWJj8OVapm2/YL7XckZm+p29Dp4b/yhQjrW6o3axHHPMghEOlzb
	xL4Ld/Fw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55222)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1mdgT4-000144-Vp; Thu, 21 Oct 2021 23:23:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1mdgT4-0000aX-7q; Thu, 21 Oct 2021 23:23:22 +0100
Date: Thu, 21 Oct 2021 23:23:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: injected body trailers
Message-ID: <YXHoWksP6cjm0Zdy@shell.armlinux.org.uk>
References: <202110211313.B5C5C61@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110211313.B5C5C61@keescook>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 21, 2021 at 01:22:31PM -0700, Kees Cook wrote:
> 2) Can the linux-arm-kernel mailing list please stop breaking DKIM?
>    Who should authorize this change (rmk, Catalin)? And who can make
>    the change (peterz)?
>    (I realize now that all the mail from linux-arm-kernel has been
>    getting dropped into my Spam folder -- I normally don't notice since
>    I'm usually CCed directly or via some other list on things I wanted
>    to see.)

The lists are nothing to do with me. I also stopped tracking who
looks after the lists; I've always asked dwmw2 when there's been
some problem because he's responsible for infradead.org.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
