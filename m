Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE49183CA5
	for <tools@linux.kernel.org>; Fri, 11 Oct 2024 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728664780; cv=none; b=JzfhmGF71rv3W6dT3XGrHQqKgYW5yuEzWAblMisnd4U9Iko8UNwapBxj26eWMVzX3MoAYXgjA6eTMGzAIDBmhzHSj02v4q/kR8aRbU9iWmkLQO1TRTGneBtnIthTAQ468zGnmK+JEIYneEESyjCIS5ATWxETm3MJR28Cmejycmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728664780; c=relaxed/simple;
	bh=nc8arxD1TZqtjncJWpjvO5e1qkNL6zRrJhgzHwSZ1hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqUn1Tcrk1NlkNKVhX5hrykxQDIOl3UDNJjJ8ihbX3Sv8x07rhuV46moUimCmo2InG7pQcqg5jv54A5zeLdQ3Fl/2lg2WGygbKVfjtWD0CSywzMaNNujEnmPh4straBSELC8dNVB1/qMbKXJkuDOim6lAxHlUKkvdGiFKmUf2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrMbkT0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrMbkT0x"
Received: by smtp.kernel.org (Postfix)
	id B4E6AC4CEC7; Fri, 11 Oct 2024 16:39:39 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3C8CC4CEC3
	for <tools@kernel.org>; Fri, 11 Oct 2024 16:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3C8CC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facf48166bso24114491fa.0
        for <tools@kernel.org>; Fri, 11 Oct 2024 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728664777; x=1729269577; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4R5NA0e0zQmhWgGKvCTY4H+A/bvyftRkyvm1MsENDPM=;
        b=GrMbkT0xynfOHj+c7PvUJEbBUrmx9/wXEYBA4W7Jywpa/Qn6FrUtpbUQ6lRYl1fbcB
         GSHkI0bH6Wgs1f+yLJ2SdU3idfwVopKB6mc3zt0KaxPywqmuOZq6KuxbsCA66L5jBACM
         oihtq/YlLPQO8yLHUj6Do5NGLMxRHOVSS1AGcyJFewfTUqVaLA73hVxXQxR2Tu1LO4Yb
         LYvXz5RWdZop1mAcKG2xEDOUSMXKPZ5L/4DEyw9qx5GOteV8x5MSGY93uCIsMdN/T3iC
         yFiz8N0TB0fLBbfGVE4rjaspUHl2EG5fT0sE/UL1usoXo/l3dSc81VtDbqQIW81cov/2
         Vxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664777; x=1729269577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4R5NA0e0zQmhWgGKvCTY4H+A/bvyftRkyvm1MsENDPM=;
        b=Ujl3M2fTIjb+Gzx5Xcc2a8T8l4a2TSOY2xvKWts1ElLYVCj9AUFUCJTpvkNfULrVJW
         uD+YX68g7SG/Zt+JevMhkbir55uvFzuqzsDO+oLAkMtOdX/QYmoTmIVL8TT6lmZzF3VE
         9256n6JWdpQNCkqXMDjaO3kYjzznMKDJwanLxJafi+2417AZDQDNHtQWLZ8YsB/iJnwT
         41xfiC73RhuSgTud25fcpi93eze4wEDNp1AsBIeH2BiZoWiuiKQGI+vXHVRqQN21bE+0
         qGJrUGGdzZS7F5o5b0rM9JqMg0WSb7ND9xpbZqbOnSlSIcQk29LStBUuli43ts7oGKIV
         blPw==
X-Forwarded-Encrypted: i=1; AJvYcCXJitRZfMk4xZGA3B7jp5bif4LRP3ZmJXXzXjXuABDHMEi+LB4HwM0xITyKAIqvUplCRXvYrQ==@kernel.org
X-Gm-Message-State: AOJu0Yx2lRgjyUyz+62X1rklM4v4oS5Sd+ZBSaQgn8JFkT3713CE6x0t
	PkSfL4OZ6wy3sF2SBZjWlUfbRg2t5PtGJJEwHVbUHU2SdYufwjv1GbzgeTbOcGWQaZ2JKqVa7q2
	OgdJq5VtHoQbrV3ECjVO6gAZk4P0=
X-Google-Smtp-Source: AGHT+IGXjpw0/ykDsdfELwXYgmak588/fKMNg1MxpiPoMH3F26OCTFBMQQAxe19ePHsginqLq02UUok2BJqKiFamQCU=
X-Received: by 2002:a2e:bc26:0:b0:2fa:d3a5:189c with SMTP id
 38308e7fff4ca-2fb3f2b22a7mr1218711fa.36.1728664776653; Fri, 11 Oct 2024
 09:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <17fd26a64c611f64.779eeb9e361f5655.8f7af20c5282c140@lt-cwhi-0222>
In-Reply-To: <17fd26a64c611f64.779eeb9e361f5655.8f7af20c5282c140@lt-cwhi-0222>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 11 Oct 2024 17:39:24 +0100
Message-ID: <CACvgo50XO5M1ZHQPO-J8D+cSUftKqUFytJTwHmMnNMhMSEBJ1A@mail.gmail.com>
Subject: Re: [PATCH b4] b4: support optional shell completion
To: cdwhite3@pm.me
Cc: brandon.maier@collins.com, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 18:12, <cdwhite3@pm.me> wrote:
>
> > Many tools support this by having a command line flag that can generate
> > the completion scripts. In the original version of the shell completion
> > by Emil Velikov this was supported with `b4 --print-completion bash`,
> > but it was decided against to avoid bringing in more dependencies[2].
>
> I would recommend using a `completion` command instead of
> `--print-completion` to generate the completion scripts. E.g.,
>
>     b4 completion bash
>
> This is a more common pattern and is used by many other tools.
>
> > +Shell completion is provided by the command ``b4 --print-completion
> > +{bash,zsh,tcsh}``. To enable shell completion run::
> > +
> > +    eval $(b4 --print-completion bash)
> > +
> > +To make it permanent on new shells, add that command to your ``$HOME/.bashrc``
> > +or ``$HOME/.zshrc``.
>
> While this works, the more common pattern is to echo the output to a
> completion directory which is auto sourced, for example (bash):
>
> For global installation:
>     b4 completion bash > /etc/bash_completion.d/b4
>
> For user installation:
>     mkdir -p ~/.local/share/bash-completion/completions
>     b4 completion bash > ~/.local/share/bash-completion/completions/b4
>

^^ please, or the equivalent I had in the original patch. Better yet,
if anyone has a nice reference to explain these kinds of things, just
use that.

Mind you, I never fully understood what the dependency concern was,
considering it was optional since day one.
Then again, it was never a hill to die on. Plus b4 is an awesome tool
- thanks again Konstantin.

HTH
Emil
