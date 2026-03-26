Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E643C0605
	for <tools@linux.kernel.org>; Thu, 26 Mar 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521267; cv=none; b=hU3sUfwJo2uDAZLmPvtXxHWFnmiCCX1mK06J4W6rkhlsUAAa3wxmoh51xjnqZ+V8Ba6BmOiwfjqxGepcZFwVQcuu+nIGXP88g/AeUN7uaCu+4DdQPApjLCUH4xihgqk5rW+7POwkF/N8HrsYkDKTq/iek0qriSMMn4kfVc1HQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521267; c=relaxed/simple;
	bh=MPtDwmFz//+11nk6plmSxKvAc6uJaKPXCy4fe7ROBmc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gycZyc0aqQDCUpJG5qtssViffuE6RHLy7GVMSh7x4DBIK0WnWqN5O5ksmZ6ulOgPs6SD7J8s8bi2fCMOCem6U69+2CunkYDJQwj7UTETRRX+uoz7PoiZ6wlwzzsHDGcFl+4qNxTJkcL9iX21EBBIaKF7Px6pqiQ/WdvAS8HB9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 9E60DC2BCB0; Thu, 26 Mar 2026 10:34:27 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C12C1C2BC87
	for <tools@kernel.org>; Thu, 26 Mar 2026 10:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C12C1C2BC87
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a857578a8so360269e0c.3
        for <tools@kernel.org>; Thu, 26 Mar 2026 03:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521265; x=1775126065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kopq5ezyyeQlXwlv0XDxKR/bVIWL6SfcXKwMeLSf/CQ=;
        b=CP/kUo9XeAT1GYFdz7j4gSXXoJm9hdZ+xEeX+2NqJF473kbiwDhHi+NbSfAfmo0JM/
         B2eCDH6ftOTFOyM0MKbDt+hxiP5QM1YGRr8B5SWPrUvVfrpyuZx27kkjCzLuv2aDyWws
         mRpOUz/leMXjAjkuM/QT78Q2Q0ZzbobFj1L/Pjd6BL6gKEnPPmn/0OtBXeUnRIHxiOeC
         Rn6QdLa6mX3+62pTdCYL4HajI93powmUTf5tbfSAU1gTJoAOez4Kh9YRWjKIn40rl3pS
         T6tf+F4eiiwpLCRd4UpnUSF2+9ffYhCFfzBDMuhj3Dn8aiffjmuMjO6aArh5DRhiBf+D
         KXKg==
X-Forwarded-Encrypted: i=1; AJvYcCWNtM0fKh1Z4j+gUzoPxuZSoLBj1YB1VKLNEz5CrxijQp1cofNtvVDa3AnTJ6HGoObC3ux2Ig==@kernel.org
X-Gm-Message-State: AOJu0YwEBIK+oExEulaux9TXA/5bgNlkw8XC8a147clKvFiNsEE9Zeny
	rFpOkpo6D29yVZpykwUKHmLl5ZZWqRwJnTEwUlTMnm15WCqqRC/LR9X713R5r0uR5zM=
X-Gm-Gg: ATEYQzwh+1Hd2vkidD7G9E31/LEiZDG8ec8Pj679B0QFmkb1Xqf9ZWuKAyidDqYitVT
	1uFnaYMmHOHg/W2mlbgKBKTTLTj65srWjyMDegEg4kzmJySz9WCtF4xwQ0SsKks+vz418odg5dt
	rS/7vP+Lr1QUOjh/9Qwvfm8VZez8ocvru5uGMMVVev9xnhr4Tw6Z5fn1Es6fPCBKvn/LALbsZWD
	QUSjgVamKrb1QHjgjQBoty6muWyLBrSRv3EvO6W3MHI/UXnIH3u9z+rm+Km2JkeT/CIVww9P8Q8
	SwiExzAmlfWcPA7ySN1iPg69ByZLv1hXODuteaSYnjVI6k3jP4hpBlEN8QfDH+MkpyqRX0JdM6f
	7ertrT7iPf5RUOYnIW8cAImGC1O1EY8CbunPC89gidFEKyMVvtuWdQ+n3GKpzlhgPDS/lOSKDPj
	wCY7mWp3AiNXudt5R6l5Jpgh1PUcMYsZMVgXaZZll/IKR/S6f9zFiWSS2OdIVDuyiegmj3CyN7l
	bo=
X-Received: by 2002:a05:6102:508b:b0:602:8b67:37b0 with SMTP id ada2fe7eead31-60387221a92mr3178087137.23.1774521265556;
        Thu, 26 Mar 2026 03:34:25 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d531357dsm2553098137.9.2026.03.26.03.34.25
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:34:25 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a857578a8so360259e0c.3
        for <tools@kernel.org>; Thu, 26 Mar 2026 03:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXd75OTV65ohXiwJxG/KyebFwARHufUahc2+5btjWvTN6/N9z1PjtL4R5SHaCx2+OS35sZvNQ==@kernel.org
X-Received: by 2002:a05:6122:3481:b0:56c:d58e:8c0b with SMTP id
 71dfb90a1353d-56d2208b18cmr2879832e0c.10.1774521264795; Thu, 26 Mar 2026
 03:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:34:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYLAZumj9fvDTWJ8JXi-YLbkpdA1ovMaS+c8EH=WpZBg@mail.gmail.com>
X-Gm-Features: AQROBzB1EmRPnQief0tLF0r3LfGJ2D2XPdlg0dvVxmlh8DlJOfddrxkyvulldMk
Message-ID: <CAMuHMdWYLAZumj9fvDTWJ8JXi-YLbkpdA1ovMaS+c8EH=WpZBg@mail.gmail.com>
Subject: b4 very eager to pick up old tags
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users <users@kernel.org>, tools@kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

---8<----------------------------------------------------------------
$ b4 am 20260326045416.223556-1-marek.vasut+renesas@mailbox.org
Looking up https://lore.kernel.org/all/20260326045416.223556-1-marek.vasut%=
2Brenesas@mailbox.org/
Analyzing 2 messages in the thread
Analyzing 17 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22 comp=
atible string
    + Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    + Reviewed-by: Andrew Lunn <andrew@lunn.ch> (=E2=9C=93 DKIM/lunn.ch)
  ---
  =E2=9C=93 Signed: DKIM/mailbox.org
  ---
  NOTE: install patatt for end-to-end signature verification
---
Total patches: 1
---
 Link: https://patch.msgid.link/20260326045416.223556-1-marek.vasut+renesas=
@mailbox.org
 Base: applies clean to current tree
       git am ./20260326_marek_vasut_renesas_arm_dts_renesas_rza2mevb_drop_=
rtl8211f_phy_c22_compatible_string.mbx
---8<----------------------------------------------------------------

I assume Andrew's tag is taken from a much older patch that has the
same patch ID?
https://lore.kernel.org/b2916c07-e286-4e7a-854b-5c42771d0065@lunn.ch

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
