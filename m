Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346D2101AE;
	Thu, 24 Apr 2025 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486950; cv=none; b=A4BQ2bzAsi0AD3rLlsiRtoziXs22QNztllZkTOc8pH9DiZIsa9vtajkP021FEERDT7Qv8a3mfvo9h+MTg1lKz5FcJDsZQuRzCGwn174qML5tg0ypQXrxLzltdTD7/6tK8GU/InS7SDgXvOhjZSx26Ayz8Ji78vjj3oi5GBbkOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486950; c=relaxed/simple;
	bh=xGDW4SDUTpDVl0jTO0OQ75d1rAduqqdr+q/JQrNvfvs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=J5Oj/hEUij+9lnTxANgsJsiGNEL9nIfD8aMxpWEbJa/4FsgtxAdEfTN5LmhtjBGlKf1OQw0rRGHz7P5jtEbVUhuKf5MU7xtoKVQRMfNjad3GutXBevoyqmtUg7DGI7PJRIG0zu/hoY0ujGWDVEIYtWsmPIovkh02L+pfTNQv0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-527a2b89a11so378683e0c.2;
        Thu, 24 Apr 2025 02:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486947; x=1746091747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9x6JPvt0KbUWIDOSDKqWy3GPWt2kPtt11ySiwqWnK0=;
        b=PGzhI1bpeAJiZzIMnEfGzG3Ks6NybnWLRWxrCBY6MF9dF//LZZVjXLygiizhN46wig
         C8XWl+krB3w+ag/KZlWseNM+KVCYjOAeculOZ4ucSxwBOS1w/5Tn+7NFNsu4m9oI2j1W
         gswLo9r0P4d/c64Wdj8Q4xm9pvIdweAvfbcdV4UbkVlb/sSYUK85VQLfsB/4CUinIfue
         2fWPmqdUkytGrVBT/1HKdnzku5xIwdq8DAosSVN7xStbTq+g8clweD9wZPBUZYICQRS6
         A7PC2eEBgDKVi7M7HMyg0aAxkskfcibmMsWhxsZ2G1OG/nZpwVmtwvqtED9H/yET9fE+
         QLKg==
X-Forwarded-Encrypted: i=1; AJvYcCVkvkiaV3p4PMKA4yFOGIW98/c94MozsENKPt+y/rGkZH+4hJuXOMOHLUC+mmUJzeR4rv7zHA==@linux.kernel.org
X-Gm-Message-State: AOJu0YzyLW0EZAF0Q+XD1sBvZdqy7nbSJZfn0nCtD/+5MoeDg7pCT0rr
	Ha9TB2cjduUsCt2a6Dg3/pD9u3sl57HczOeEm+WYHRTvLXMU9GkI4DFa7ZX7
X-Gm-Gg: ASbGncuOK/BmLFOUpdKGNMruqB9pa+FAV277pZrJYi084XJ1nKo505Oda5gxvtBgEgZ
	v9ioXpnY//CmsdQeXMTe+v5VyYia4Uo8L9eq1e7RGz/lCHonVrr1MnsOyz5IrU7x2yAD/XBush2
	dozQZCrtBub1A57OeK+qTcm9hDlj9cDM0lh2zvcgx30uY8HaCZonNtWHM+72HDUHs2zgDKz8731
	Yiomh0Oc23203x5jCwCXbWfuAOVox7M4GTxGoNHmiPUeYBuxWr+MpbcYd32K1qAvGz2VRJRmqfZ
	JUGmtE5I1rQFA1U81Xroc0oU2hYHdkvjtw8C/9Hf+lMbvtksumNCdENvrKNx0VeJ6+/rKsFj8dX
	vJ2c=
X-Google-Smtp-Source: AGHT+IFXFUllix4B4SOsDYNk6BwT9dJfgXdu4YWFH7HsJNEYTXb/5urPqbAPNR5YvAKh4DLg1d7HEg==
X-Received: by 2002:a05:6122:a0e:b0:525:9440:243c with SMTP id 71dfb90a1353d-52a783e491fmr1019596e0c.11.1745486946737;
        Thu, 24 Apr 2025 02:29:06 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a7a12b606sm176158e0c.44.2025.04.24.02.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:29:06 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-873ac8037ecso339770241.3;
        Thu, 24 Apr 2025 02:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXf9e6ofIwD69u7hMPzWTaFM0y1KZxlzUCD6/Fir7zgwOMN2AUHflu09iTg9277pCLUJOEtwQ==@linux.kernel.org
X-Received: by 2002:a05:6102:e13:b0:4c1:a66f:a468 with SMTP id
 ada2fe7eead31-4d38f4e7848mr1324842137.22.1745486946185; Thu, 24 Apr 2025
 02:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 11:28:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSLeOcPxSg2yCeW4K+2dhmoDvmzP9_GdT1aFP0ZBkUZA@mail.gmail.com>
X-Gm-Features: ATxdqUG1gcEgtsfMX-Wl8WCXmTWMFQjklo2ziS3jS8LsbUaGnl66aDRdx1Sg6xI
Message-ID: <CAMuHMdXSLeOcPxSg2yCeW4K+2dhmoDvmzP9_GdT1aFP0ZBkUZA@mail.gmail.com>
Subject: b4 adding bogus tags
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

B4 sometimes adds tags that were never given ([2/7], [3/7], and [4/7] below=
),
or were already present in the posted patch ([6/7] below):

$ b4 am 20250423163113.2961049-5-niklas.soderlund+renesas@ragnatech.se
Analyzing 9 messages in the thread
Analyzing 52 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v3 1/7] dt-bindings: media: renesas,isp: Add ISP core fu=
nction block
  =E2=9C=93 [PATCH v3 2/7] arm64: dts: renesas: r8a779a0: Add ISP core func=
tion block
    + Reviewed-by: Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> (=E2=9C=93 DKIM/ideasonboard.co=
m)
  =E2=9C=93 [PATCH v3 3/7] arm64: dts: renesas: r8a779g0: Add ISP core func=
tion block
    + Reviewed-by: Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> (=E2=9C=93 DKIM/ideasonboard.co=
m)
  =E2=9C=93 [PATCH v3 4/7] arm64: dts: renesas: r8a779h0: Add ISP core func=
tion block
    + Reviewed-by: Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> (=E2=9C=93 DKIM/ideasonboard.co=
m)
  =E2=9C=93 [PATCH v3 5/7] media: rcar-isp: Move driver to own directory
  =E2=9C=93 [PATCH v3 6/7] media: rcar-isp: Rename base register variable
    + Reviewed-by: Laurent Pinchart
<laurent.pinchart@ideasonboard.com> (=E2=9C=93 DKIM/ideasonboard.com)
  =E2=9C=93 [PATCH v3 7/7] media: rcar-isp: Parse named cs memory region
  ---
  =E2=9C=93 Signed: DKIM/ragnatech.se
---
Total patches: 7
---
Cover: ./v3_20250423_niklas_soderlund_renesas_rcar_isp_prepare_for_isp_core=
_support.cover
 Link: https://lore.kernel.org/r/20250423163113.2961049-1-niklas.soderlund+=
renesas@ragnatech.se
 Base: not specified
       git am ./v3_20250423_niklas_soderlund_renesas_rcar_isp_prepare_for_i=
sp_core_support.mbx

B4 is latest, i.e. commit c25d17121045ab14 ("Merge patch series "prep,
diff: support passing arguments to range-diff"").

Do you know what is wrong?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
