Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9779EF
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 19:03:50 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id z6so7960256qtv.0
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 11:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLUCcJTUNxB1agRfhxh+fL/h4MmDM5Cv6XZIMtq167A=;
        b=Pnobt/BuD5T0aaDMa6a2noOoPG6xs4trpBeIoYpVkitZxAgXqlPg4XlRgWo76vXYKD
         g/7EiYKcYvEHQ7EtT4j03gGOPCzTDGCpEpkzPNLpNWtiEPCksVn7iz/yyv3T5+EKIRkf
         F/015pXe1+lr2dD9tAfW3fVDbes5vyCOoCDOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLUCcJTUNxB1agRfhxh+fL/h4MmDM5Cv6XZIMtq167A=;
        b=a6QM0ddrDl22bd3GtC8JJsAq9ttETHYdDaq4vf19hDxzmgmf8WVf3aEf+b5UzuDLhF
         qEGdJY74mSL3u/8aVyMMi3Xoa4JJ1hfd6m49dGw+XOZCaRh7KsYrnJva5UMw42zCdRIp
         weHZwJL9HSyNh4HRak91zJHpxJOcnP4p96P4yO3ybls7v5wC2pBzxkM/XGwR0u5v6RRS
         X6gr7KRNPGCgffUVRVGtOcOopiY8OoFvGtxCN5DrmM7giUkfaVIawXCY0/RTqrOEbsL2
         v0+PeiPfJ8cBGC5cVPZQ9LwZv2+UvTsGYcGcGZzClY0JrTCHELNsubI8VRl4zE771U68
         0U5A==
X-Gm-Message-State: AO0yUKW1MRWqZIX/Bbf/k8YJCeHNaKU5GdFvQL7Ya2O1S2jPGe411ppx
	8jiecGZx3IUUXw1l9jrxNpskq9VuY+ERc6nD
X-Google-Smtp-Source: AK7set8Q6kDL/8E6U/i5rif+iXZl/BmHZXraQyT1ASc5lgUn3qpKxL1XucQ1wj4dNakvHAcNOBK1Xg==
X-Received: by 2002:ac8:5f47:0:b0:3bf:dd45:ed68 with SMTP id y7-20020ac85f47000000b003bfdd45ed68mr369902qta.47.1677524629801;
        Mon, 27 Feb 2023 11:03:49 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id p3-20020ac87403000000b003ba2a15f93dsm5073901qtq.26.2023.02.27.11.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 11:03:49 -0800 (PST)
Date: Mon, 27 Feb 2023 14:03:48 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --add-message-id argument
Message-ID: <20230227190348.wbvqvpduk74x5yy4@meerkat.local>
References: <20230227184855.kkwdcweahglujppo@meerkat.local>
 <mhng-285f5c62-3d67-44c8-b2d0-64c8840b3873@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mhng-285f5c62-3d67-44c8-b2d0-64c8840b3873@palmer-ri-x1c9a>

On Mon, Feb 27, 2023 at 11:00:03AM -0800, Palmer Dabbelt wrote:
> > I'd like to go a slightly different way about it. We already have a
> > "b4.linkmask" parameter, so I suggest we also add "b4.linktrailer", such as
> > you can specify:
> > 
> >     [b4]
> >         linktrailer = Message-ID
> >         linkmask = <%s>
> > 
> > This would additionally allow someone to differentiate Link trailers that
> > point at code-review links vs. any other links.
> > 
> > Does that sound like a potential alternative to creating another runtime flag?
> 
> IIUC I can put that in each repo's config?  In that case it's actually
> better, as I don't need to remember to type "-l" in Linux and "-I" in QEMU
> ;)

Yes, and you can also add it to wtglobs in get_main_config() in init.py, which
should allow setting this in .b4-config for projects that want to add that to
their toplevel.

Do you feel like doing a v2 with this change?

-K
