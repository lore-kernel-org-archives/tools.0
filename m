Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9E231CAA
	for <tools@linux.kernel.org>; Sun, 13 Oct 2024 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728821940; cv=none; b=a43o3yQuhJnhDGXUTEjFcejyU6q/oKoJIXD5n0FS7DBaRfoXebXfzKmReALO/RVJ+I4WnUA5PkpOkcgTlf99hYvVo+HOf5dAMmPltL8BmSDrOftcim8tOG7pWGfDSFcLZDapqzDRJGOOfzMnuHmpyE2QKiLZRD473PnrW4/4Qmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728821940; c=relaxed/simple;
	bh=ZcLfReBo1S2p/v6xeG0I+LxGftGBoKOt/NOnfO5chbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsdt0fMlQDVqqFhmwSZZijo7xZaj1xxoRL3292ghSTb71P6RceTnGBIHA3PEiDFjQONiIV2GKfyKsm1R5xzeZp6RPdyEEmJd9GDmPuywt1eJlbGA7cQ4Uyki3p8ZSbG+qEVJqlYw2zNX++jkOa5GjMIS1sjgGjmiLwMN2f8iux8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNqnXXQi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNqnXXQi"
Received: by smtp.kernel.org (Postfix)
	id DB8A6C4CECE; Sun, 13 Oct 2024 12:18:59 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05E9FC4CEC5;
	Sun, 13 Oct 2024 12:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05E9FC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e34fa656a2so15518077b3.1;
        Sun, 13 Oct 2024 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728821938; x=1729426738; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcLfReBo1S2p/v6xeG0I+LxGftGBoKOt/NOnfO5chbE=;
        b=KNqnXXQica3Xy5O4r8aBxr+F2y2Calz9TpR89tHLhrEfvTGClKj8JZc59H9GcboK84
         ZEkQJmTkxsrOmNMJanznBuZNItrc6Lpbad1LhpKF30JjRObq3wfWfVwm4QJrflixhJ8t
         GJlDUUfau8yI73k/T1RQ+2hk07zduLh/WUvGxm9bSB30JtgJrEmG07v/q8lkcQha9oCL
         zl0wt/Bl+CYX74/sozvakevtZQthPuXDp3rhc4BcXGWHnfjXSLwnQWmHfJQHsLgZfDRd
         vhaC6delGCR0cfRNfVk0vs8rPFlokk/vMXWePmBi438f+nE1MUGgDuHrEd4I0GOZHypR
         Zx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728821938; x=1729426738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcLfReBo1S2p/v6xeG0I+LxGftGBoKOt/NOnfO5chbE=;
        b=ryWj6iPizcgdLjUUkOm92XfSsBXna/rgLVVZwSU4+Yd4d/ndlkNDOflNxrForApzSS
         8ISFnaMKXIUKTsWM/fz3g1SJzj1cv4GgoEaLFS9sdODQTdB4jfFNNwoJ4AP26QGbX2GC
         J6Mh+Y1vxojPKQLXOST4yECzNZhU6Au2DrOVlx/YZhFM5KhRfDTtUknW8vcRJjFmw/sA
         U8HYDSQO80Si/Eeuob/oYtr/b4sPStJeQ/ozsfNDDxAI1wmROb8cxh7SrwKD1I7wNRJo
         2e8EUuVqnfIfBi9Bup2hs2fF3vQBLW/hMZ7YeerRrSwBKBZpSfFZIjO33KeJ6oqcpf0Y
         S45g==
X-Gm-Message-State: AOJu0YxSTM7K5BkFxFKs0Nd6TdcwXFzZkXMy9ipxWb1OjKC+qp0dUF8X
	l5cQ6TedXqvSa8G4IbHVB11j4W7pKd8QBJqhYaBOsozhHktuargdTGg4Iu76lfM6nYGMCuso2ld
	MQpppayG4eOGn5HNYZSOZe7BCRgx3pNTyEvs=
X-Google-Smtp-Source: AGHT+IG8+YlZjR3kvp40gTtNjzGf7SkEeNRRZXFlYM7mOo2Lx5vvGG+UI+/GNU4BHtAZ/RX52W/bVu6IX5EZQQZCz8U=
X-Received: by 2002:a05:690c:398:b0:6dd:d709:6f18 with SMTP id
 00721157ae682-6e3644d3115mr34263607b3.39.1728821938141; Sun, 13 Oct 2024
 05:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAOiHx=nHXJLVM2ZfDGEi+VDYPhVuoZdpYhLTQwAGLgUiVmZvpw@mail.gmail.com>
 <ZwuiaKj1pgjZ3-sR@finisterre.sirena.org.uk>
In-Reply-To: <ZwuiaKj1pgjZ3-sR@finisterre.sirena.org.uk>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 13 Oct 2024 14:18:47 +0200
Message-ID: <CAOiHx=mKz0eM6_r_aHsX3d6LX=6Cybs779VSjYzqmWnu_JBsrA@mail.gmail.com>
Subject: Re: b4: adding/updating individual patch changelogs?
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Oct 2024 at 12:35, Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Oct 13, 2024 at 11:28:56AM +0200, Jonas Gorski wrote:
>
> > is there a way to add/update changelogs to each patch of a series?
> > prep does it automatically for the cover letter, but I find no option
> > for the individual commits themselves, or it even mentioned in the
> > docs. Ideally something where b4 automatically updates the changelog
> > (templates), but I'll take anything that does not require manually
> > editing the generated patches themselves every time.
>
> If you add a --- and text at the bottom of your changelog in git then b4
> will (or did last time I needed this) just reproduce that in mail that
> it sends.

So I just manually replicate what b4 does for the cover letter.

Thank you!
