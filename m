Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7624A1993B1
	for <tools@linux.kernel.org>; Thu,  6 Feb 2025 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866246; cv=none; b=CewcJwtRW219oybBkOQdv5JTdmtxvHgC7zEzALPU2ue4mLNOJR2wxeuL2UFQxxGgme9QGEIa4fLx+RQnsiaDpJNCwHv+89HCjbJbCuAcfKmn6ZI5D47BjMeluJZd1DtNcftDNWHe2gl+c2K4MYQ8TWF+d/WYWFKIQI9joxXzyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866246; c=relaxed/simple;
	bh=bivDzxEWMXqANZGZntVVdKai6YLg9XCEXViGdtmDOA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6CbSWM1vLCfudLwqWlTRKh8YSvDyHir7eBOEpp4/b/GcQyLXVXCEW/NcB8UnpyQojSdaGcVCaZxjGzd40lBhU6glha88RXMJKV9TJfjNeyu0jtsNo5XSouP4VhIr+CiK/h8teGgp7+1Lt+7nzfV/pPz/Dt2FR4dLWSXUFb2avY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9p6+rXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9p6+rXf"
Received: by smtp.kernel.org (Postfix)
	id ECE8DC4CEE0; Thu,  6 Feb 2025 18:24:05 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD10FC4CEDD
	for <tools@kernel.org>; Thu,  6 Feb 2025 18:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD10FC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a59so13623061fa.0
        for <tools@kernel.org>; Thu, 06 Feb 2025 10:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738866243; x=1739471043; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bivDzxEWMXqANZGZntVVdKai6YLg9XCEXViGdtmDOA8=;
        b=O9p6+rXf4sz19Tebjfcu4ogvNFqkPG7pa3GJB6qYCt3b67BrR9fZKVuLxAC0XzuoaA
         yGcW599yVVfDPEZR8mbvPqGhscm9g+2MQtMr8bPGlPDlgQMtx4Rm1MsVf97/BAG3ThMg
         iDc7pVZjVYyqVtL2NkVTC2YDcazFCTGVTQFE8YIbfgvkU8JpLpkoPFZBgPugI9rKXxFs
         lM5hbveYWASRS4CpxyROaN6s/YinrcnJgbW3XFmCnre03PVf/qtJKUC5Sf+dcd53NRJm
         HrqBl75lAkinC20AoC5+a3AyLBPDimbT1TTqxP7nvMiQOGwPJNNgTmlhkBiG5hxaKZc/
         EHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866243; x=1739471043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bivDzxEWMXqANZGZntVVdKai6YLg9XCEXViGdtmDOA8=;
        b=uLJ1vI+P/wEr/9CjcBnc1FFonV7wOiSESgsEgj0SUSbrjQtz50v+Bihfy2AUGlRSSi
         YBpDAivy1ZYzC914PnOamLJlhLFo+BYUAwKT77FIq3vrhnS0Gsj2MB9hP+ME3Cp2pjUE
         qUroA3n2Fm2FiInrY82MAP9xr+OCw/dUM0bQRsKXjd9XKgo+QYJZGaBPRYQOz3MDJusn
         qkNLFyqIoGN8wYNyXqeYiku9RrwRVoCXwkXJq/XvG1Xu1u0aMIKHzN+EvorEcP4OVbZu
         qrCG0hHd7cl8wcxL1OtVbubBm3sLTIi3DCRKO67tSpnPMtYPnB2BGuD45SNKCCv4QiE7
         +0Ew==
X-Gm-Message-State: AOJu0YwtU0Q4ydUwbHNzRNJlIBMHJ6YU1foVg6lHxBuGYmBfAJxV6JRg
	7fimnSJjeCH1uNFUawL87gYRGdsPuDqYTNfUMagAn3S9q3srjtdzszb26QlNH6i0MsFQD/ui4li
	6tesqZc/Q/IqjKJzew9Gaf2DPkfTtQULx
X-Gm-Gg: ASbGncu0BOsGma5X9nxdyTqyvhPsEupvId86LzYecHWAclPmJnhGGzkiM8J26fj4lCD
	ipLpnLkxygFuy6gs4RrqnMsDqV/igSOW8rYaBD2GJ+VJC7QhWKz6LRYhKt5QiKGrk3/z4AYLnmm
	SgGQy5d9wecIv+wiyZFAAi16XU/GX9
X-Google-Smtp-Source: AGHT+IED3L4SHn/8FrNfa3toGlCNaUhHFz+twwJK+OMDpbkO4Q7w+ilCoIiayu/sBS17v1T6HWaSFepBP8hOGXHco5s=
X-Received: by 2002:a05:651c:19a8:b0:302:1de7:ef3c with SMTP id
 38308e7fff4ca-307cf38aa06mr25769571fa.31.1738866242807; Thu, 06 Feb 2025
 10:24:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
 <173755972553.457666.16721877756658243086.b4-ty@linuxfoundation.org>
 <20250122-flawless-logical-badger-d760cb@lemur> <CAJ-ks9=D7vv=xq2hDeENGqzvujw+oye2=AUBBQtcu148szDoGA@mail.gmail.com>
 <20250206-flat-dark-rat-3a44fb@meerkat>
In-Reply-To: <20250206-flat-dark-rat-3a44fb@meerkat>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Feb 2025 13:23:26 -0500
X-Gm-Features: AWEUYZnNOqgGvjSd50F7QjjmtLNU2GECfVFyGBq5N1YlT7ArZMgwKf3Igg1RrIE
Message-ID: <CAJ-ks9mwgqwCxMMm81x6ZAEdg3cfaH4uzp-YaFaUTYxZU3NAfA@mail.gmail.com>
Subject: Re: [PATCH b4 0/5] Resolve some static typing errors
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:53=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Jan 23, 2025 at 10:28:21PM +0200, Tamir Duberstein wrote:
> > > Note, that I had to do a follow-up fix for the missing Generator type=
 import.
> > > I should have caught that during review, but missed it.
> > >
> > > -K
> >
> > Cheers, thanks for that.
> >
> > Would you be interested in a Github Actions config that runs the
> > static analyzer? As I mentioned in the cover letter I think we'll want
> > a regression to stop so we can make steady progress. If you're open to
> > it, I'll work it up.
>
> I'm pretty reluctant to introduce a hard dependency on Github, because I'=
m
> frankly pessimistic about Microsoft's dedication to free software in the
> current political climate that is settling in the US. I would love to be
> proven wrong, but at this point I'd prefer not to introduce any further
> integrations with large US-hosted platforms.
>
> -K

Makes sense. It wouldn't be difficult to put almost all the config in
an agnostic location, with a tiny bit of glue for Github Actions (or
whatever CI platform you prefer). Does that suit?
