Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A99570
	for <tools@linux.kernel.org>; Mon, 17 May 2021 17:11:19 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id w12so79934edx.1
        for <tools@linux.kernel.org>; Mon, 17 May 2021 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PEXJf5Rwgx/QcJEXH8aKH6kGVr7ZCAU/l1JBcvmhzts=;
        b=1ECYW9T/2BUFMhbKiOwVgfPjeL/pPO5DX+ugjCg3gNKc/XosDu8HOCFFSuVQClbTIb
         I2ZD1dxcsF1K+kKIEkoy4n1Y7sQxJkJjwLEn5gopUR8AoRR3vnp5V9v0RPlBeoCiRQaY
         oKzEXRafpGCg9sT2izShAsdNDHxS1fZoRhUeIqL+s5a+QnqNGGOATi9PZJlOoNADHes7
         NRBpognmRGCNFxvrQGULXvMfUI/CYZyEEJ9ERDgn99pP6kzaxUSap576dah4as23oYwC
         JAJlmi9Dt7ktgEkFAwaq+YIMNkmw8jPLARTUYIyNxhXuWaRqDRz43m/0qKkOFABL2FOx
         l3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEXJf5Rwgx/QcJEXH8aKH6kGVr7ZCAU/l1JBcvmhzts=;
        b=RWmlWuu6Jf37g8WTNlUp2nzhKxPTqPyROo9XbPq3IaT7W6s08OdYBL7+k+tudZ4z2i
         26z5ibkTu4O3dacmwbkwQjL1RbV53Lao0drOnbw/u01r4H5NEPmW8s+RYfdh8UuZXgNz
         7oSD2VFK9IqjfALDhkrUoUyws3n+y3nuCvSTcSIBm4lTlPJymaTIahDxcwZ0TLBiCt2z
         EWCF3voDRT+x9I3U8QdbwIW6E6HkL7AkGM7kQ6vOOgVOCMeH4O9/UJa4XYxo5/MKFCU8
         A+iBqLbxEn12GxM/ztjR3NcU1fF31Um1WKxtlfidNQatrPmbsjCFuAjmiQijla2eOFeG
         3UPQ==
X-Gm-Message-State: AOAM533h4Vhg4cK3//mkhP0wDXucGdFD35iL7EGLav60RSHyUc7q59fu
	xmbOL/Dc86Kk4jCSy6WubA0NkxsPfJzM/6V6rhyC2w==
X-Google-Smtp-Source: ABdhPJzwPchOC/QrsCIwxsReIYjwvxqAoLcN2HXu1L7ybfexgfS7VOVhctJubl7A0KUoI4zmKj6rM5N05CTpAdumIwU=
X-Received: by 2002:a50:fe8e:: with SMTP id d14mr1264094edt.97.1621271477582;
 Mon, 17 May 2021 10:11:17 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAPcyv4ggbuHbqKV33_TpE7pqxvRag34baJrX3yQe-jXOikoATQ@mail.gmail.com>
 <20210517161317.teawoh5qovxpmqdc@nitro.local>
In-Reply-To: <20210517161317.teawoh5qovxpmqdc@nitro.local>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 May 2021 10:11:06 -0700
Message-ID: <CAPcyv4hBp5R6ewJKm3_8zVeKPShBCfbCrxnmVQhvDu9qC9NAAg@mail.gmail.com>
Subject: Re: b4 am support for partial series updates?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, May 17, 2021 at 9:13 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, May 14, 2021 at 03:50:21PM -0700, Dan Williams wrote:
> > I recently had someone grumble at me about my requirement that they
> > repost a full series just so "b4 am" could autograb the full set even
> > though only a handful of patches changed.
> >
> > As an experiment I tried replying to a patch to update and marked it
> > v5, but b4 am reports:
> >
> > # b4 am 162096970332.1865304.10280028741091576940.stgit@dwillia2-desk3.amr.corp.intel.com
> > ...
> > Writing ./v5_20210514_dan_j_williams_cxl_acpi_introduce_acpi0017_driver_and_cxl_root.mbx
> >   ERROR: missing [1/8]!
> >   ERROR: missing [2/8]!
> >   ERROR: missing [3/8]!
> >   ERROR: missing [4/8]!
> >   [PATCH v5 5/8] cxl/acpi: Introduce ACPI0017 driver and cxl_root
> >   ERROR: missing [6/8]!
> >   ERROR: missing [7/8]!
> >   ERROR: missing [8/8]!
> >
>
> Okay, the latest master will handle this situation:
>
>     Looking up https://lore.kernel.org/r/162096970332.1865304.10280028741091576940.stgit%40dwillia2-desk3.amr.corp.intel.com
>     Grabbing thread from lore.kernel.org/linux-acpi
>     Analyzing 13 messages in the thread
>     Partial reroll detected, reconstituting from v4
>     Will use the latest revision: v5
>     You can pick other revisions using the -vN flag
>     ---
>     Writing /tmp/v5_20210513_dan_j_williams_cxl_port_enumeration_and_plans_for_v5_14.mbx
>     Checking attestation on all messages, may take a moment...
>       [PATCH v4->v5 1/8] cxl/mem: Move some definitions to mem.h
>       [PATCH v4->v5 2/8] cxl/mem: Introduce 'struct cxl_regs' for "composable" CXL devices
>       [PATCH v4->v5 3/8] cxl/core: Rename bus.c to core.c
>       [PATCH v4->v5 4/8] cxl/core: Refactor CXL register lookup for bridge reuse
>       [PATCH     v5 5/8] cxl/acpi: Introduce ACPI0017 driver and cxl_root
>       [PATCH v4->v5 6/8] cxl/Kconfig: Default drivers to CONFIG_CXL_BUS
>       [PATCH     v5 7/8] cxl/port: Introduce cxl_port objects
>       [PATCH v4->v5 8/8] cxl/acpi: Add module parameters to stand in for ACPI tables
>     ---
>     Total patches: 8
>     ---
>     WARNING: v5 is a partial reroll from previous revisions
>              Please carefully review the resulting series to ensure correctness
>              Pass --no-partial-reroll to disable

Thank you, much appreciated!
