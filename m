Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD875809
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760513891; cv=none; b=fiGAy8JMJcEdry6THer9IjXmA7smn1xuNUEwtn90YPB/aOr5pTtmjF64zWkWLfaQI+zSb8v+fGy1PC4QLx9+R5Zq/gbMj/ViAiaBlweQsWIw2E7w84FPL70kVTR/uk3asO+JVPo+9D5+l0tDW+6odIy5OZeyM1JLsyCzskw1AWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760513891; c=relaxed/simple;
	bh=GKNJM1xR4Og7dv4cI/QS9wzB4EnGIl+dkUX/tUtrcV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF/Rik2e3VQDtEvGmB7iwRe3Q0X4VElhVrpDwpkul90Ch4M/NKNyYb/LnKCwuozdPr7RiY9YP6YlAx17durfCanqyk9m6tnFS3aOVurAZxTAf2cKn2Bjw4STCRrm+B3huSlBu4CmhmszRSeZVotSfamjwse3+IoATQ1cG14SYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso3198144137.1
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 00:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513888; x=1761118688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbZbcC5QJcN+y+OFT9D5rQt5Qvn7TBF6J8ZB2hhK/xo=;
        b=VQXXkE99NvB2pyzFDGDoTR76rgx464SH8Z5MYYe8tSzxofX4QPPhTvyF5UoJ1ieVyR
         sMD6tZDMV0ih9a0TLGZ18c5TVjwA9g93W2J8zA1ma6ock2zYuveSFu01sR2yq02UupU8
         d98u1mSuSDsND/vRMknNKvJu6dXTE7PC0WWPKu2hTUeeJT9ONuqwxVrf/RXzZJHMmw4a
         uBp7NIxMstabDfbsTlIOevbfSqpWT6BMO3AX8TsAY4IW55N6fbjhWl7LmNEB8dOmuQ+5
         OzwlHymAswl7HsB0NBGJ53Je9j0pcoLX4yc8k4GY7V4Upv46inS5wImlYRQq8DIgU/7j
         YJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwA9+Y4TQHhACQ++iaknX5+8QFZux75uRE0nJz6WVlbUQIzhcfigCyuPS2QrV7E3fUv6ks2w==@linux.kernel.org
X-Gm-Message-State: AOJu0YzV7cBN5mQPsxdDu5xBNGiFCKVzLBgP2B53sJ2pawuQLjJzwIDI
	fPkAhXJUwfWqDlj+gDzX46qu/5CxDwUKvN9dmj+fFrRNGuKRq1zAOyDi+BKk+Cjv
X-Gm-Gg: ASbGncuedVirCtU7UiWn2bN/vPo/m+fpcREvPzA3E1saLLLIEt7zNingRhz13Ujypwy
	OLl0o6tcLPrpoH88k3FD5QyzF2GkebC9iw491nH9aDNtRE82oyRJM5hBK3z/Ll9W6W7te4w1x4O
	TM0ng242F599OQbeJgB3QggrSsFhTR/7Zd/Q47CUD1wqp6DmFDkh9TXBHJG5Nlub2apbqfI+ZFN
	ZKKcURdlOUh0fTC6nIW7I7XcX4zRaBxaVFHd/bE9yQojSI4d1IXbgexizNqOZT17FbZEmBM/tPH
	BhjQiMPGMsVoUTUzUodIgx0QN3GNJ4/oDJHhQWy/QhGGACgXPZfWqKestRVvYcMzslQrwgp+vYv
	vBzfrN/Xwv/j8zJO4vGmcSjiJsmcUKgfpZf4/PKUrWISPJAg3lnCi0vAeTJgmyPySM5o9ttlFf/
	1pomM=
X-Google-Smtp-Source: AGHT+IFTEiSb4wQ0vvg+3Q47TF6i/wjUqJzIArmkzyoTkaVF6ZidgrXkQCFvq25vEgXWudq+o30p3g==
X-Received: by 2002:a05:6102:8014:b0:5d3:feea:65d9 with SMTP id ada2fe7eead31-5d5e2376efemr9585301137.27.1760513887905;
        Wed, 15 Oct 2025 00:38:07 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc716413sm5066216137.6.2025.10.15.00.38.06
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:38:07 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-90f5eb2feb8so1399190241.0
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 00:38:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP3pZagKlMXB1JjWiBq+DaVAbh9werX+tS/04m6TdsX2q1FVE2WmdlFgdkdXiEzJ0AInLrug==@linux.kernel.org
X-Received: by 2002:a05:6102:3310:b0:52a:4903:95af with SMTP id
 ada2fe7eead31-5d5e2346bf0mr8887985137.19.1760513886601; Wed, 15 Oct 2025
 00:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org> <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
 <20251014062426-mutt-send-email-mst@kernel.org> <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
 <aO6Q8A5DKNA-g1Fa@agluck-desk3> <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
In-Reply-To: <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 09:37:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTM_LasDWO5tj_jBqT+GEbp-Zm8ntQO4cQbxVxBjeQwA@mail.gmail.com>
X-Gm-Features: AS18NWBVDHemv7lnHAWwnozweY4aBJbxUsvcKA9Gsf_9D1x-m2arHDjHBYezVTQ
Message-ID: <CAMuHMdWTM_LasDWO5tj_jBqT+GEbp-Zm8ntQO4cQbxVxBjeQwA@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Tue, 14 Oct 2025 at 21:21, Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
> On Tue, 14 Oct 2025 at 11:05, Luck, Tony <tony.luck@intel.com> wrote:
> > While there may be many archived e-mails with the same patch-id, the one
> > that was actually applied is "special", *if it is part of a series*.
>
> No.
>
> You are arguing as if this was a "one or the other" thing. And it really isn't.
>
> With the link you only get *ONE* submission.
>
> With "b4 dig", you get *ALL* of them. It's not like you lost the one
> that was applied, you get more information.
>
> And I'm arguing that if there were multiple submissions, those earlier
> submissions are relevant and interesting and often have *MORE* email
> replies associated with them than the final one.

More is not always better. It depends on what you are looking for.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
