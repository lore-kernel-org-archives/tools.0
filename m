Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B616FF44
	for <tools@linux.kernel.org>; Thu, 26 Jun 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926779; cv=none; b=TwRN6XvzVbH1NakREif9/HIaUX6S85kxFLI3LwJuiho7ykDfxAl+YY6M9cLu130QAARxW5+2+aZsquXwm7339Tp6//cf9dg9XkdOTf1athC76EtiEBm9dQa/s0VWB4g4vnAmBlmZxhQckxqQ1PoWHkMIzFe2m5c0UKPAMy0RZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926779; c=relaxed/simple;
	bh=/EXnmyDqhgwhNubqEJ+Z7XqtbTMhvh+9M0BZvcE+S0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhoMvqcAw+WvOL9Axt2mcoUoQm20K0/DRMB3NNvZUIc/vbHs0um56Ijjv8SzgV9DbQNaxcHjccsPN+cduK3OpCKSFduCeVqJkbJbpJ8tPyUhd+Xih1Yjr3ov4mk3dblwff/8N/Wh0lUk/4/mBtxyJVui71gV5AUB+1bcjPh8jE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wTl/Hw4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wTl/Hw4L"
Received: by smtp.kernel.org (Postfix)
	id 49B64C4CEF2; Thu, 26 Jun 2025 08:32:59 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50110C4CEEF
	for <tools@kernel.org>; Thu, 26 Jun 2025 08:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50110C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b5931037eso5305551fa.2
        for <tools@kernel.org>; Thu, 26 Jun 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750926776; x=1751531576; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZyqW6LTgx3qQCdMf7DVmwLH6L5ZjexEcMKkRJNzkQg=;
        b=wTl/Hw4LEmkYy3bZB6+GWkmTwGYeuETEOQPStg4akdoz/e1P9ydgmt4RWvn+wjwkVQ
         f+fxr7p7aE/B9uh2iR88FaJM4LXlX/mKa87azkovPTbKL6lZDh2y9trPo2ETjXfsjr65
         36PQhF3DHvVbImHf0wRO0udozfg6BTA2Tk/8jK1kvawtsJ0skFFXWpmEm2HqXlMF2C6z
         lANE7E4+O2MeI08wE6vOV6zI7m4IQld5pmld/GQOfFTprJ60D0QJ/dyGJ2PJMpuX6KLW
         t22rUKcG4WLjv8aa0KPm0+MKnbrJcw7NEVl6mRK+ykJI3TGppFBbOUEMNSzPXT/oqAle
         7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750926776; x=1751531576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZyqW6LTgx3qQCdMf7DVmwLH6L5ZjexEcMKkRJNzkQg=;
        b=t9fw7sQKS3iOtPGKvi+M4pnaAZJ55YO4U1rPzOHjYC0g8Jw6gAdAdazj9lhw0lKncN
         SLtbHCCvJ7zgfi/tZp4Z8fjSQJJVKmyL7nb2jHF0yOw7X/rx2+kkhlZzeQRyNSOGMt9W
         bmH37wC5+iM5zgNBekaJqo3jCP593yF3POEXl+01EwyeylPZoXdtyvokuW5ZtdMyQ7Yc
         ylaQO+WOpXXafzfrgipIhsii36sECRaDgl9JkRA89wCnjboQKp7IzwHXb45zotUrMn/x
         jwtXszS1vWedN8n8sDSncTc9xUFn7B8vaDqvZN37YZ/2NDi3lVqzmfEAzGjsbJCuW2Rt
         ViOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUycpsFqCfJZgOsf+Ya2VRdYKdOooI3apQFGjAwtij4/3eRJIXHu1bjecNdp9ADjk0OgwGG9Q==@kernel.org
X-Gm-Message-State: AOJu0YwMF9IJY2evjBoMYJmDDHigQR6HW80YRIE493Ca/gQuhUZ0XYLF
	qaWTAi2lz7MvOKR4uj3FUie/Zn6/IqPt2btjluhOEHfIoz+eUYrEJkNeCnKZJ/kaj2z717SxUff
	hNdcM3I3i//CLUGYieQMiZQzIANvFCnzA1nfklN2u
X-Gm-Gg: ASbGncvrgeKGoz7y0X1/wEXyX8sSUgwsEQjXzZn41No80D1WMhmTbis8RI4Tjoa4px0
	9mt56HC2Pyk/Ck34Yp0u3oNQ3ScbsZHYP3EE0/ltrEiajEvGKeM9l9I69R/bU4K0uy2TqrF/xLH
	Imnr/iPGskP5ew/EFQERSXqgFldzpXiIo/9CeO8E2PjKr7s8ipgGH4DJ6Yl5VW21emVH4wfIshV
	nwn
X-Google-Smtp-Source: AGHT+IETo+L/oV+R/tmnVYW2Qg4rA4aBv5GWRJ/qPp97+u4UznXO8eCK5nvO+CRrEHedFW1CDFl6j9Mm6w/bd2AvpQI=
X-Received: by 2002:a2e:9059:0:b0:32b:5eb3:280 with SMTP id
 38308e7fff4ca-32ccfa91d8emr7830071fa.29.1750926776245; Thu, 26 Jun 2025
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy>
In-Reply-To: <aFwb_3EE2VMEV_tf@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 26 Jun 2025 10:32:45 +0200
X-Gm-Features: Ac12FXwPRCYLCXOzZA2k06HmxFcMR3fWIsqQHlWuGEU7Sh27__v25jmGtwOdH6Q
Message-ID: <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >
> >> >6. What's the goal of validation of the input arguments?
> >> >Kernel code must do this validation anyway, right.
> >> >Any non-trivial validation is hard, e.g. even for open the validation function
> >> >for file name would need to have access to flags and check file precense for
> >> >some flags combinations. That may add significant amount of non-trivial code
> >> >that duplicates main syscall logic, and that logic may also have bugs and
> >> >memory leaks.
> >>
> >> Mostly to catch divergence from the spec: think of a scenario where
> >> someone added a new param/flag/etc but forgot to update the spec - this
> >> will help catch it.
> >
> >How exactly is this supposed to work?
> >Even if we run with a unit test suite, a test suite may include some
> >incorrect inputs to check for error conditions. The framework will
> >report violations on these incorrect inputs. These are not bugs in the
> >API specifications, nor in the test suite (read false positives).
>
> Right now it would be something along the lines of the test checking for
> an expected failure message in dmesg, something along the lines of:
>
>         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
>
> I'm not opposed to coming up with a better story...

Oh, you mean special tests for this framework (rather than existing tests).
I don't think this is going to work in practice. Besides writing all
these specifications, we will also need to write dozens of tests per
each specification (e.g. for each fd arg one needs at least 3 tests:
-1, valid fd, inclid fd; an enum may need 5 various inputs of
something; let alone netlink specifications).
