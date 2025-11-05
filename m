Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414932E722
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 19:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762369978; cv=none; b=UwVAZYHj4mNsl5xguMALfPzG0hZfwDqBPZ2velGn/6zQQ6KV6gJBdE7lwmj3nXMXtPtsxFwJQmUO7/gx3LCGrvpTmfFxzvIerYflVsfCkbTJrTqzONRzW7gf9bkvWJbQP2qi1Z8ou/L/InxZp845aah2e0/DkpLdwBzW/Bdc0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762369978; c=relaxed/simple;
	bh=4XLrdxquv4viWLbXvE7859nnx4/kntWPNE9RGiVMeCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ir//o3mK81uCGQRkleqjY8cL7rhYWakpj7fxfvOTAgc4FO1yvO0RhKsu5B1Bj9zl8ruMRBITmdkjL+2LyygbE5JUUyU1cbaGPkKUDGOH3Thxapux8kuGJ4oX19NGogIyZfwAk11Nt28NlZIIzyLyzXFGAsk98svwILah0gJiIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KRPQZLQK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KRPQZLQK"
Received: by smtp.kernel.org (Postfix)
	id D948AC116B1; Wed,  5 Nov 2025 19:12:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74539C116D0
	for <tools@kernel.org>; Wed,  5 Nov 2025 19:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74539C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so283854b3a.1
        for <tools@kernel.org>; Wed, 05 Nov 2025 11:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1762369976; x=1762974776; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HctJZ3teNMhDPst5XbRAtI8SPqgSu/DQ75qzU7a9oA=;
        b=KRPQZLQK95nxanWvrrslaGpcXnYVODowMndDQFSVjwzYgDyNfw7E2V4qKchxp/ugjT
         i98f//hxp2MSNscvmt8zGLV0D1josRbV5LrTiLoH6zgYjHIP24oK1tKIIijY9nQWYYLG
         10CjKMCJB3YPUExkw1jJYxVmbPC+1Yu916OtsNSY7Q5Gb5KBwuagQAUs1+xudXtriMsh
         U5gACW3OFDPdPnoQOUDW5w40rTUrjaZhGa2Ta5y1464FXsdnTmxeYTeEFSHwxcS7yfdg
         HKGVjIeOxM78jF2tSJ4styMrTVGNNUXhlOP4w6NITNfLBmsEr4mvn8AvGjxqj1mLrhyc
         aSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762369976; x=1762974776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HctJZ3teNMhDPst5XbRAtI8SPqgSu/DQ75qzU7a9oA=;
        b=A+wFr3AKJlfQNFdoOx4DnvmeC6KwKCqkg4LbZN1l7m0Kzhhrwv0E+SH6lFVMIjya+R
         QCATst5RNIm223mU0UxIiu4UCBKycSIUbO86yMkdznl6bjRR+OCykTHfkZzwbncXbbs5
         J9mzT0HkuZGETRVLZ6ick5sPFp1kDcDpwvjypihO9Oit+sE3LL9MjynVlvn38G2BDJY7
         xGJRkoXTONr66oRj/L2kOICC1O+npOWI6OrBDaY6IyRP8PP37om7kxT76ytFxoRHk7gr
         5yjptJtjM0LsacOWn+U9ddEifQJDNs7AKP2th2iQ6vY2l+YOyTV75Z6Q8Ubgy+iOAbAL
         sBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/YZFRshWsjx/ZN98P5BqaWKsaGYFeuBYYCBsI9HaPxQXVVBOqXfXD9PR8bvuFUcOtZW3UAw==@kernel.org
X-Gm-Message-State: AOJu0Ywh+dEkPBLPX1/JU0394vBng0dwiU3IOD42Rsb/zrfCE/6UYCRv
	bnP3GGSjqTW3b7j1eECGYtD07jJ+VtCaIs42p/uMdXSVymuxXGd1unTTi/i2LbHvWcdQFxgV+6J
	+iT2A8LifffkfhP1EdN8Vw4j3pquDHwG2wbgDY9Em
X-Gm-Gg: ASbGnctBtdlCk/ccMwM8rRaHjfY147I9bghynH7xgzJg0+GK9MRU9fhWt6+eK1sw1ed
	p5lQvp0euFWBRIva1LHUtvjaUmjLvK597C9g6Y3ZdwOSdZ/EljlUnG6mgOzCS0WTdSdSNkKOJ9y
	NLZaeZHMemsoJrRcaJhTNiAbAbsjwQsxjtiwMVJB5CDEIgPz9QsAV+lPCslhQ5CDkqL7U1jZugQ
	mu+uKDUPYmKz9I9MkYbPwaxjCMhO586R3qel212HFijlf59p4pekoC/4J9R
X-Google-Smtp-Source: AGHT+IEApePcN5MLb3y7xVZ3kQdKPjUTaOLHUbXwLNF76YNhpOUVPbHSH2tQkfphWbeybE0rLnieocouODvvsKj6z6w=
X-Received: by 2002:a05:6a21:3298:b0:34e:a801:8166 with SMTP id
 adf61e73a8af0-34f855186bfmr5084451637.32.1762369975673; Wed, 05 Nov 2025
 11:12:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
In-Reply-To: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Nov 2025 14:12:44 -0500
X-Gm-Features: AWmQ_bmWT5MYLljay0TfAVDcO38_NeHCqk72QRIJgsW1Y0KHfdozsFdQj6UknJg
Message-ID: <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 1:38=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello:
>
> TL;DR: korgalore lets you pull mailing lists directly from lore and put t=
hem
> into your gmail inbox via gmail API. It can do the same with lei searches=
.
>
> Docs are here:
> https://korgalore.docs.kernel.org/

Thanks for this, if gmail throttling continues to worsen it's good to
know there is an alternative.

I just did a quick scan of the docs and while I didn't see it in the
Quickstart or the Usage section, I wanted to check and see if there is
support (planned or otherwise) for pulling/importing specific messages
instead of an entire list?

Often I don't want to subscribe, pull, or otherwise consume an entire
list, but I do want to comment on a specific thread or patch.  With
lore it is easy to read the discussion, but difficult to reply with
gmail as there is no reply-to header support.  I have my own hacky way
of handling this that I don't particularly love, but if I had simple
tool that I could run, e.g. 'kgl pull -M <msgid>', which would import
a specific message-id into my gmail inbox, I would be very happy.

... and yes, I'd be willing to click through the eighty different
auth/creds pages to set it up on my system.  Sadly there are a number
things that require similar auth hacks, and for better or worse I've
gotten accustomed to the extra steps.

--=20
paul-moore.com
