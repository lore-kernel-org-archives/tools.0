Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20361
	for <tools@linux.kernel.org>; Wed, 10 Mar 2021 20:11:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 416AE64F93;
	Wed, 10 Mar 2021 20:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615407103;
	bh=kUfb3aBG0ORlmJw3nMc1kF/utQmtoZA3FZQlsLbVkzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uQVhb+kKWDxCpHG2OgdINOkitSmUQaR+PVs8r1mvbT5Mdi/90CkSB8vk6QNdL89uF
	 e2dFvqi4pKBp66tYCd79pM4UEcdw/EyD6qk0rky8xMs5lK3ECU24/qhGgX2E9ZRqtN
	 SVsUH33UHJGQ2Evm4vpLnNnsFlXz3bN5TlMn7rcYTOXFLUh6tXflmIagfcI7QcIeMv
	 mPNkGjF0x3SFYjlHPmeWzZoj4usFdgv83ZZc1TogLNP2ZE6IJfEAZeuLFRNc2Lb3e9
	 laIRDqzv33QsdrfIDBz2ASic/qMYGbmD/BunlIwM861mkp0UNjyl/QXbF0FCq10hs6
	 5ikNKs5Mj2l+Q==
Date: Wed, 10 Mar 2021 14:11:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: b4 claims patches are missing
Message-ID: <20210310201141.GA2038431@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <tools+subscribe@linux.kernel.org>
List-Unsubscribe: <tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310195043.GA2035934@bjorn-Precision-5520>

On Wed, Mar 10, 2021 at 01:50:44PM -0600, Bjorn Helgaas wrote:
> On Wed, Mar 10, 2021 at 01:44:39PM -0600, Bjorn Helgaas wrote:
> > Not sure what happened here.  Mutt sees this, which *looks* like it
> > should work:
> > 
> >   - Mar  8  9:24 Arnd Bergmann   [PATCH 1/3] PCI: controller: al: select CONFIG_
> >   - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 2/3] [RESEND] PCI: controller: thunde
> >   - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 3/3] [RESEND] PCI: controller: avoid
> >   - Mar  8 17:11 Krzysztof Wilcz ├─>Re: [PATCH 1/3] PCI: controller: al: select
> > 
> > $ b4 --version
> > 0.6.2
> > 
> > $ b4 am -om/ https://lore.kernel.org/r/20210308152501.2135937-1-arnd@kernel.org
> > Looking up https://lore.kernel.org/r/20210308152501.2135937-1-arnd%40kernel.org
> > Grabbing thread from lore.kernel.org/linux-pci
> > Analyzing 4 messages in the thread
> > ---
> > Thread incomplete, attempting to backfill
> > Grabbing thread from lore.kernel.org/lkml
> > ---
> > Writing m/20210308_arnd_pci_controller_al_select_config_pci_ecam.mbx
> >   ✓ [PATCH 1/3] PCI: controller: al: select CONFIG_PCI_ECAM
> >     + Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> >   ERROR: missing [2/1]!
> >   ERROR: missing [3/1]!
> > ---
> > Total patches: 1
> > ---
> > WARNING: Thread incomplete!
> >  Link: https://lore.kernel.org/r/20210308152501.2135937-1-arnd@kernel.org
> >  Base: not found
> >        git am m/20210308_arnd_pci_controller_al_select_config_pci_ecam.mbx
> 
> Huh, all three of those messages from Arnd seem to have the same
> Message-ID:
> 
>   https://lore.kernel.org/linux-pci/20210308152501.2135937-1-arnd@kernel.org/

Sorry, my mistake.  I obviously can't distinguish "Message-ID" from
"In-Reply-To".
