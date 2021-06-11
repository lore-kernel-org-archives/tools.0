Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B00670;
	Fri, 11 Jun 2021 11:55:41 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id z13so2461400uai.12;
        Fri, 11 Jun 2021 04:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=epawBApMHZO0P4MLwG7Gx/DDqXFyyJq3M9xaoGVvX8w=;
        b=n0wc/gJkwH4X8G3GD+nppR3v0btT8Db/jjWgza+cnTLAk2BB17rhSG0NixfAG6V7uh
         zotQOncl2MkgymLhXn7Klu0bztzNtGIM2k04KaH6G1lNyU94Z6baI7JUwJQTmYykIJs2
         WomXA4pDsHweTUfzpgumGI6xO3u525r/ORQZBO8rcIXAD4wS/RcHkZ6qCg8XLHAQis1q
         JviFzConfHcSPld9YDlvqtlv4CvHjOgodkDV3HhmjpntJRPHRYNX65n0L6Hq8ztVNTLl
         1IL7SzsZD2Gcez+pETNSmjP7/xGjaOvsP6gYGZ2llve1uBCReWA1EyHrppLWjWnLSFqv
         HuJQ==
X-Gm-Message-State: AOAM533vz2HgPTb28GIEdaxee7c3ib94RZvJKGpGwb5cDtGUUK56vsAy
	82erGIsYFhx32dPnF2hXJfFsD30C16G5Ek1AZhB/yfz6JMsVmQ==
X-Google-Smtp-Source: ABdhPJzsxCYgO2jKNoQInLNj/+XKXT3zriFpYBpjB/gf/VN+iziGE0LpLHV/z5AKetx1Ye0kWbDTQJZ0AJvDYWcOjJM=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr2488045ual.4.1623412540609;
 Fri, 11 Jun 2021 04:55:40 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Jun 2021 13:55:29 +0200
Message-ID: <CAMuHMdWakx2RcL4W_cmUh8s3NYp3darGmrVu11Hq2-sY0GqUPg@mail.gmail.com>
Subject: Multi-patch series broken in b4 master
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

Commit c2e1aa9cbbf3d89a ("Save exploded pull requests as maildirs
as well") broke patch series containing more than one patch, as the
resulting .mbx file no longer has the needed separators between emails.

I first noticed when using formail and checkpatch:

    $ cat *mbx | formail -s scripts/checkpatch.pl
    WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
    #28:
    new file mode 100644

    WARNING: DT binding docs and includes should be a separate patch.
See: Documentation/devicetree/bindings/submitting-patches.rst

    WARNING: email address 'linux-clk@vger.kernel.org,
devicetree@vger.kernel.org' might be better as
'linux-clk@vger.kernel.org devicetree@vger.kernel.org'
    #131:
    To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org

    WARNING: Unexpected content after email:
'linux-clk@vger.kernel.org, devicetree@vger.kernel.org', should be:
'linux-clk@vger.kernel.org (devicetree@vger.kernel.org)'
    #131:
    To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org

    WARNING: Duplicate signature
    #144:
    Signed-off-by: Daniel Mack <daniel@zonque.org>
    [...]

But apparently "git am" has issues with the .mbx file, too:

b4 master:

    $ b4 am 20210519201551.690654-1-daniel@zonque.org
    Looking up https://lore.kernel.org/r/20210519201551.690654-1-daniel%40zonque.org
    Analyzing 7 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      [PATCH v2 1/3] dt-bindings: clock: convert cs2000-cp bindings to yaml
        + Reviewed-by: Rob Herring <robh@kernel.org>
      [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document aux-output-source
        + Reviewed-by: Rob Herring <robh@kernel.org>
      [PATCH v2 3/3] clk: cs2000-cp: Make aux output function controllable
    ---
    Total patches: 3
    ---
    Cover: ./v2_20210519_daniel_clk_cs2000_cp_make_aux_output_pin_configurable.cover
     Link: https://lore.kernel.org/r/20210519201551.690654-1-daniel@zonque.org
     Base: not found (applies clean to current tree)
           git am
./v2_20210519_daniel_clk_cs2000_cp_make_aux_output_pin_configurable.mbx
    $ git am -s *mbx
    Applying: dt-bindings: clock: convert cs2000-cp bindings to yaml

And the single commit contains the changes of all 3 patches.

b4 v0.7.2:

    $ b4 am 20210519201551.690654-1-daniel@zonque.org
    Looking up https://lore.kernel.org/r/20210519201551.690654-1-daniel%40zonque.org
    Analyzing 7 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      [PATCH v2 1/3] dt-bindings: clock: convert cs2000-cp bindings to yaml
        + Reviewed-by: Rob Herring <robh@kernel.org>
      [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document aux-output-source
        + Reviewed-by: Rob Herring <robh@kernel.org>
      [PATCH v2 3/3] clk: cs2000-cp: Make aux output function controllable
    ---
    Total patches: 3
    ---
    Cover: ./v2_20210519_daniel_clk_cs2000_cp_make_aux_output_pin_configurable.cover
     Link: https://lore.kernel.org/r/20210519201551.690654-1-daniel@zonque.org
     Base: not found (applies clean to current tree)
           git am
./v2_20210519_daniel_clk_cs2000_cp_make_aux_output_pin_configurable.mbx
    $ git am -s *mbx
    Applying: dt-bindings: clock: convert cs2000-cp bindings to yaml
    Applying: dt-bindings: clock: cs2000-cp: Document aux-output-source
    Applying: clk: cs2000-cp: Make aux output function controllable

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
