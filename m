Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32537291E
	for <tools@linux.kernel.org>; Wed, 13 Apr 2022 19:07:11 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g18so3968325wrb.10
        for <tools@linux.kernel.org>; Wed, 13 Apr 2022 12:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to
         :content-language:content-transfer-encoding;
        bh=YTjNfD5EHZFIWXw3QRCCZ8I8sKD/T6eXmDaarRIz4f0=;
        b=16k8feIBYncqhyCGgIcOrnSeGNzumolFxZGu9BhLaxfd7PMvQcmBRmpv9QMx7KrLp/
         /kyf9jJRFj9c7QXjbCoyozX46DEEs1zQIN4XayEHq1OnJsXpL6WtUtzhs8P9d/37GYdS
         UDoY+d2CKa3Wa2lAAVT3MLY3HFJTnH2THH2L3sg/dGAhMRLeHAiM7hXafo79DHhP5KZx
         OxtnvkvxtxR/b5DRWK7XeqsJ/gUlM+WpmbAMmYcobYhWoKzsb5VJpwU7VnvvrawXGhT5
         Sur7gTSEhvh53uE+Xm5AASSdQb/hQljZ4V3UyWb4pKf/ukB2nZbyeOo716EzWI/YjiZc
         nzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:content-language:content-transfer-encoding;
        bh=YTjNfD5EHZFIWXw3QRCCZ8I8sKD/T6eXmDaarRIz4f0=;
        b=YDHjBizcoVp83wq08g+D84cJ0IqdukZXXpZPlo11OWW6rKQeuQ/f/fICIM8EZngZwD
         JmTDhJqts1r4fg6XPD+hSJoJ9yNcbv/nkr25ZgE/BF+zt+/4jCUrq9u8YdQkiD4KiXFX
         9QIueKtiA40iCcTD0WiWkgmLlR8Vqu5MyWAYh86/Qj5Br277HJONC/NYzfV24ecu63tC
         Tggqsgd14ysD2tZVCu/tAf7TiQkJBLpC3qNJNWxvGkLlL0ynE1Uqe6/l+5FLpomRe6/U
         lcTPgjGc/K6nOIMyuObnIcM/xCXlNF74IZgpKAa0s+xHPHDEMuX6j9FYC5RzPUD+hjot
         USuQ==
X-Gm-Message-State: AOAM5312m7zHr6Sm6QIzI6VFIPJnqE2R5f2KFt6niBKwtX9i7tQRr59x
	UjA1QJtlyRLxUI7zE5KCt+BIdVeM5+THsySy
X-Google-Smtp-Source: ABdhPJzQFmrpx8Vi/TeSfobOVdb3rUb10ELLELmAtlA+MSpGoomT3b0JfUdBTKNskg5LapXbEbiibQ==
X-Received: by 2002:a05:6000:111:b0:207:ac77:3d07 with SMTP id o17-20020a056000011100b00207ac773d07mr264142wrx.136.1649876828431;
        Wed, 13 Apr 2022 12:07:08 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id w5-20020a7bc105000000b0038eb9932dacsm3004886wmi.48.2022.04.13.12.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 12:07:07 -0700 (PDT)
Message-ID: <cffe6d50-fa88-5873-a7cb-f646c57da91f@conchuod.ie>
Date: Wed, 13 Apr 2022 20:07:06 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Conor Dooley <mail@conchuod.ie>
Subject: [b4] previously passing dkim check is failing
To: konstantin.ryabitsev@linux.dev, tools@linux.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,
Not quite sure if this is the appropriate way to report/raise an
issue like this is for b4, but here goes :)

I had been using my os packaged version of b4, which was 0.6.2-1. It
clearly doesn't actually do DKIM verification for all patches, only
the replies for whatever reason and uses lists.infradead for checking
Krzysztof's mail - but it does also pass verification for my fixes tags:

