Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B472
	for <tools@linux.kernel.org>; Mon, 17 May 2021 16:13:20 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id t20so5221765qtx.8
        for <tools@linux.kernel.org>; Mon, 17 May 2021 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KvhZqbHpE7RCfMbgAa1hexe3TCt7n1njgpKc2v7QkS0=;
        b=NR9qSEPi04Pspw+PZ1FHgzKxLg5lNEURgIYFVBAjA3PUt+D1Dd0TMY+kmJkXblDZva
         UBmH5ufitnSGkHVPCDAK7yreuX5HP4Y9Axni+1EICbQOC3XvPhkmasDjV+4HBA4X052J
         Kro6le9shmtl84eEwd+GZm4+fEr0BmWBWomJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KvhZqbHpE7RCfMbgAa1hexe3TCt7n1njgpKc2v7QkS0=;
        b=l845M1xXPUycB38A1CVriau2/V2Fi1ixNQve+Rl7pSmt+3y3OgEwNqbSiGx0cMO0dx
         Q7VuJsozn814xb6KPKkvOPIGU7P7q6MGHv9tM7T2ZDFwoGxTmjH2vj6kqaBcx5u99sv1
         P/BSFKO/yBtXzzLEHmMcRm4lbRrXQIaWcBt1Wk3yudR1vOQdZAud0D8N4kUy4dAjgSlm
         uXiXnPWGxindd32wHpjORNOH5CaTvg2ZleE3+szjJORvwx5aoCjjB+mz+LvsrUg2G0GE
         7Zqgh1iB8n5fQOHphNGeiJ8cT8GPivR4N0BgKuHRHEhZihB5v650dLb0oF+LUes2iDDe
         IWAQ==
X-Gm-Message-State: AOAM532DxFrEA084jPRnIbw3Fbug2FFX99Jb8v/eIounDSnNZlk/MWBh
	fTTnzlhl8TdlPjpVf9acjthGDw==
X-Google-Smtp-Source: ABdhPJyxs6PWSiV2DLHbG5VTXGfdt4Ld8ksDaNB1h+Ueg7EaoqWABWTbnZNWpCvrKFF3g9qOKfGy9A==
X-Received: by 2002:ac8:7c4b:: with SMTP id o11mr262607qtv.336.1621267999162;
        Mon, 17 May 2021 09:13:19 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id r16sm10906185qtx.36.2021.05.17.09.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 09:13:18 -0700 (PDT)
Date: Mon, 17 May 2021 12:13:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 am support for partial series updates?
Message-ID: <20210517161317.teawoh5qovxpmqdc@nitro.local>
References: <CAPcyv4ggbuHbqKV33_TpE7pqxvRag34baJrX3yQe-jXOikoATQ@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPcyv4ggbuHbqKV33_TpE7pqxvRag34baJrX3yQe-jXOikoATQ@mail.gmail.com>

On Fri, May 14, 2021 at 03:50:21PM -0700, Dan Williams wrote:
> I recently had someone grumble at me about my requirement that they
> repost a full series just so "b4 am" could autograb the full set even
> though only a handful of patches changed.
> 
> As an experiment I tried replying to a patch to update and marked it
> v5, but b4 am reports:
> 
> # b4 am 162096970332.1865304.10280028741091576940.stgit@dwillia2-desk3.amr.corp.intel.com
> ...
> Writing ./v5_20210514_dan_j_williams_cxl_acpi_introduce_acpi0017_driver_and_cxl_root.mbx
>   ERROR: missing [1/8]!
>   ERROR: missing [2/8]!
>   ERROR: missing [3/8]!
>   ERROR: missing [4/8]!
>   [PATCH v5 5/8] cxl/acpi: Introduce ACPI0017 driver and cxl_root
>   ERROR: missing [6/8]!
>   ERROR: missing [7/8]!
>   ERROR: missing [8/8]!
> 

Okay, the latest master will handle this situation:

    Looking up https://lore.kernel.org/r/162096970332.1865304.10280028741091576940.stgit%40dwillia2-desk3.amr.corp.intel.com
    Grabbing thread from lore.kernel.org/linux-acpi
    Analyzing 13 messages in the thread
    Partial reroll detected, reconstituting from v4
    Will use the latest revision: v5
    You can pick other revisions using the -vN flag
    ---
    Writing /tmp/v5_20210513_dan_j_williams_cxl_port_enumeration_and_plans_for_v5_14.mbx
    Checking attestation on all messages, may take a moment...
      [PATCH v4->v5 1/8] cxl/mem: Move some definitions to mem.h
      [PATCH v4->v5 2/8] cxl/mem: Introduce 'struct cxl_regs' for "composable" CXL devices
      [PATCH v4->v5 3/8] cxl/core: Rename bus.c to core.c
      [PATCH v4->v5 4/8] cxl/core: Refactor CXL register lookup for bridge reuse
      [PATCH     v5 5/8] cxl/acpi: Introduce ACPI0017 driver and cxl_root
      [PATCH v4->v5 6/8] cxl/Kconfig: Default drivers to CONFIG_CXL_BUS
      [PATCH     v5 7/8] cxl/port: Introduce cxl_port objects
      [PATCH v4->v5 8/8] cxl/acpi: Add module parameters to stand in for ACPI tables
    ---
    Total patches: 8
    ---
    WARNING: v5 is a partial reroll from previous revisions
             Please carefully review the resulting series to ensure correctness
             Pass --no-partial-reroll to disable

Best regards,
-K
