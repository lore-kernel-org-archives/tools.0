Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAEF70
	for <tools@linux.kernel.org>; Thu,  8 Apr 2021 16:02:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17F38610F8
	for <tools@linux.kernel.org>; Thu,  8 Apr 2021 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617897748;
	bh=di4pO+hC3ti1zZlYxBPtQ14b3dxWmJ62aaKENXolrK0=;
	h=Date:From:To:Subject:From;
	b=PR69EKP5g8zXWMku5uvUC9hicaqgnuvbEf5Vw46MHGq85r9aTxArPbQS20Q0nCGj1
	 j0LmI2Ds9/kUh5lmZqv62Sw4oLxSlCCGExXL4wJqi1QOgrTP1f1FGozqazmzQW/N2t
	 IpFqZnG/pSjCeHV8LzTd6AahjmKRWkm/QhA2nsO+hnsqZo4hGxiSbRtIFS/q1S7T6r
	 RSBhESlOhPNcpu/nBKyccbJH46EGNC6i4Wh7XslSFan7rLebrZyI+bOv31evwb3zbB
	 3XfxchS5h6iEkBEu4wgxrd57FtvmorApNSs9S2W7Me1vxDC+9cLidMcqPQdBP6lDn7
	 PNXZ0SDT8o+dw==
Date: Thu, 8 Apr 2021 11:02:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Subject: b4 corrupts patch
Message-ID: <20210408160226.GA1932146@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

b4 seems to corrupt this patch when fetching and adding a Reviewed-by
tag:

  https://lore.kernel.org/r/b411af88-5049-a1c6-83ac-d104a1f429be@huawei.com

It applies fine if I save the message from Mutt or if I wget it by
hand from
https://lore.kernel.org/linux-acpi/b411af88-5049-a1c6-83ac-d104a1f429be@huawei.com/raw

$ b4 --version
0.6.2

$ b4 am -om/ https://lore.kernel.org/r/b411af88-5049-a1c6-83ac-d104a1f429be@huawei.com
Looking up https://lore.kernel.org/r/b411af88-5049-a1c6-83ac-d104a1f429be%40huawei.com
Grabbing thread from lore.kernel.org/linux-acpi
Analyzing 3 messages in the thread
---
Writing m/v2_20210325_liuzhiqiang26_acpi_hotplug_pci_fix_memory_leak_in_enable_slot.mbx
  [PATCH v2] ACPI / hotplug / PCI: fix memory leak in enable_slot()
    + Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
Total patches: 1
---
 Link: https://lore.kernel.org/r/b411af88-5049-a1c6-83ac-d104a1f429be@huawei.com
 Base: not found (applies clean to current tree)
       git am m/v2_20210325_liuzhiqiang26_acpi_hotplug_pci_fix_memory_leak_in_enable_slot.mbx

$ git am m/v2_20210325_liuzhiqiang26_acpi_hotplug_pci_fix_memory_leak_in_enable_slot.mbx
Applying: ACPI / hotplug / PCI: fix memory leak in enable_slot()
error: corrupt patch at line 17
Patch failed at 0001 ACPI / hotplug / PCI: fix memory leak in enable_slot()