b4 am e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org
Looking up
https://lore.kernel.org/r/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org
Grabbing thread from lore.kernel.org/all
Analyzing 22 messages in the thread
---
Writing ./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.mbx
  [PATCH v2 1/9] clk: microchip: mpfs: fix parents for FIC clocks
  [PATCH v2 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
  [PATCH v2 3/9] riscv: dts: microchip: fix usage of fic clocks on mpfs
  [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri registers
    + Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✓ DKIM/lists.infradead.org)
  [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
  [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
    + Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✓ DKIM/lists.infradead.org)
  [PATCH v2 7/9] clk: microchip: mpfs: re-parent the configurable clocks
  [PATCH v2 8/9] clk: microchip: mpfs: add RTCREF clock control
  [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
    + Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree") (✓ DKIM/microchiptechnology.onmicrosoft.com)
    + Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board") (✓ DKIM/microchiptechnology.onmicrosoft.com)
---
Total patches: 9
---
Cover: ./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.cover
 Link:
https://lore.kernel.org/r/20220411085916.941433-1-conor.dooley@microchip.com
 Base: not found (applies clean to current tree)
       git am
./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.mbx

I then upgraded my b4 to the latest master (0.9-dev-6f2aa), because
I am lazy & want to use shazaam. Between those commits, looks like
something has stopped b4 from selecting a passing url for my mail:

b4 am e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org
Looking up
https://lore.kernel.org/r/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org
Grabbing thread from
lore.kernel.org/all/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org/t.mbox.gz
Analyzing 22 messages in the thread
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v2 1/9] clk: microchip: mpfs: fix parents for FIC clocks
  ✗ [PATCH v2 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
  ✗ [PATCH v2 3/9] riscv: dts: microchip: fix usage of fic clocks on mpfs
  ✗ [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri registers
    + Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✓ DKIM/linaro.org)
  ✗ [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
  ✗ [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
    + Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✓ DKIM/linaro.org)
  ✗ [PATCH v2 7/9] clk: microchip: mpfs: re-parent the configurable clocks
  ✗ [PATCH v2 8/9] clk: microchip: mpfs: add RTCREF clock control
  ✗ [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
    + Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree") (✗ DKIM/microchip.com)
    + Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board") (✗ DKIM/microchip.com)
  ---
  ✗ BADSIG: DKIM/microchip.com
---
Total patches: 9
---
Cover: ./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.cover
 Link:
https://lore.kernel.org/r/20220411085916.941433-1-conor.dooley@microchip.com
 Base: not specified
       git am
./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.mbx

bisection appears to blame cbf792796cdf7124d91f549e8f65f7da8a10d2e7 for
the problem:
git bisect start
# bad: [6f2aa2f449e272353fa95d9e1509c61a0a19aa0b] Add support for
mailmap and excluding mail in b4-ty
git bisect bad 6f2aa2f449e272353fa95d9e1509c61a0a19aa0b
# good: [27f1ca8ce3e64c434503f15b93d56f6d2fc87495] Prepare 0.6.2 release
git bisect good 27f1ca8ce3e64c434503f15b93d56f6d2fc87495
# good: [0369d53cf093aab6f69a0725ce21b0e05b4ed9b9] Update version to
0.6.1 as hotfix
git bisect good 0369d53cf093aab6f69a0725ce21b0e05b4ed9b9
# bad: [f18c747df8a5ad69d56eb420f431ac2ac9a07acd] Update to newer patatt version
git bisect bad f18c747df8a5ad69d56eb420f431ac2ac9a07acd
# bad: [f6f46cd221e35bf80d3b7c24ec4b4d799446399f] Implement partial reroll
git bisect bad f6f46cd221e35bf80d3b7c24ec4b4d799446399f
# good: [f1a2700e70018349d5c63f2053ba4b0e7ebe351a] Reimplement attestation code one more time
git bisect good f1a2700e70018349d5c63f2053ba4b0e7ebe351a
# bad: [e7ceda03356acc9579b50d745e6ab8120cdb677d] Force datetime to UTC if it's native
git bisect bad e7ceda03356acc9579b50d745e6ab8120cdb677d
# bad: [28bf91d1b24767d9b5de48f3611ee9c9f050c395] Fix for DKIM signatures without t= field
git bisect bad 28bf91d1b24767d9b5de48f3611ee9c9f050c395
# good: [41f0167aa3eccff64a543d2adae4e9c7be64a7d5] Python 3.6 compatibility fixes
git bisect good 41f0167aa3eccff64a543d2adae4e9c7be64a7d5
# bad: [cbf792796cdf7124d91f549e8f65f7da8a10d2e7] Reimplement attestation-staleness-days
git bisect bad cbf792796cdf7124d91f549e8f65f7da8a10d2e7
# first bad commit: [cbf792796cdf7124d91f549e8f65f7da8a10d2e7]
Reimplement attestation-staleness-days

I (blindly) reverted that commit and it seems to work for both myself
and Krzysztof, although the per patch stuff is now not running:

b4 am e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org
Looking up
https://lore.kernel.org/r/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org
Grabbing thread from
lore.kernel.org/all/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org/t.mbox.gz
Analyzing 22 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v2 1/9] clk: microchip: mpfs: fix parents for FIC clocks
  [PATCH v2 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
  [PATCH v2 3/9] riscv: dts: microchip: fix usage of fic clocks on mpfs
  [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri registers
    + Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✓ DKIM/linaro.org)
  [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
  [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
    + Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✓ DKIM/linaro.org)
  [PATCH v2 7/9] clk: microchip: mpfs: re-parent the configurable clocks
  [PATCH v2 8/9] clk: microchip: mpfs: add RTCREF clock control
  [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
    + Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree") (✓ DKIM/microchiptechnology.onmicrosoft.com)
    + Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board") (✓ DKIM/microchiptechnology.onmicrosoft.com)
---
Total patches: 9
---
Cover: ./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.cover
 Link:
https://lore.kernel.org/r/20220411085916.941433-1-conor.dooley@microchip.com
 Base: not specified
       git am
./v2_20220411_conor_dooley_more_polarfire_soc_fixes_for_5_18.mbx

Hopefully this is something useful to you & not me misinterpreting
a new feature that you have added!

Thanks,
Conor.



