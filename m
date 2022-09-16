Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211A5CBE
	for <tools@linux.kernel.org>; Fri, 16 Sep 2022 16:59:54 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id s9so13912232qkg.4
        for <tools@linux.kernel.org>; Fri, 16 Sep 2022 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=OGMFIw6TkWIlFExCweTOAmERgg8EGjFKAD4+6nnQxQ4=;
        b=iMQVx/PQXnH8dQGesKcE8FPzfG4SetErLKuCQbp8A/y2wn6GNywLQapsqRs2DbL2eJ
         6ENgOiGMSvCVfa0MOD/z6PTDNG3i0MiTe2twYPSPX0j/6lJ5B0Q43AiArjxOWs3IjILC
         v2GM4gbEphg9WaDvxupBZYwKGCxY+jWvDjxCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OGMFIw6TkWIlFExCweTOAmERgg8EGjFKAD4+6nnQxQ4=;
        b=B5OC8eCed3pffQg9AwLITCywXbL4NGk6lpOlXSVbyIyjFXtyGHBuMsnwRtXPpio4Nc
         h7/4wffi2McSAaYuqXPdy7zE25tyEOlFgKWFeTSfr97WmfxmZ9rWT2jZQrGqDujsM4NZ
         Ogc84pwx0U8LEorWt5h2VFGnelyXgASdVSKJWESteH3AmS6I0qarssnfdZnO0ZtGwbvE
         PmQTRhYDffCPnX+0s3TAIIV/MoyVAODd0gEZC+n1+A4KV58uweqHloOWOi5GNjnJE7YZ
         w8NfcOipec68lvezwkVIu+QZkoXCtOf+egX/Qrnb9HbQnG5LzPXCcjMRhUpl6xpFQbId
         L6rw==
X-Gm-Message-State: ACrzQf0MeantZ4CuAO+nlo9/qSekRn2RHHucu2zaiesCeEXuJNwdwd4J
	3Bn3QpjZM+ndoWAJJhgD3kBuqukGMJofiw==
X-Google-Smtp-Source: AMsMyM5MaPEq6e0gSL/RPRnUDe38rS9zRVusGr3Hf/z7t+GYqFtQzXWsX+H2FYhsFDzf7TP54p370A==
X-Received: by 2002:a05:620a:1265:b0:6cd:f082:a97c with SMTP id b5-20020a05620a126500b006cdf082a97cmr4678922qkl.413.1663347593140;
        Fri, 16 Sep 2022 09:59:53 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id dm51-20020a05620a1d7300b006ceb8f36302sm3370004qkb.71.2022.09.16.09.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 09:59:52 -0700 (PDT)
Date: Fri, 16 Sep 2022 12:59:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@linux.kernel.org, lkp@intel.com
Subject: Re: trailers update and bots
Message-ID: <20220916165951.onu7f3p7xl7olw5u@meerkat.local>
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
 <20220916162418.plk3jhc6hezv2ace@meerkat.local>
 <20220916163101.2ij6uznmymqvgklt@ldmartin-desk2.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220916163101.2ij6uznmymqvgklt@ldmartin-desk2.lan>

On Fri, Sep 16, 2022 at 09:31:01AM -0700, Lucas De Marchi wrote:
> > I'm not sure there's a universally "better way". One thing I considered is
> > adding an "trailers-ignore-from" setting that would allow you to keep a list
> > of trailers that should not be automatically inserted, e.g.:
> > 
> >    [b4]
> >      trailers-ignore-from = lkp@intel.com
> > 
> > Would that be a suitable solution?
> 
> yeah, I think that would be something good to have. 

The option is now in master and should be out later today as part of 0.10
release.

> Maybe we should also communicate a way for people writing these bots how to
> prevent it to be considered a trailer? Would it be sufficient not being in a
> line by itself? That could be a change done on the lkp side I think (Cc'ed
> here).

I've suggested it before. Any non-space character in front of the trailer will
make b4 ignore it, so something like this would work:

    If you fix the issue, kindly add following tag where applicable

    | Reported-by: kernel test robot <lkp@intel.com>

> Then people giving "conditional acks", i.e. it's acked if something
> changes, may also have a way to avoid b4 auto-inserting the ack.

I'm not sure people can be fixed quite as easily as bots. :) The same
principle would work, though -- ask them to provide some kind of non-space
character to prevent automation from pulling the trailer in, e.g.:

    If you fix this, please feel free to add the following:

    ? Acked-by: Alice Developer <alice.developer@example.com>

However, knowing that changing people is hard, I expect this is just something
you have to watch out for.

-K
