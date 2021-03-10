Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18BA61
	for <tools@linux.kernel.org>; Wed, 10 Mar 2021 19:44:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 151DF64EB2;
	Wed, 10 Mar 2021 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615405479;
	bh=/MfsRMDQGSueqU+J+nIWJoyCVF8+Nu9aS7RoMJo7b1U=;
	h=Date:From:To:Cc:Subject:From;
	b=LM0PpREAAn2wVCu4DX7xjbfMS3Q093ZvQSKE8fTK1rTRhQ93r+KhXqPvtJq/MDtlc
	 QcUapjxS5Y9nwZwFTI0xRtHTuERStRF9dm+QkeXF0R2POOr4XXFS6SE8qnDOyrttuy
	 S++o1w6zG6C45OVrIf3vmZV7Ia43R9S89Xnxzrj/P6FMYn7uaVOVGgvRvKo38np4m3
	 bviQq7jgdy/7urq02nN6+GwreZLP2K7lIjn9HIN7Boej3qrAqOPNZeZHtA/wlRgphD
	 D21WJficMcIaMKnIinpcVGJ9Rq/cjqbIEH0tD3da1zUiFoyQLWY/SsvDdSytFIE7QP
	 /gwjVDPm4GbhQ==
Date: Wed, 10 Mar 2021 13:44:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: b4 claims patches are missing
Message-ID: <20210310194437.GA2035122@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <tools+subscribe@linux.kernel.org>
List-Unsubscribe: <tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Not sure what happened here.  Mutt sees this, which *looks* like it
should work:

  - Mar  8  9:24 Arnd Bergmann   [PATCH 1/3] PCI: controller: al: select CONFIG_
  - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 2/3] [RESEND] PCI: controller: thunde
  - Mar  8  9:24 Arnd Bergmann   ├─>[PATCH 3/3] [RESEND] PCI: controller: avoid
  - Mar  8 17:11 Krzysztof Wilcz ├─>Re: [PATCH 1/3] PCI: controller: al: select

$ b4 --version
0.6.2

$ b4 am -om/ https://lore.kernel.org/r/20210308152501.2135937-1-arnd@kernel.org
Looking up https://lore.kernel.org/r/20210308152501.2135937-1-arnd%40kernel.org
Grabbing thread from lore.kernel.org/linux-pci
Analyzing 4 messages in the thread
---
Thread incomplete, attempting to backfill
Grabbing thread from lore.kernel.org/lkml
---
Writing m/20210308_arnd_pci_controller_al_select_config_pci_ecam.mbx
  ✓ [PATCH 1/3] PCI: controller: al: select CONFIG_PCI_ECAM
    + Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
  ERROR: missing [2/1]!
  ERROR: missing [3/1]!
---
Total patches: 1
---
WARNING: Thread incomplete!
 Link: https://lore.kernel.org/r/20210308152501.2135937-1-arnd@kernel.org
 Base: not found
       git am m/20210308_arnd_pci_controller_al_select_config_pci_ecam.mbx
