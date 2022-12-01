Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5CE6FCB
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 14:42:59 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id d18so1147071iof.6
        for <tools@linux.kernel.org>; Thu, 01 Dec 2022 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs5TJ77o7rcPn7cTAbFuPaBI+yHhVHUz//A7/w3/Y44=;
        b=apukca2hf8CNfSoTQDcIMBMhaYoow+X68HIMwgAQ7J1DVacnXLsUN+cYEY9I/XAFNO
         42+Yyn7F2ekajpoQ8/uusSiyjdIHFRMXo2MQ+FRjcCDRxXpGZ/BIOGY/ODsX4MH5NF+E
         beqx0ey1A8Mqv0GLr6QPDlIWzazIjFINDfqvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hs5TJ77o7rcPn7cTAbFuPaBI+yHhVHUz//A7/w3/Y44=;
        b=LmOwJYndRRQztsBAe+6b5hY7zLqbP4e+RHBORisqnFgTBxeQO8mhVtiYGPAtjE8B4p
         V67X/T/9jo73IY+0KRHk3n2fHdpPY1/ssCXmKH4Zl+V40ND26sgHbFarlxEVF/TDCJfv
         fmbxSKs+vkrRef0FUaTpdQavXxpnyESH5MaDYjD5G5f9eefE7mkj3GxqbdzRJaxyNGaB
         CBf1iOC5cs/g7F2+8BRFn2EP5EKHgwaMUnmCMFF8M7Dh5cnTcFvZM8Jpr81dmRf4Kjx+
         HP/VUhzG6mQws5DG5TovuBOC4vm3ybf0FTxIxjRYZw33Ld56Dsw74vfCpHhGmysl2k/s
         D/Og==
X-Gm-Message-State: ANoB5pmwE+4V89IGG6s0RTULTFg3xSYUkIv5NV+1TjtyOlL/8MGVBbyE
	E4KUVUQA2SqzuNyBYvFddXpLpOfC6ThEuxVSLiyUfCFkAs3ODw==
X-Google-Smtp-Source: AA0mqf50C+GaxgrS0UB/4KJ4SNgBkpIyymX4pBTKgmRjcBp5lPjScCupJ3sp6AAcn2zx07HALJRJnjeb9KESCvJ2QZM=
X-Received: by 2002:a02:3b64:0:b0:376:e17:5e95 with SMTP id
 i36-20020a023b64000000b003760e175e95mr31692557jaf.183.1669905778330; Thu, 01
 Dec 2022 06:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local> <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local> <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
 <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org> <20221130165557.7ptog2pdgpa54377@meerkat.local>
 <77d7c98c-2fbe-d23c-b772-634b2a377761@tronnes.org> <20221130191736.pdt2x74znz2tcfxy@meerkat.local>
 <da129f85-45b0-2544-aca9-a674ed5357a5@tronnes.org> <20221130193952.twllu74eduajrauj@meerkat.local>
In-Reply-To: <20221130193952.twllu74eduajrauj@meerkat.local>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 1 Dec 2022 09:42:47 -0500
Message-ID: <CAMwyc-SbsFQyA8tTNbqzRkn+wDeo6ELrnV0ngwsx_6M4maHnPA@mail.gmail.com>
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly smtp
 provider anyone?)
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Nov 2022 at 14:39, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Nov 30, 2022 at 08:34:45PM +0100, Noralf Tr=C3=B8nnes wrote:
> > Thanks, working now:
> >
> > https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v2-0-435037=
990a83@tronnes.org/T/#t
>
> Great. There's still some weird annoying stuff with encoding happening, b=
ut it
> shouldn't really interfere with anything. You're a great testcase because=
 you
> have 8bit content in many headers of the message and it's tripping up a l=
ot of
> my assumptions about how Python would handle things internally.

For the record, this helped identify a bug in Python:
https://github.com/python/cpython/issues/99927

I'll have to work around it in b4, unfortunately, as even if it's
fixed in 3.11, I'm not sure it'll be backported properly to earlier
versions.

-K
