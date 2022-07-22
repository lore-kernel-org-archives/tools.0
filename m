Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516B6AD4
	for <tools@linux.kernel.org>; Fri, 22 Jul 2022 19:26:28 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id n2so4346451qkk.8
        for <tools@linux.kernel.org>; Fri, 22 Jul 2022 12:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jKAL0DetkntTrryl/C0HiBboMJFqRYiuRVbGVCbKSUM=;
        b=N+zyzWNvvf0xidO4VnvbEFwOeu/l8wa5gHFzil3foPbl0OKa6fKHzRcSVTEg4ARhie
         pfyDwX+1HlKcYxcBbGEqEtkQdsNsDbSmCKcwNf7YUpdJbE4ZyHe0CAOuJroJVq0b6O3q
         AHKmTM6GAxdjV5QOcTwgYTwKA4X+yjzwR2HeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jKAL0DetkntTrryl/C0HiBboMJFqRYiuRVbGVCbKSUM=;
        b=sUD94RhY1rGp+6WUOlHUSVlp3BKxxeIoD7wcAnJw86w4uNvMyaOeWLqIT7Z2Z1KARD
         /MVvqzILvF4T6r8IoDknEuVxq5kFFPJ6gzpMfZPDicA1TeJOhtxMjXzpYJfJsUYtJ3kK
         l5//gNxwGvCJlxwAHh+oZZ1qQ3efIWlhcibPSgVMwqYnrdGcpiPZ2fXLGv/zMP632YDN
         eeFz3cT+LopzOpYS7lrSHiOlSrGzqmOEW5fcNEajS7hAuNrV7XuSIglpjOvxjrfm2npD
         G1bz84PYglZY8KfvUb8+SI3crVQ76VtRW0eMimddxYri4NtLMzATL6wW1+9KBTpbtU17
         19sw==
X-Gm-Message-State: AJIora82V3v0XZRuQDSfvs+perMOBnZmZH4NT9SC1SzfEM8oJojUAycq
	vCkjiGEYN/n5uaT/KVbJNLd0JA==
X-Google-Smtp-Source: AGRyM1vmh1+Ba2F8v6/TsGO8E7Qg76V2A0Zt1h3oqlc3lKzds6kO7g15orPFvCQEicLa+U5x8iQh7Q==
X-Received: by 2002:a05:620a:3707:b0:6b5:e205:81c7 with SMTP id de7-20020a05620a370700b006b5e20581c7mr1239582qkb.754.1658517987467;
        Fri, 22 Jul 2022 12:26:27 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id q20-20020a37f714000000b006b5e60c4de1sm3799412qkj.78.2022.07.22.12.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 12:26:27 -0700 (PDT)
Date: Fri, 22 Jul 2022 15:26:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: backtrace fetching message with b4
Message-ID: <20220722192624.apg3jnbawllqk6q4@meerkat.local>
References: <Ytr2B+54jaPQJdWN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ytr2B+54jaPQJdWN@sirena.org.uk>

On Fri, Jul 22, 2022 at 08:09:59PM +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> When fetching 20220722134603.316668-1-Syed.SabaKareem@amd.com with b4 am
> using tip of tree (d952f4b20bc1e80) I get:

Thanks for the report -- I just pushed a commit to fix it. I need to refactor
how we do trailers, since with the latest ez-trailers work the current
implementation is becoming a source of bugs.

-K
