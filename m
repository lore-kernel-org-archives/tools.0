Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532BB294A18
	for <tools@linux.kernel.org>; Mon, 12 May 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056493; cv=none; b=JvonaZKwH/NCuD58rTBqjaFHZPBzfWZytF9iCYp4VQ7A6GV1cpsxSMuN4fUO21PQzprE/D5mnLPF4ew/9fQl/+4M6TzbsLSPBpseAO8AtbbLGapvnQVuWGu8m4RzZdzPFZQyN3ZvknR+PwJzT+9YIWztEfIYhjKGUtjP2w144WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056493; c=relaxed/simple;
	bh=57s2q2LiVSduSlK9kxyLgdrD2aGDILgrW1w6pli6bKI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ebtp2OgzVYVdMasLvS9I/fkHE+t+ZfTF7fuXfVH/OKSJdPAypUKW48vH0pbSohGCThOyuIENhObgdFmVX7aqkmVa0gwAhvSkLaQdpyj+pc245l+smySCgfAu964mMjJVze6zGOo4EXzFEE3M4VuchlMcZUS01ifOXbE33a0iWTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4def6955e85so1059878137.3
        for <tools@linux.kernel.org>; Mon, 12 May 2025 06:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056489; x=1747661289;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DwrhZRyDvkhXrKjwpEyjodCo5zadzPWirdVOrJTcRgA=;
        b=u/Tx9sSsBvvwMIigp1+9JfL71UJPoqMjVw8CKojsrgq2LnCi1hRdm6QwreflwVGECl
         wQOfmDbw2v2cbQ12TJmfLQbm0/zHMtI4YQ7P6CGvBozK2xrAwsATVshJbRZw933iEDCo
         6+m8rSvufatfm0sdUAzzo9pZPh3wV4pXV/DTU/XN973JF9P3plLjnqRTfoMDAgwBYtZn
         PD0JNUWrJnhULmdTkSYFhWSX6ehiUvE6yPfqxiXxFP4qtu1Fy+8lLbCIHZUfnTuSMXBY
         d7/+lyAPHSpbAu+GhNQYQl24GJghSZAhGjosXUVAiCXuxClEr0TtG8eXwMWAfeyp8YR5
         xIMA==
X-Gm-Message-State: AOJu0YxCwl/Yzp0peSXMlFkPyDWPXxhFvoxLnRwqfu8LIMUNaJcP6zIm
	h/me8nw8tPIt8jz17a4PXgdsUKRsC2qqmidRgRQtmnLMTpim3+ARaHn+Ppbn
X-Gm-Gg: ASbGncvNTUEDBk5dqL6OclJ9vocWeM+8uqIxSNacRYd7m9NP7+4z+uHwm9MnzsZa+JX
	jr7IIO78UnyOG6FLXwP0nCB8dktwXeJs5olx+2VHDl5fAWeF/+Acgz2LQyeXN9Jcto2GTSg1Ezu
	3aNjxrcDN8/PR1K8aJWykAEOqUSzjcG2GCEyvF/h3R2T6JE8p0/txdVhQlgTSkkY/f12WnknbVo
	qt5cr5FR1YLlMUoB0i+WZ3/eda/US+cbtgnhbyTuTq0S+XxXGaUNfvYnUVPu0VhZJi9gfypOT4P
	u2hwfCMNiF5TKs3uXPHZJSjhfxhpoY0KssS4VIPehW603WWRjJPv0Z6W3ExVvtw9sxUDqST43bO
	Xaj0BeozxO+wCK0sYpQCrwFg/
X-Google-Smtp-Source: AGHT+IE1Px5jCkGn52F6zm3q9R8UqhEl0JV9uDR9biYPBzZ/MpQvU6LVowfxBx50T2wzB//v2ee75w==
X-Received: by 2002:a05:6102:4a95:b0:4d7:11d1:c24e with SMTP id ada2fe7eead31-4deed3fdbccmr10120693137.21.1747056489355;
        Mon, 12 May 2025 06:28:09 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85d8a3dsm4913016137.17.2025.05.12.06.28.08
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:28:09 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-875b8e006f8so1296245241.0
        for <tools@linux.kernel.org>; Mon, 12 May 2025 06:28:08 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc7:b0:4dd:adb6:2a6e with SMTP id
 ada2fe7eead31-4deed351e8dmr9257563137.10.1747056488706; Mon, 12 May 2025
 06:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:27:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgwiNcHHopCCMLcidDkunhbGD+ZpMSoOAXy=PvoTVzYA@mail.gmail.com>
X-Gm-Features: AX0GCFs3qarQid9K0MyT7CclUqVfrZmHyeJAisqMFpuRx2af4NepniJku3HZ0Cc
Message-ID: <CAMuHMdWgwiNcHHopCCMLcidDkunhbGD+ZpMSoOAXy=PvoTVzYA@mail.gmail.com>
Subject: patchwork-bot incorrect reports
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

For quite a while, sometimes the patchwork-bot incorrectly reports that
a patch was applied.  Usually this happens when a series is applied
partially.  In that case, sometimes one or more of the unapplied
patches still appear in the patchwork-bot email report, while they are
still marked as "Action Required" in patchwork, so no real harm is done.

However, today I got a report[1] that is worse:
  1. It claims that Jakub Kicinski applied a patch to my repository,
  2. Its patchwork state[2] was changed to "Mainlined",
  3.  Its patchwork entry points to an unrelated merge commit in netdev[3].

Do you know what's going on?
Thanks!

[1] https://lore.kernel.org/all/174703868703.506001.16395245401308177497.git-patchwork-summary@kernel.org
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/TYRPR01MB14284C8E8145635A1AD8314F4828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com
[3] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=ccb52a9c8dfaa4e2cbb2524b68a7ead72038b039
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
