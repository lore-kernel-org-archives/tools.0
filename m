Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A05A61
	for <tools@linux.kernel.org>; Wed, 10 Mar 2021 19:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57AEC64FBB;
	Wed, 10 Mar 2021 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615405844;
	bh=Ry8p5/uDw/LGQnr+EJkoRTpGBcWlt6ltG1EtWVPFAKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=C43m/txriJ+z3JS8F1YKljlCrqbu+S0fPeuRYG+nmWby41jp2asyLLF0ED5EftgfY
	 f26f0eu0EYoUnYH0yyPa7a1UL18E6F+/0PPadhkZIz3GHv6KR/bxFqOYsO7mhqOtIA
	 jrVISAUQgdFy+tnymZNc0BhnTUbDlJiPblL3EPztNYX7tFUKTopp22NqYSmiZ0w3vp
	 dmjfwzulqA+M+JyUOSnxFVLOzt+xniEXUuDxfxZ26rLP6rgTXci3l1c12HGKx1dRpi
	 nLLgFBOgW8QMTA3MJYrclE5eDcgvLHLqFyoTQ0wIwaX1CQTNEeAed+W64WZKHpJhvG
	 c3Y0qWGHMOO9w==
Date: Wed, 10 Mar 2021 13:50:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: b4 claims patches are missing
Message-ID: <20210310195043.GA2035934@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <tools+subscribe@linux.kernel.org>
List-Unsubscribe: <tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310194437.GA2035122@bjorn-Precision-5520>

On Wed, Mar 10, 2021 at 01:44:39PM -0600, Bjorn Helgaas wrote:
> Not sure what happened here.  Mutt sees this, which *looks* like it
> should work:
> 
>   - Mar  8  9:24 Arnd Bergmann   [PATCH 1/3] PCI: controller: al: select CONFIG_
>   - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 2/3] [RESEND] PCI: controller: thunde
>   - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 3/3] [RESEND] PCI: controller: avoid
>   - Mar  8 17:11 Krzysztof Wilcz ├─>Re: [PATCH 1/3] PCI: controller: al: select
> 
> $ b4 --version
> 0.6.2
> 
> $ b4 am -om/ https://lore.kernel.org/r/20210308152501.2135937-1-arnd@kernel.org
> Looking up https://lore.kernel.org/r/20210308152501.2135937-1-arnd%40kernel.org
> Grabbing thread from lore.kernel.org/linux-pci
> Analyzing 4 messages in the thread
> ---
> Thread incomplete, attempting to backfill
> Grabbing thread from lore.kernel.org/lkml
> ---
> Writing m/20210308_arnd_pci_controller_al_select_config_pci_ecam.mbx
>   ✓ [PATCH 1/3] PCI: controller: al: select CONFIG_PCI_ECAM
>     + Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
>   ERROR: missing [2/1]!
>   ERROR: missing [3/1]!
> ---
> Total patches: 1
> ---
> WARNING: Thread incomplete!
>  Link: https://lore.kernel.org/r/20210308152501.2135937-1-arnd@kernel.org
>  Base: not found
>        git am m/20210308_arnd_pci_controller_al_select_config_pci_ecam.mbx

Huh, all three of those messages from Arnd seem to have the same
Message-ID:

  https://lore.kernel.org/linux-pci/20210308152501.2135937-1-arnd@kernel.org/
