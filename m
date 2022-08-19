Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08B7496
	for <tools@linux.kernel.org>; Fri, 19 Aug 2022 20:43:08 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id m5so1348908qvo.4
        for <tools@linux.kernel.org>; Fri, 19 Aug 2022 13:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=CCGVLYrrHcTrllF0E7FqwfkRpG4pxtpfhRMWE2adNQc=;
        b=Bjq08KxehIooXNpMbwR3b8A7mvGFpQ5v6nIX0CNNTwCUqWW03n0zZR1pDCMh+iKUPT
         lHGb0K2DwnAYSHXo+iUQCqb8VeO7+/iuvBXJufqIBLu8QLpAEk06hCvVWrIEEYRm1+SI
         ZQutBCKmQimidiniAFbcTTLjrh5jEhv7F2ipY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=CCGVLYrrHcTrllF0E7FqwfkRpG4pxtpfhRMWE2adNQc=;
        b=nQ0YFOAJVIBwPfmF+uIFB27Gh2jE1lWpxhd2HA4QIpEdFEie2Hov6qKbGaQ8KivV7Z
         ZgozwDQFTFlXDuXfuZ/vbO78mvRG5Lgt1Ae9w327PhHYQUJcKdNaWGwNNOnSwDDP7zoR
         PjJvCCREovQ35FLzHSb+MwavHHKm9eURXlOJXsFLF+/aUnO5XoQUHUrTPj0P4+G8TC8d
         UN5EXa4+QpX9xcNOAHl9+3AW6JWt9ED8rGlX9mGNay5xJTgWlJG9yL8FWuWDZLW70FJ+
         8ephR8mcLl6cIWHoQTiBx6I6RfBYpBXNV9ZRlrNfqG6A2zGVSmUZ9GoD2FOEmjsDJMCY
         46tw==
X-Gm-Message-State: ACgBeo04VYPaZT+sdKAdlHU4Ldo+Jd5+ASS9//3ORzkkcUq4RTNucpLu
	PGu3T5SfkJ+lvQa5bZ4M+UAQFA==
X-Google-Smtp-Source: AA6agR7xL8D6oKyQuY8ZoRJkcmxdI7SPPsuFzxuB5NHRm390cG07DR6QeKaDGPMj3XQY3h05uu02TQ==
X-Received: by 2002:ad4:5b88:0:b0:47a:fe4f:aa28 with SMTP id 8-20020ad45b88000000b0047afe4faa28mr8113910qvp.83.1660941787714;
        Fri, 19 Aug 2022 13:43:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05620a319800b006b9d4f45c83sm4348313qkb.97.2022.08.19.13.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 13:43:07 -0700 (PDT)
Date: Fri, 19 Aug 2022 16:43:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220819204304.42w2ctexcrhnw72p@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local>
 <87bktbapri.fsf@baylibre.com>
 <20220726205653.yjmafga3utcwjef7@meerkat.local>
 <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>

On Thu, Aug 18, 2022 at 08:30:03PM +0100, Conor Dooley wrote:
> Apologies if I am missing something that (should) be obvious here.
> I am trying to use "b4 trailers" to update a local branch that was
> not created using b4. I ran:
> 
> b4 trailers -u --trailers-from 20220817201212.990712-1-mail@conchuod.ie
> 
> It took 5 minutes before I got any output from b4, so I actually
> began writing this email in the meantime as a bug report...
> It eventually worked, outputting:
> Calculating patch-ids from 16806 commits

I found the problem that was causing this to happen -- there was an off-by-one
logic bug when we were looking at the non-contiguous ranges. In your
particular case, we were running:

	$ git --no-pager log -F --committer=conor.dooley@microchip.com --since=3.months --format="%H %P" --no-merges
	2e80b31e5fda2503b96cf810c827fd22eef71a3c 31b809d2e455925a3d13ef4bfed62dac13ba45be
	31b809d2e455925a3d13ef4bfed62dac13ba45be adbeff44dcd5989a6508dfc3aa1c7f549bdea9de
	adbeff44dcd5989a6508dfc3aa1c7f549bdea9de e620e1db41c2d5a9024b12d24db1e86fa55e3fe6
	e620e1db41c2d5a9024b12d24db1e86fa55e3fe6 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
	88d319c6abaeb37f0e2323275eaf57a8388e0265 3f8ccf5f1a8c349364055b73caf1bb0314229976
	efa310ba00716d7a872bdc5fa1f5545edc9efd69 5e757deddd918edb8cb2fdb56eb79656ffc6dade
	3f8ccf5f1a8c349364055b73caf1bb0314229976 294b2111ff1027a942c362d523b847d73d91b70c
	5e757deddd918edb8cb2fdb56eb79656ffc6dade f2906aa863381afb0015a9eb7fefad885d4e5a56

The goal is to find the most recent contiguous set of your own commits and use
that as the base for lookups. In the above output, the break was here:


	2e80b31e5fda2503b96cf810c827fd22eef71a3c 31b809d2e455925a3d13ef4bfed62dac13ba45be
	31b809d2e455925a3d13ef4bfed62dac13ba45be adbeff44dcd5989a6508dfc3aa1c7f549bdea9de
	adbeff44dcd5989a6508dfc3aa1c7f549bdea9de e620e1db41c2d5a9024b12d24db1e86fa55e3fe6
	e620e1db41c2d5a9024b12d24db1e86fa55e3fe6 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
    -- 8< --
	88d319c6abaeb37f0e2323275eaf57a8388e0265 3f8ccf5f1a8c349364055b73caf1bb0314229976
	efa310ba00716d7a872bdc5fa1f5545edc9efd69 5e757deddd918edb8cb2fdb56eb79656ffc6dade
	3f8ccf5f1a8c349364055b73caf1bb0314229976 294b2111ff1027a942c362d523b847d73d91b70c
	5e757deddd918edb8cb2fdb56eb79656ffc6dade f2906aa863381afb0015a9eb7fefad885d4e5a56

When I tested, there was only the single range of commits, which is why it
worked in my tests. However, in your case there are two sets of contiguous
commits, and we were using the wrong one as the starting commit (the next in
line). So, instead of a nice selection of just 4 commits, which we wanted:

    $ git rev-list e620e1db41c2d5a9024b12d24db1e86fa55e3fe6~1..2e80b31e5fda2503b96cf810c827fd22eef71a3c | wc -l
    4

We ended up doing this:

	$ git rev-list 88d319c6abaeb37f0e2323275eaf57a8388e0265~1..2e80b31e5fda2503b96cf810c827fd22eef71a3c | wc -l
	16806

And then calculating patch-ids on each one of those. I'm shocked it only took 5
minutes.

The fix is in master.

-K
