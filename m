Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E57B657
	for <tools@linux.kernel.org>; Mon, 19 Aug 2024 23:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724111180; cv=none; b=VmTMkJKLSbVpEAOoB8RPlXIq2erTuXi1RXfVkFRVz+HyOT02UgCopaBeJb8M7zlh8lAjgC4MVcQC6BekXhBJ1oOtx8Wx4YnwPtufX4F6aqprwHMGzkXKyntO80mtm79XOGzbI+lsYbnaDF/JGu37nHp4pElfwxEObcxd/wBI8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724111180; c=relaxed/simple;
	bh=AbiEDLASZ6ziCFRxwppK+fXZHDO2kPbR7L1nsJE2EDQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nt2qy4XR5gWNugttOERhiWDoz2FxE4yJ2oZ2RuVAPf54PB4tQibw0uWT31IZCizn5C8IJsZnX5dPYhaYhmHD43XQyoJn3s9JSBSofaIW+GrsQ4vzbI25NxbLaEOAUY54eGHbDGGrAzTHCM2JxH8rXYAT+0x9u9QTp+UhI12nLFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=u92lv4xb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="u92lv4xb"
Received: by smtp.kernel.org (Postfix)
	id 45BCBC4AF09; Mon, 19 Aug 2024 23:46:20 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A908C32782
	for <tools@kernel.org>; Mon, 19 Aug 2024 23:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A908C32782
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3ec4bacc5so2242374a91.1
        for <tools@kernel.org>; Mon, 19 Aug 2024 16:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724111176; x=1724715976; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQsBfM9dYRJeWVOWO5aqTQunP8xW4MoHrN05wIYyBc0=;
        b=u92lv4xbfVoFf/3vnpLxjV5GClW9SG9Nler5xM61fBoSWoWHbQCCf1dowtOyPdiZFQ
         2MxELjSpg6UO3zVVPuQIq4nosm9UaTe8nhINSfTqBmkJ0evCB2yuzhqhVE31YjBYzMvb
         s9vsfzl2PA0H6PEJIB/Nfa06G/1ABQ9TO5nhHGwggXgnymaGF+3vW4Jo0OMUAMSG5KMX
         9GWbCxC0zjoNzZspW0Bpb80ewgk1csjOxs5xc9iwAZlJAi/zq1ixFNXoHnmh1aJUb/Sn
         sf0hl/5EUdO4WTDj3Tx2yQam5AtgrSWLfYGLoQhIMeEH3lT+gGiIIAiy+XXLTpJROLZz
         Peag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724111176; x=1724715976;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQsBfM9dYRJeWVOWO5aqTQunP8xW4MoHrN05wIYyBc0=;
        b=TTaCLtFYpjKzxZJGLwQaFKpqt/ojlHuy0vKQCtlna/ETr7dKnlkJQFqY3a0VbXGlyE
         9gYCHDQL3QyvNaiPYYdbYgAG9zdPCr6bawTaZi0kWR9MfNhJhAn6eil9dT5OHFTU6drA
         2C9u89S+X1Uq1Zp5moptjvGtv3BEDBRqD0yqf2GCN9TXvJqe2wMdWpTfB27Qep1rmbFJ
         Jz45bBMp4TM3q1eZbmZglfURWSehBschXO3eA8BOMQfcyugH55i2dwGCMgbizj3qkx+T
         ehIHqMaRg5vSzp2KqYSDROFuZ1SpfYrXINCqBLw/d0R6tAvtY1YBARxPzMN9C/eQTZks
         9gzQ==
X-Gm-Message-State: AOJu0Yxbs+J3+V6ed6t8oScJE0uq0SEjLHrxgP3iOIYnGDIpSyo05Kvc
	jXkIRzwy8DimOtxLbnOZxzyP0cCyBZWjyykWng+nCTcnOr2d5sbur6dcLSuuFHBxrCZV8yyDZFA
	k
X-Google-Smtp-Source: AGHT+IHRktR6w+W2QZ6cr6wv4ro0yH5neMIf1yOb2bOXtRonsXtQm5oxqi8zznFd5K4HhcKFL40hug==
X-Received: by 2002:a17:90b:790:b0:2c8:2cd1:881b with SMTP id 98e67ed59e1d1-2d473442581mr1695824a91.20.1724111175941;
        Mon, 19 Aug 2024 16:46:15 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3d6f88328sm8525274a91.49.2024.08.19.16.46.15
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 16:46:15 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tools@kernel.org
Subject: Re: b4: message-id from deps added to cc list?
In-Reply-To: <7hh6by34mx.fsf@baylibre.com>
References: <7hh6by34mx.fsf@baylibre.com>
Date: Mon, 19 Aug 2024 16:46:14 -0700
Message-ID: <7hr0akf54p.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> Hello,
>
> I've been happily using b4 for awhile to collect and apply patches
> locally, but finally starting using it to manage & send patches.
>
> First, thank you for all the work on b4.  It's a major improvment to my
> workflow!
>
> I'm using b4 from the stable-0.14.y branch, and I noticed one pecuilar
> thing on the series I just sent[1], and that is the message-id I put in
> the deps (using `b4 prep --edit-deps`) correctly showed up as
> prerequisite-message-id, but for some reason, it also ended up in the Cc
> list, leading to bounces for all mails in the thread.
>
> I double-checked managed cover letter (using `b4 prep --edit-cover`) and
> it is definitely *not* listed as a Cc.
>
> Looking back, I do see it in the Cc list when I `b4 send --dry-run` but
> I didn't notice it before sending. :(
>
> How is that getting into the cc list?  Is it grabbing this part of the
> cover letter:
>
>> This series depends on the support for the new TI SCI APIs here:
>> https://lore.kernel.org/r/20240801195422.2296347-1-msp@baylibre.com
>
> and assuming that's an email address and automatically adding it to the
> cc list?

Nope, it's not getting it from the cover letter.

For it to disappear, I had to remove the message-id from the
dependencies (via `b4 prep --edit-deps`).  After that, it no longer ends
up in the cc list.

So it's some how taking this from the deps and converting it into an
email for the cc list.

Kevin
