Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.14822.1584749735083431891
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 17:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: tony.luck@intel.com)
IronPort-SDR: cjVL3elB73fu8egA+XmkOl4G2w6J9yv62hEE9mZkdeLBmOgjtR81Z5v+jk5xwce8GrCGFSubI0
 uR5SFlmOGKqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 17:15:34 -0700
IronPort-SDR: ELSmYUT3xdckBcVV3cNqE0mLBpI0SXxu33svYOsJCfrdkX+gvFoEsTecjC12g4tltg1INz5wbd
 ZIocIEh16bsA==
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; 
   d="scan'208";a="237371329"
Received: from agluck-desk2.sc.intel.com (HELO agluck-desk2.amr.corp.intel.com) ([10.3.52.68])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 17:15:34 -0700
Date: Fri, 20 Mar 2020 17:15:33 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Another glitch in "b4"
Message-ID: <20200321001533.GA6137@agluck-desk2.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

$ b4 am 20200320131345.635023594@linutronix.de
Looking up https://lore.kernel.org/r/20200320131345.635023594@linutronix.de
Grabbing thread from lore.kernel.org
Analyzing 39 messages in the thread
---
Writing ./20200320_tglx_linutronix_de.mbx
  [patch 01/22] x86/devicetable: Move x86 specific macro out of generic code
  [patch 02/22] x86/cpu: Add conistent CPU match macros
  [patch 03/22] x86/cpu/bugs: Convert to new matching macros
  [patch 04/22] x86/perf/events: Convert to new CPU match macros
  [patch 05/22] x86/kvm: Convert to new CPU match macros
Traceback (most recent call last):
  File "/home/agluck/.local/bin/b4", line 10, in <module>
    sys.exit(cmd())
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/command.py", line 132, in cmd
    cmdargs.func(cmdargs)
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/command.py", line 38, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/mbox.py", line 391, in main
    mbox_to_am(threadmbox, config, cmdargs)
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/mbox.py", line 136, in mbox_to_am
    linkmask=config['linkmask'])
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/__init__.py", line 381, in save_am_mbox
    attdoc = lmsg.get_attestation(lore_lookup=lore_lookup, exact_from_match=exact_from_match)
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/__init__.py", line 808, in get_attestation
    self._load_attestation(lore_lookup=lore_lookup)
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/__init__.py", line 803, in _load_attestation
    self.load_hashes()
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/__init__.py", line 726, in load_hashes
    p = LoreMessage.get_patch_hash(patch)
  File "/home/agluck/.local/lib/python3.7/site-packages/b4/__init__.py", line 688, in get_patch_hash
    if line[0] != '-':
IndexError: string index out of range
