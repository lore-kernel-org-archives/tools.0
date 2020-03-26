Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by mx.groups.io with SMTP id smtpd.web11.5240.1585253919966590101
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 13:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zx2c4.com header.s=mail header.b=Jvwj/Xlt;
 spf=pass (domain: zx2c4.com, ip: 192.95.5.64, mailfrom: jason@zx2c4.com)
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8524332;
	Thu, 26 Mar 2020 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=xHgsXscwBr8HjT2Cg79d6qgFcfE=; b=Jvwj/X
	ltK9HyC/+2p4UpbE68+ISXhuxWpLP50wMVXYEmnW5hXhd61s+CchWWEBw14vKS6X
	i1XUK+hu+FXzZvXNXUZHqS2LdyScH9XgejrjFXFAPzPPeWi2zLYdP2tjDrmnPt9H
	HdYvvo49OXw1hG4RP234MH3sQ1ZihQUdWe/W3PZOY7WwccH9wgGvLrMj8VwlrbqR
	q9srCECvSq9AN3vdYx8QC4RijEQ50kFDMhWFRe5OzRSSJ0jT/Q6IKPj+v1BinNLT
	p3iB0D2XXexKeOc9OswIYtuJieA/S5CtAv15k7OZBqk9d4/AIeAVn/5p73QCLdnJ
	UX8zwAREDy/ezroA==
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b4b2af8 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
	Thu, 26 Mar 2020 20:11:13 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y24so7483788ioa.8;
        Thu, 26 Mar 2020 13:18:38 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3jUQLN2KoqBv3fsij25Rwe8Xq8lHxow4WHmwUMQlqcyHvbLfrs
	SgZHmt9nmo89sErYxxs24Ll2/YXONsQ/2dgjod8=
X-Google-Smtp-Source: ADFU+vs7m/QYcdvtXDIWcS/JOwooXJqJPhS+KeA/d3NhUzbl2aJyQMof+0Xs01tiF6pUq8GCP9CPcDbwNlJ9VSgXnZY=
X-Received: by 2002:a5e:df4b:: with SMTP id g11mr9423692ioq.29.1585253917948;
 Thu, 26 Mar 2020 13:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
 <15FFE6D3B979AF4C.32445@linux.kernel.org> <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
In-Reply-To: <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Mar 2020 14:18:26 -0600
X-Gmail-Original-Message-ID: <CAHmME9oP4epS5UvrrnvLDcSEZAHXgrrGHkbZ7ddryKO56KFosg@mail.gmail.com>
Message-ID: <CAHmME9oP4epS5UvrrnvLDcSEZAHXgrrGHkbZ7ddryKO56KFosg@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looks like the auto project detection has issues:

zx2c4@thinkpad ~/Projects/linux $ b4 am -c
20200326080104.27286-16-masahiroy@kernel.org
Looking up https://lore.kernel.org/r/20200326080104.27286-16-masahiroy@kernel.org
Grabbing thread from lore.kernel.org
Reduced thread to strict matches only (12->11)
Checking for newer revisions on https://lore.kernel.org/linux-crypto/
Analyzing 11 messages in the thread
---
Writing ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.mbx
 ERROR: missing [1/16]!
 ERROR: missing [2/16]!
 ERROR: missing [3/16]!
 ERROR: missing [4/16]!
 ERROR: missing [5/16]!
 [PATCH v2 06/16] x86: remove always-defined CONFIG_AS_SSSE3
 [PATCH v2 07/16] x86: remove always-defined CONFIG_AS_AVX
 ERROR: missing [8/16]!
 ERROR: missing [9/16]!
 ERROR: missing [10/16]!
 ERROR: missing [11/16]!
 [PATCH v2 12/16] crypto: x86 - rework configuration based on Kconfig
 ERROR: missing [13/16]!
 ERROR: missing [14/16]!
 [PATCH v2 15/16] x86: update AS_* macros to binutils >=2.23,
supporting ADX and AVX2
 [PATCH v2 16/16] crypto: x86 - clean up poly1305-x86_64-cryptogams.S
by 'make clean'
---
Total patches: 5
---
NOTE: Some trailers were sent to the cover letter:
     Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
     Acked-by: Ingo Molnar <mingo@kernel.org>
NOTE: Rerun with -t to apply them to all patches
---
WARNING: Thread incomplete!
Cover: ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.cover
Link: https://lore.kernel.org/r/20200326080104.27286-1-masahiroy@kernel.org
Base: not found, sorry
      git checkout -b v2_20200326_masahiroy_kernel_org master
      git am ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.mbx
zx2c4@thinkpad ~/Projects/linux $ b4 am -p linux-kernel -c
20200326080104.27286-16-masahiroy@kernel.org
Looking up https://lore.kernel.org/r/20200326080104.27286-16-masahiroy@kernel.org
Grabbing thread from lore.kernel.org
Server returned an error: 404
zx2c4@thinkpad ~/Projects/linux $ b4 am -p lkml -c
20200326080104.27286-16-masahiroy@kernel.org
Looking up https://lore.kernel.org/r/20200326080104.27286-16-masahiroy@kernel.org
Grabbing thread from lore.kernel.org
Checking for newer revisions on https://lore.kernel.org/lkml/
Analyzing 27 messages in the thread
---
Writing ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.mbx
 [PATCH v2 01/16] lib/raid6/test: fix build on distros whose /bin/sh is not bash
 [PATCH v2 02/16] x86: remove unneeded defined(__ASSEMBLY__) check
from asm/dwarf2.h
 [PATCH v2 03/16] x86: remove always-defined CONFIG_AS_CFI
 [PATCH v2 04/16] x86: remove unneeded (CONFIG_AS_)CFI_SIGNAL_FRAME
 [PATCH v2 05/16] x86: remove always-defined CONFIG_AS_CFI_SECTIONS
 [PATCH v2 06/16] x86: remove always-defined CONFIG_AS_SSSE3
 [PATCH v2 07/16] x86: remove always-defined CONFIG_AS_AVX
 [PATCH v2 08/16] x86: replace arch macros from compiler with CONFIG_X86_{32,64}
 [PATCH v2 09/16] drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
 [PATCH v2 10/16] x86: probe assembler capabilities via kconfig
instead of makefile
   + Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
 [PATCH v2 11/16] x86: add comments about the binutils version to
support code in as-instr
   + Acked-by: Nick Desaulniers <ndesaulniers@google.com>
 [PATCH v2 12/16] crypto: x86 - rework configuration based on Kconfig
 [PATCH v2 13/16] crypto: curve25519 - do not pollute dispatcher based
on assembler
 [PATCH v2 14/16] Documentation/changes: Raise minimum supported
binutils version to 2.23
 [PATCH v2 15/16] x86: update AS_* macros to binutils >=2.23,
supporting ADX and AVX2
 [PATCH v2 16/16] crypto: x86 - clean up poly1305-x86_64-cryptogams.S
by 'make clean'
---
Total patches: 16
---
NOTE: Some trailers were sent to the cover letter:
     Acked-by: Ingo Molnar <mingo@kernel.org>
     Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
NOTE: Rerun with -t to apply them to all patches
---
Cover: ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.cover
Link: https://lore.kernel.org/r/20200326080104.27286-1-masahiroy@kernel.org
Base: not found, sorry
      git checkout -b v2_20200326_masahiroy_kernel_org master
      git am ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.mbx

(Also: lore still calls linux-kernel "lkml" which is a bit confusing.)
