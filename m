Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by mx.groups.io with SMTP id smtpd.web11.3986.1585102753209239382
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 19:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zx2c4.com header.s=mail header.b=s/FU03Oj;
 spf=pass (domain: zx2c4.com, ip: 192.95.5.64, mailfrom: jason@zx2c4.com)
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b795fe95;
	Wed, 25 Mar 2020 02:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=Rg7LCqEc0Isq7FsyRZ4aLbZniPs=; b=s/FU03
	OjrVxb/sEliE4vzsx0qSaDc83SOko2TyLwqkJAkBK/yXNn4tVY3MdETiHwagw7Vk
	Fj4VstJr8hpxf8aTr28GqdlyUwc+lUBI7AAjkfv0/SgU2F4wYnvIqnV5M7EloqgX
	qVKabgbQuq8K3z1wdB5IW8HMHh6HIbsaesS+xtV25Smc0s9J+j+rtcfKrYuQaSqB
	/p8I5F0uSEjcDDTILKKsNz6ekDciqVUtJNxb3yhalTQ/8Mau5TuKnmcqGLKQ0nVe
	9oQr+h9VQNMyaWkdB/xHyVRdIc8aVFBnsWhpBrIyML5f1s8Q7p1fPbkMYWtBfESp
	5z06hHeTBAi0KXVg==
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1922ade (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
	Wed, 25 Mar 2020 02:12:00 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id d15so774821iog.3;
        Tue, 24 Mar 2020 19:19:11 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1CA6fHElZjFCYJgqts4DDSpD5hjeSM4oyHNhPpzZYcV6qM9HOf
	fEqV7bDlxE3RptCmfKlnZvBgrkqAXBrEtPkKK9c=
X-Google-Smtp-Source: ADFU+vvwOGCklOEhIQnOsr9Fj5UVpLPyUVnmm9k0T166ab693Bpijjx3ByBTq6ZoxjIiFhPxzXIiSsw4/d5++te/CDs=
X-Received: by 2002:a05:6638:3b7:: with SMTP id z23mr997328jap.108.1585102751262;
 Tue, 24 Mar 2020 19:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local> <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
In-Reply-To: <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Mar 2020 20:19:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9o5UDKtrOJ_ffg=0avSx4poOpjbDS+rN2uZ3EBtv7_Miw@mail.gmail.com>
Message-ID: <CAHmME9o5UDKtrOJ_ffg=0avSx4poOpjbDS+rN2uZ3EBtv7_Miw@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

I induced a crash:

$ b4 am -c 20200324153624.23109-1-jiaxun.yang@flygoat.com
Looking up https://lore.kernel.org/r/20200324153624.23109-1-jiaxun.yang@flygoat.com
Grabbing thread from lore.kernel.org
Reduced thread to strict matches only (138->107)
Checking for newer revisions on https://lore.kernel.org/linux-devicetree/
Analyzing 107 messages in the thread
Found new series v1
Found new series v2
Traceback (most recent call last):
 File "/usr/lib/python-exec/python3.6/b4", line 11, in <module>
   load_entry_point('b4==0.3.4', 'console_scripts', 'b4')()
 File "/usr/lib64/python3.6/site-packages/b4/command.py", line 134, in cmd
   cmdargs.func(cmdargs)
 File "/usr/lib64/python3.6/site-packages/b4/command.py", line 40, in cmd_am
   b4.mbox.main(cmdargs)
 File "/usr/lib64/python3.6/site-packages/b4/mbox.py", line 407, in main
   mbox_to_am(threadmbox, config, cmdargs)
 File "/usr/lib64/python3.6/site-packages/b4/mbox.py", line 114, in mbox_to_am
   lmbx.add_message(msg)
 File "/usr/lib64/python3.6/site-packages/b4/__init__.py", line 232,
in add_message
   lmsg = LoreMessage(msg)
 File "/usr/lib64/python3.6/site-packages/b4/__init__.py", line 572, in __init__
   if diffstatre.search(self.body):
TypeError: expected string or bytes-like object

However, starting from other message IDs works:

zx2c4@thinkpad ~/Projects/wireguard-tools $ b4 am -c
https://lore.kernel.org/lkml/20190905144316.12527-1-jiaxun.yang@flygoat.com/
Looking up https://lore.kernel.org/r/20190905144316.12527-1-jiaxun.yang@flygoat.com
Grabbing thread from lore.kernel.org
Reduced thread to strict matches only (138->100)
Checking for newer revisions on https://lore.kernel.org/lkml/
Analyzing 100 messages in the thread
Found new series v1
Found new series v3
Found new series v6
Will use the latest revision: v6
You can pick other revisions using the -vN flag
---
Writing ./v6_20200324_jiaxun_yang_modernize_loongson64_machine_v6.mbx
 [PATCH v6 01/11] irqchip: Add driver for Loongson I/O Local Interrupt
Controller
 [PATCH v6 02/11] irqchip: loongson-liointc: Workaround LPC IRQ Errata
 [PATCH v6 03/11] dt-bindings: interrupt-controller: Add Loongson LIOINTC
 [PATCH v6 04/11] irqchip: Add driver for Loongson-3 HyperTransport
PIC controller
 [PATCH v6 05/11] dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
 [PATCH v6 06/11] irqchip: mips-cpu: Convert to simple domain
 [PATCH v6 07/11] MIPS: Loongson64: Drop legacy IRQ code
 [PATCH v6 08/11] dt-bindings: mips: Add loongson boards
 [PATCH v6 09/11] MIPS: Loongson64: Add generic dts
 [PATCH v6 10/11] MIPS: Loongson64: Load built-in dtbs
 [PATCH v6 11/11] MIPS: Loongson64: Move MIPS_CPU_IRQ_BASE
---
Total patches: 11
---
NOTE: Some trailers were sent to the cover letter:
     Reviewed-by: Marc Zyngier <maz@kernel.org>
NOTE: Rerun with -t to apply them to all patches
---
Cover: ./v6_20200324_jiaxun_yang_modernize_loongson64_machine_v6.cover
Link: https://lore.kernel.org/r/20200324153624.23109-1-jiaxun.yang@flygoat.com
Base: not found, sorry
      git checkout -b v6_20200324_jiaxun_yang_flygoat_com master
      git am ./v6_20200324_jiaxun_yang_modernize_loongson64_machine_v6.mbx
