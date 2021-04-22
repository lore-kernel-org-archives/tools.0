Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA62929CA
	for <tools@linux.kernel.org>; Thu, 22 Apr 2021 18:05:42 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id gv2so13179124qvb.8
        for <tools@linux.kernel.org>; Thu, 22 Apr 2021 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=QJDOBjZNcSven3UTiO3Dc5WzgbCZwZstoEMUJuz7pEc=;
        b=QCKWjt290LJn6WWKHFFBpj7mDsqX8y+Kfnp9VpZdqZQ+ll/C8kNROzBOgOSm8ZyRLf
         FN0TRyQonvlhUMQtZnwU/ym2INx8OuluJNZnwCkb1/xAfwXeEpjcNmc0oA0PRpz3gnCu
         AEHxUQmThIvr1xWxu5NZOW1lc3VVSdVEqspVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=QJDOBjZNcSven3UTiO3Dc5WzgbCZwZstoEMUJuz7pEc=;
        b=jI4fUwKmDEHjz2NCuo42j6UxcWd1OTOFXVeFBXPff/EwP8PIyoXwOKoeUYNvY6LOKQ
         kyJfEJRkqiWvdBxYmsPBE9iTbQESHiHQcZ1LyxNZ5ZeuR1DpIxJgl6ZsIKnDP1CrOrcm
         mdiLQ6ZYR3GTFTwE+Ln3AZCGBq7RsoZJT2TL7hvMzd0DoppQkRFubJVUcUjSLDdQI5GP
         fSq++3QPxX9uIeMXhT+I5t6iCgMc7Mc9pVMeIgL8dWVvWz9XcXC1bIJeBMg8w4k93c1l
         atFXxoTpkmbnxpMW8e5hREJiH2y7bRgvIsTKeyeTAj1CgcT+wLo2MYvHLvYwv3TGLxue
         hSCw==
X-Gm-Message-State: AOAM533vUNPvJcy2gg0FBw3DhUSCHyvgx10UvxTymMtU4BDK1VNKvke/
	lpRFig+d+jhMrDzA6kOHuk+ieg==
X-Google-Smtp-Source: ABdhPJwGTDPm6CYqUA0TR0TQONn2UBgV98xUjVWKqrdajzNiND3Aq/reWeD6/pOu5K95R40GJC0l3A==
X-Received: by 2002:a0c:9b88:: with SMTP id o8mr4760246qve.28.1619114741811;
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id a21sm2712214qkk.45.2021.04.22.11.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
Date: Thu, 22 Apr 2021 14:05:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: ksummit@lists.linux.dev, tools@linux.kernel.org
Subject: backfilling threads with b4 (was: Re: [MAINTAINER SUMMIT] Rethinking
 the acceptance policy for "trivial" patches)
Message-ID: <20210422180540.hj6xs75sqlmnegs6@nitro.local>
Mail-Followup-To: Leon Romanovsky <leon@kernel.org>,
	ksummit@lists.linux.dev, tools@linux.kernel.org
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
 <YIG43TuqmxU24evq@unreal>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIG43TuqmxU24evq@unreal>

On Thu, Apr 22, 2021 at 08:56:45PM +0300, Leon Romanovsky wrote:
> >     macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"
> > 
> > You'll need to adjust it to point at where your maildir lives, of course, but
> > that's the general idea. With it in place, you can hit "4" in the index view
> > to get the rest of the thread (without duplicating the messages you already
> > have).
> 
> Konstantin,
> 
> I tried the above and here the obstacles which I encounter.

This is probably better suited for tools@linux.kernel.org (cc'ing
accordingly).

> 1. My emails are stored in Maildir. The mb2md script half-worked but ok
> for the test.
> 2. b4 didn't work if I tried to use lore link from the middle of discussion,
> which is very common pattern to me.
> 3. b4 didn't grab the discussions, so I got the patches, but didn't get and
> won't get any interesting to me responses.

Are you sure you copied the command correctly? 

1. It should automatically recognize when it's pointed at a maildir, so no
   mb2md should be necessary. Are you sure you changed "-o ~/Mail" to be
   pointing at your maildir?
2. It's supposed to grab the message-id from the piped message, so you
   shouldn't need to pass any lore links.
3. Are you sure you're using "b4 mbox" not "b4 am"? The mbox command just
   returns the entire thread.

Please feel free to drop ksummit and others on your reply.

-K
