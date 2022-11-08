Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D404182;
	Tue,  8 Nov 2022 11:09:13 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id z30so8816578qkz.13;
        Tue, 08 Nov 2022 03:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpvAbuZxq5VJZiEQ5OE+F5auxXpM+jCT8nNefkcfr9s=;
        b=IGaLmO0Z352ljW5r8SxTxv8AjJU52qkom1QtoUATcT0g7b9ffFSERwZXUnnD2SByeS
         c/ayIMEz2wsnBO76l3AqE0xCwTqtxKt0XnGGYPbJsuymIVzKkM+x2LKls5+TqAbQ7zRb
         08yn8d84mZx4L/DSxWieAP32To3XO1Gx+VVO2Yhl1E19AVfjimZw242kV9x14HxYxh8m
         3VABC67rFblW5rqm6/IcSfnEL7IETvJSIwKyvDmJv0dRvScvrYvO/AblqTqLhH0q/mDZ
         C3l218dJl7w3bYuR25PpOP+vvYXqHYy/8u2n4eAqWzNBTXge6u8f+e4eP1hh720/5260
         nN4g==
X-Gm-Message-State: ACrzQf1+L/U0WsB3SIwa/C3W2Su9dZUFgH+xAEOgfOvMuopV1U+djias
	vYWrFKiMpiezoMEZEYfUIAaBPvq0spA2bw==
X-Google-Smtp-Source: AMsMyM5surQ6u8d2C6RckOWeCs1v5y/ExFfsKcmyBoaOIw1UT/35HhZtJV72NYouMS8vzQNU2Esg5w==
X-Received: by 2002:a05:620a:909:b0:6fa:1031:33a5 with SMTP id v9-20020a05620a090900b006fa103133a5mr38475139qkv.496.1667905751810;
        Tue, 08 Nov 2022 03:09:11 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id n8-20020ac85a08000000b0039492d503cdsm8164496qta.51.2022.11.08.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:09:11 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-367b8adf788so130483587b3.2;
        Tue, 08 Nov 2022 03:09:11 -0800 (PST)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr51945425ywa.384.1667905750934;
 Tue, 08 Nov 2022 03:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 12:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNMCEFgPXva3zL9GW7JO=J-kTHxR8mBafnjLavyDD5Dw@mail.gmail.com>
Message-ID: <CAMuHMdUNMCEFgPXva3zL9GW7JO=J-kTHxR8mBafnjLavyDD5Dw@mail.gmail.com>
Subject: Multiple independent patches sent in one series
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

I've ryn into a new oddity:

    $ b4 am 20221107172953.63218-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Grabbing thread from
lore.kernel.org/all/20221107172953.63218-1-prabhakar.mahadev-lad.rj%40bp.re=
nesas.com/t.mbox.gz
    Analyzing 2 messages in the thread
    Assuming new revision: v2 ([PATCH] arm64: dts: renesas: r9a07g054:
Drop #address-cells from pinctrl node)
    Will use the latest revision: v2
    You can pick other revisions using the -vN flag
    Checking attestation on all messages, may take a moment...
    ---
      =E2=9C=93 [PATCH] arm64: dts: renesas: r9a07g054: Drop #address-cells
from pinctrl node
      ---
      =E2=9C=93 Signed: DKIM/gmail.com
    ---
    Total patches: 1
    ---
     Link: https://lore.kernel.org/r/20221107172953.63218-2-prabhakar.mahad=
ev-lad.rj@bp.renesas.com
     Base: not specified
           git am
./v2_20221107_prabhakar_csengg_arm64_dts_renesas_r9a07g054_drop_address_cel=
ls_from_pinctrl_node.mbx
    $ b4 am 20221107172953.63218-2-prabhakar.mahadev-lad.rj@bp.renesas.com
    Grabbing thread from
lore.kernel.org/all/20221107172953.63218-2-prabhakar.mahadev-lad.rj%40bp.re=
nesas.com/t.mbox.gz
    Analyzing 2 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      =E2=9C=93 [PATCH] arm64: dts: renesas: r9a07g054: Drop #address-cells
from pinctrl node
      ---
      =E2=9C=93 Signed: DKIM/gmail.com
    ---
    Total patches: 1
    ---
     Link: https://lore.kernel.org/r/20221107172953.63218-2-prabhakar.mahad=
ev-lad.rj@bp.renesas.com
     Base: not specified
           git am
./20221107_prabhakar_csengg_arm64_dts_renesas_r9a07g054_drop_address_cells_=
from_pinctrl_node.mbx

Running "git am -s *mbx" fails with a conflict, as the bogus v2 mbox
contains the same patch (the second).
As I first thought I did something wrong, I removed both mbox files,
and retried:

    $ b4 am 20221107172953.63218-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Analyzing 2 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      =E2=9C=93 [PATCH] arm64: dts: renesas: r9a07g054: Drop #address-cells
from pinctrl node
      ---
      =E2=9C=93 Signed: DKIM/gmail.com
    ---
    Total patches: 1
    ---
     Link: https://lore.kernel.org/r/20221107172953.63218-2-prabhakar.mahad=
ev-lad.rj@bp.renesas.com
     Base: not specified
           git am
./20221107_prabhakar_csengg_arm64_dts_renesas_r9a07g054_drop_address_cells_=
from_pinctrl_node.mbx
    $ b4 am 20221107172953.63218-2-prabhakar.mahadev-lad.rj@bp.renesas.com
    Analyzing 2 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      =E2=9C=93 [PATCH] arm64: dts: renesas: r9a07g054: Drop #address-cells
from pinctrl node
      ---
      =E2=9C=93 Signed: DKIM/gmail.com
    ---
    Total patches: 1
    ---
     Link: https://lore.kernel.org/r/20221107172953.63218-2-prabhakar.mahad=
ev-lad.rj@bp.renesas.com
     Base: not specified
           git am
./20221107_prabhakar_csengg_arm64_dts_renesas_r9a07g054_drop_address_cells_=
from_pinctrl_node.mbx

Now I end up with a single mbox, containing only the second patch?

Explicitly requesting the first one fails:

    $ b4 am 20221107172953.63218-1-prabhakar.mahadev-lad.rj@bp.renesas.com =
-P_
    Analyzing 2 messages in the thread
    Specified msgid is not present in the series, cannot cherrypick

The issue seems to be that both patches were intended to be independent,
but were sent as a single series, or created in a single "git
format-patch" run (cfr. In-Reply-To in the second email), without "[PATCH
n/m]" sequence numbers.  Which does not sound that unusual to me...

Using "b4 mbox" does give me an mbox with both patches, so I'm happy ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
