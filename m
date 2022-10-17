Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203724699
	for <tools@linux.kernel.org>; Mon, 17 Oct 2022 17:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D1AC4314A
	for <tools@linux.kernel.org>; Mon, 17 Oct 2022 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666027404;
	bh=e1J393mfuyVOam7Fi/2kdZ/7qpWsa57SvjNKUvKmWWU=;
	h=Date:From:To:Subject:From;
	b=tOyovsXTJazajOlTMJw34baoRRqjnqNQ8u2lcLMVSQURca+THgdVOwEqj9xaAyYlh
	 zqANz9pdlaMmFb675CjMUf4RFkELH1ikSJCb7JfgAoh2FdOIFddKjLJkLq0SGex3k6
	 gg1e0/Zfw9GOc1Wi4t27zOwAD97QxPmooMZ6IIp+YczLfCEDr+CjRHYpvg9DOAAyY3
	 h3+lxQ9xXHd9jubtl4JfkXlPI4fMRe+m8Ucmkn/MBXi/HcgtpA/BRsH0zB5gEl9Sr3
	 L8S67arkXLEDwQeAimEiH1B7hdiC4SDfTdDW3yjUcUrF29keGTnyqsek9QbHfUTxf0
	 TrPVtb687ZCXw==
Date: Mon, 17 Oct 2022 12:23:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Subject: "b4 ty -d all" crash
Message-ID: <20221017172323.GA3715117@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've used "b4 am" for a long time, but I'm a first-time and naive
"b4 ty" user:

  12:17:52 ~/linux (for-linus)$ b4 ty -d all
  Discarding 707 messages
    Discarded: [PATCH 0/5] Handled return value of platform_get_irq correctly
  Traceback (most recent call last):
    File "/home/bjorn/.local/bin/b4", line 8, in <module>
      sys.exit(cmd())
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 341, in cmd
      cmdargs.func(cmdargs)
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 106, in cmd_ty
      b4.ty.main(cmdargs)
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ty.py", line 678, in main
      discard_selected(cmdargs)
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ty.py", line 578, in discard_selected
      msgids.append(pdata[2])
  IndexError: list index out of range

  12:18:06 ~/linux (for-linus)$ b4 --version
  0.10.1

  12:18:29 ~/linux (for-linus)$ b4 ty -l
  Currently tracking:
    1: [PATCH RFC 0/2] pci: Make return value of pcie_capability_*() consistent
	 From: refactormyself@gmail.com <refactormyself@gmail.com>
	 Date: Mon, 4 May 2020 07:18:10 +0200
	 Link: https://lore.kernel.org/r/20200504051812.22662-1-refactormyself@gmail.com
    2: [PATCH v7 0/2] Adding support for Versal CPM as Root Port driver
	 From: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
	 Date: Thu, 7 May 2020 17:28:34 +0530
	 Link: https://lore.kernel.org/r/1588852716-23132-1-git-send-email-bharat.kumar.gogada@xilinx.com
  ...
  706: [PATCH] Revert "PCI: tegra: Use PCI_CONF1_EXT_ADDRESS() macro"
	 From: Jon Hunter <jonathanh@nvidia.com>
	 Date: Mon, 17 Oct 2022 09:40:06 +0100
	 Link: https://lore.kernel.org/r/20221017084006.11770-1-jonathanh@nvidia.com
  ---
  You can send them using number ranges, e.g:
    b4 ty -t 1-3,5,7-

