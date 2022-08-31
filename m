Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2A780A
	for <tools@linux.kernel.org>; Wed, 31 Aug 2022 12:40:05 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id h21so10809738qta.3
        for <tools@linux.kernel.org>; Wed, 31 Aug 2022 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=t6pE2Dw7gMwUgk2qC/eR4tzfdfTRlyBDRMwmR+S81uM=;
        b=igPICLJv13BnXrP6sS2jjTp82IJdUn8XcdjeGaqPbxh98FyOWHdd2d+7omeZumI/tv
         z1Xc24XY2ad9utAxg5rMnK7BDApX/2F12eCbl4Fsjv8lytdinXBVgJ8d1e+xCkAeGwEV
         UIVWDGVqsOlB2al8cGQHuRPyyF+l/VXWeS08k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=t6pE2Dw7gMwUgk2qC/eR4tzfdfTRlyBDRMwmR+S81uM=;
        b=rC6qMQOTfVreJ7/pQBpdnUY2lfINR3akz1/Hb7d+edPuamI6O/rNxyr+Ljwx05aXzd
         bgeIdDPdOAt1zPt2e4G+FuPlCY09mnJ6o1fLJO+vZA4A/UkdNPBW1iu6hNU+YOOUtUSZ
         R+10A6n0FKL3l+sMN3r6TNpPXSIlrC7yfuFIDZC+H1Qu1YUOaRF6UyGqJkMREyeh+2VG
         PuN/Iw5g045FtWkQ81XD4n723OHIvcdJeHR8vk//PMP5TvkezrW0R9unjPFvOxNZvCvi
         emEBGSEScyjv9wHvd+lR1hqbEXcJ6H+CbBpzoL31gpN4svLc3p4GulfLZxHndiJp33yB
         oORg==
X-Gm-Message-State: ACgBeo3n9aiL4NNNGfAscLL6Sk3Fz5qe44kHZL3fRLFhH18vVrud1Rxd
	T81KECTOPmS2f2ZBL/vW2A61OQ==
X-Google-Smtp-Source: AA6agR7/COAUOfcg4/IfUYa7NS+IJoTBnXepMhj9TMhoUbX8tkj+iZba9sxOcEMvuuXvJOLxsVneIQ==
X-Received: by 2002:ac8:590f:0:b0:343:61fc:e242 with SMTP id 15-20020ac8590f000000b0034361fce242mr18268157qty.635.1661949604829;
        Wed, 31 Aug 2022 05:40:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id 187-20020a3704c4000000b006bbe6e89bdcsm9735923qke.31.2022.08.31.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 05:40:04 -0700 (PDT)
Date: Wed, 31 Aug 2022 08:40:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: Using b4 with full URLs still uses lore.kernel.org by default
Message-ID: <20220831124003.ifoc4kb55myjae4o@meerkat.local>
References: <f2b0f3c1-d98d-979d-1513-18f2491f4267@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2b0f3c1-d98d-979d-1513-18f2491f4267@gmail.com>

On Tue, Aug 30, 2022 at 01:00:20PM -0400, Philippe Blain wrote:
> Hi Konstantin,
> 
> Following the launch of inbox.sourceware.org [1], I've been trying out
> b4 with it. I noticed that even if I use a full URL (for example, copied
> from my browser), b4 still rewrites the URL to lore.kernel.org.

Oh, I'm so glad someone uses b4 with non-lore URLs! I'm sure there will be
bugs, so I'm happy to see them sent my way.

> For example:
> 
> $ b4 mbox -o- https://inbox.sourceware.org/gdb-patches/cover.1661868744.git.aburgess@redhat.com/T/#t
> Grabbing thread from lore.kernel.org/gdb-patches/cover.1661868744.git.aburgess%40redhat.com/t.mbox.gz
> Server returned an error: 404
> 
> It does work correctly if I set 'b4.midmask' to 'https://inbox.sourceware.org/r/%s'
> in my local Git config file, but sometimes I used b4 outside of any Git 
> repository just to transfer threads to my IMAP account (piping b4 mbox to git imap-send)
> so it would be convenient if full URLs were not re-written.

Yes, I'll poke at that today and apply any backports to stable-0.9.y.

Thanks!
-Konstantin
