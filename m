Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.133.1591635600353295616
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 10:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux-foundation.org header.s=google header.b=O56NBndU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.194, mailfrom: torvalds@linuxfoundation.org)
Received: by mail-lj1-f194.google.com with SMTP id z9so21386840ljh.13
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=btJ96Xi6/EHUzg/tjEigVFmKz4P73zfE4pL0hzt7rVs=;
        b=O56NBndUdsznORYa7pNssTEmV/hYGTwUMamvBHoXlrtvkEvVxrbq8Jiqqh6BR77ISE
         acShgn/qHEwGhAk8XMp6Zqu14uZAa1/L2F6P//1yY5PauBEOC6TupLGI8e5YcdRaDLrw
         /ufyO3bDR0SNHdMEcfJYXJuJyY4fmHpUKbBIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btJ96Xi6/EHUzg/tjEigVFmKz4P73zfE4pL0hzt7rVs=;
        b=F1tnU417joPcI/8cTfg651LZISTJGMhLbRFCgcGrZiYF+gXBxW3MqAhoF5J8kZdeSx
         ATD4N5hsqZ/OFy52K5HLrSarjSdByTozJPqRldpNk0G+Y73asEfrmy6yEVK2bvlt6PpS
         6tcxv0SZosHD7WT0UNWp6Kr2lfmdQv8wDHvMJfvQCZpADLo7ZgXe1nxQCugk/fYL2Eg/
         yVWQDkkZE9BNhxX29l3Vg1HIU4ajaMn11XP025BlU/cYPchnxLHdT/FO6Xu69zfvMCNY
         /Mt6hCetkUss3I60+WiRw5AdFFtmWAT1qgv3hP74rYoHmi1Bv39cDhuN60hKuG0txJv9
         m+lQ==
X-Gm-Message-State: AOAM533oVNG0E0M3PLes2QWaQbaxblnNZLhFxFzFQH6qrsHkh4XyG+Ft
	hOwl4r3HfS863oiDlVEkIgXZ+UgAIVk=
X-Google-Smtp-Source: ABdhPJyu3u5vViphKWZWtTGTsEjnOT+1147BmGdz4LM9fChahNaxQHMmbLPkX1E4UBa63UlnU6HW4A==
X-Received: by 2002:a2e:9d99:: with SMTP id c25mr11388142ljj.404.1591635597946;
        Mon, 08 Jun 2020 09:59:57 -0700 (PDT)
Return-Path: <torvalds@linuxfoundation.org>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2sm3808855lji.100.2020.06.08.09.59.56
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 09:59:56 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id u16so10674291lfl.8
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 09:59:56 -0700 (PDT)
X-Received: by 2002:a19:6a0e:: with SMTP id u14mr12851003lfu.192.1591635595985;
 Mon, 08 Jun 2020 09:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200525203341.z4dollmzbo7exnhc@chatter.i7.local>
In-Reply-To: <20200525203341.z4dollmzbo7exnhc@chatter.i7.local>
From: "Linus Torvalds" <torvalds@linuxfoundation.org>
Date: Mon, 8 Jun 2020 09:59:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipQzNyLxEh2mr2=Y9brLx_y0G0aKrVcjG2Ad3ba+_41Q@mail.gmail.com>
Message-ID: <CAHk-=wipQzNyLxEh2mr2=Y9brLx_y0G0aKrVcjG2Ad3ba+_41Q@mail.gmail.com>
Subject: Re: [kernel.org users] b4 version 0.5.0 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hmm.

This fails with the most recent patch-bomb from Andrew when I randomly
picked the email (just because it was most recent in my mailbox
because of a reply, not because of arrival), and I don't see why.

Doing

    b4 am 20200608044014.1sydER6sj%akpm@linux-foundation.org

gets me 51 out of 54 patches, and no cover letter. Strange.

But when I do the same on the _first_ message ID in the series:

    b4 am 20200608044004.04xI8ALrc%akpm@linux-foundation.org

it gets the whole series. It again doesn't find the base commit, but
it's a lot better.

                    Linus
