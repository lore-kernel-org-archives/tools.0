Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A44A13D521
	for <tools@linux.kernel.org>; Thu, 23 May 2024 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458299; cv=none; b=lXGhOVNJXW8P/FrliY00KaKGnqNOljNtv4QTaNoA2ArY9A20h59AIQ+WfM4KyHKiIIIsFEgyCGP5NZAUkw65/vwamaVwHHIZ+vmvj/9c5W6k6cQD9opKkTe4/+rjuHJx3c05WmSKPTFRgmoLYFhTNqpLR0FtHp7nNTwtB+8uipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458299; c=relaxed/simple;
	bh=ksjtKX6WgVZwdXsxtA5zmETHjcx/EVpSw3Ixp45AcEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EpfFD4nl8cBiR2kN5pMtxr2YPFdxH9V8h9HvV+lsqSqh6xmoSq6RxiTuwVVH68k9fp1SVUOBdMVwCo3OrDP26JqnTirG3SFFNe6zpAZaroQNlCBt981tsavCon4NAZBWYP+zpjEgxYBCmlVI6jnRAV+JVFUvMqfQYcz49gzMP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=imWvE484; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="imWvE484"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42017f8de7aso51918465e9.1
        for <tools@linux.kernel.org>; Thu, 23 May 2024 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716458294; x=1717063094; darn=linux.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2ceVavBDQ4QwR2fZTuiAegPYxXBYeUgZcTFPZB+L8w=;
        b=imWvE484pnpEDjdwBTEMm1wU8LwDeoAdQ68/qxh3wvW6hIz3MpWDVV7VTMnDFKT4R6
         gk7HQZiSalmIs5W8kElUorTKrUZSaXVwO4V6jx34rH16uI/6NJK78nXip5UtdfJnjnh5
         1Knq/7PpP6JBwSsss9iLQXuZJvFhjT7yQbXOCBEhtCzJULGpqTL7QYgN1Ell2h4R4e/o
         cljwo7ZGTkOfnPak9GICmW8wXiFL+Mr6cOrVvpiGTqkjA1TAH14HCdqx8HfU4ZJKfriY
         EwIXWmO98hn70IxAZdHoKfvQDTrygmCOqy46og+F/+LQvYu/cw9fqn54rgATAaO1Jyk9
         rqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458294; x=1717063094;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2ceVavBDQ4QwR2fZTuiAegPYxXBYeUgZcTFPZB+L8w=;
        b=uk/l7HNEXmcVfbgZhxBkXveybqcJHMXIITe7J+/BbF+tFc2SFLyj1k/xKVugmtpph6
         3JjzTZLFOHRZh9mG62IKlrKreCFhxkH8Y0hct93wKuqCr1fkUjSupIC4v2wEDISoy83c
         bpBdoo/E5Uher+z4x4biDO6wkWscMbIg8XtWr/FA7XxnmZbVWR/Npk8b2ZN0oMIY+uPP
         x64KHkNTVmuMmzGuP3gEHxcBUuaoE6h7uXeze3XbjxPaOIPN5wAPKmHv7mjBZxSb/NHb
         /LjqpqnlXxTUKd4U0o4gwxyuQQjxss0tV/9rxv0t2J4nLKbyUSoidhn+EXf2ub0P6rZc
         3hmw==
X-Gm-Message-State: AOJu0YwChk1EFNWFqB+KD9Oops6JNMpyk0dGa4NmatCvhRu0pz8od1Gk
	e6MzwZ/+T63goE644beH4SA7fTfdq74ZZSJLhK1LPLHjeQkMAZG02JLHHJwDNAo=
X-Google-Smtp-Source: AGHT+IFBv8+WHKSIbpoW0ECwQrFnmxMZyGt3mnicj2rIZBcbLGHNmRTGz9B1Jp27HFrLkkVmQAH5Rg==
X-Received: by 2002:adf:f64e:0:b0:354:fbc8:17d1 with SMTP id ffacd0b85a97d-354fbc81b3emr677447f8f.61.1716458294371;
        Thu, 23 May 2024 02:58:14 -0700 (PDT)
Received: from localhost (lfbn-tou-1-402-59.w86-206.abo.wanadoo.fr. [86.206.229.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354f44d6790sm2018092f8f.52.2024.05.23.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:58:13 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep-perpatch-check-cmd conf via .b4-config
In-Reply-To: <da201b46-c653-45ea-bec2-5110c8116c8c@kernel.org>
References: <87sey8yksi.fsf@baylibre.com>
 <da201b46-c653-45ea-bec2-5110c8116c8c@kernel.org>
Date: Thu, 23 May 2024 11:58:12 +0200
Message-ID: <87pltcyhmz.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Matthieu,

Thank you for your reply.

On jeu., mai 23, 2024 at 11:45, Matthieu Baerts <matttbe@kernel.org> wrote:

> Hi Mattijs,
>
> On 23/05/2024 10:50, Mattijs Korpershoek wrote:
>
> (...)
>
>> I've noticed that v0.14+ contains the new b4 prep --check command.
>> 
>> This can be customized via b4.prep-perpatch-check-cmd [1]
>> However, we cannot customize this via a project specific .b4-config [2]
>> file.
>
> Even if it is would be handy, this feature has been explicitly removed
> for security reasons:
>
>   https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a1360385

Ah indeed, I missed that. Seems like a sane reason to not allow this.

>
> There could be a solution similar to 'direnv' where a 'b4 allow' command
> would mark a version of '.b4-config' as trusted, e.g. by adding a
> checksum in the local git config and checking it before reading the
> config file?

Maybe that's a better idea.
Since you pointed using local git config, I actually gave this another
thought and I can solve my problem by using a project specific git config:

$ cd ~/work/upstream/u-boot
$ git config b4.prep-perpatch-check-cmd './scripts/checkpatch.pl -q --terse --no-summary --mailback --u-boot --showfile'

Thanks for pointing me in the right direction!

Mattijs

>
> Cheers,
> Matt
> -- 
> Sponsored by the NGI0 Core fund.
