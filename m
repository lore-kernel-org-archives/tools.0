Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802271
	for <tools@linux.kernel.org>; Thu, 22 Apr 2021 18:09:13 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id s5so38466342qkj.5
        for <tools@linux.kernel.org>; Thu, 22 Apr 2021 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=y3ktPdj+pm52S+dOqrPfWpye/O0Sdk06H6yN1Rz1tF8=;
        b=Cek+H5Stgqj0c0i/n2LSTiVbC1u/XBArOd7GgTuS5fJwWmmgvO+YgMerAgxAm/YLyq
         7b9tTKe25yeWIrVDp/uTjtLZe88JxLJhJ465Ji5LgOX2/vDmvAX3CvyuWKncKB+Z3bqn
         hXyPhpylf6YMJjFP5smexouKdmjBbkZLu6noo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=y3ktPdj+pm52S+dOqrPfWpye/O0Sdk06H6yN1Rz1tF8=;
        b=nCdmcONRHTIDlSoj075RaNR8a5xdK1R0vf6hptJfYFULoJ8yoH3NKFY/aUwxrqGgqw
         wpXbvUP4AsCpIV/vqnaN2j0ykUuW45ur/wHASmzP4sox4cwrYUyOhAphUMDEEnOZTtmT
         qL+1WfbwC0MeflngLy9AJ4LfepHM4a0C/DRBk3uLWGweS7G3DV7I0Pxa3XvIDzBtpXAe
         Qzr03UMrArPqSJXu9aqL+fqyBzcTQUHmQ03pD0TzrTHZRvWmhCSOA5lKxJECb0E9baG7
         ssNgaX36zS870WPwCPMZ9fPCrrfJujlIW37VIHLFq5d8lVAikSsUJ133pbfcOz0R3Bl6
         g27Q==
X-Gm-Message-State: AOAM533GCnh5gfvxFNxvGsffktvsKU2LvQj54zLOSrdsd3sXM7talw1b
	O6OLiPuLv2lWrHiKgcsGv2+E3dSnxeBH4p9q
X-Google-Smtp-Source: ABdhPJx9MELPkcZYu4/efxtiLhX3HmcJ0p7tWOOYEcpDXslHVDxBsJQkcoPtJHXEujQ5nev38tTd8A==
X-Received: by 2002:a05:620a:440a:: with SMTP id v10mr4801818qkp.357.1619114952638;
        Thu, 22 Apr 2021 11:09:12 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id j13sm2694026qth.57.2021.04.22.11.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 11:09:12 -0700 (PDT)
Date: Thu, 22 Apr 2021 14:09:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kyle Meyer <kyle@kyleam.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] Delay dns.resolver.get_default_resolver call
Message-ID: <20210422180910.kwsn3g5punafbyid@nitro.local>
Mail-Followup-To: Kyle Meyer <kyle@kyleam.com>, tools@linux.kernel.org
References: <20210208040722.31203-1-kyle@kyleam.com>
 <87fszji4pb.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fszji4pb.fsf@kyleam.com>

On Wed, Apr 21, 2021 at 07:43:44PM -0400, Kyle Meyer wrote:
> Kyle Meyer writes:
> 
> > When b4.attestation-policy is 'off', calling `b4 am` with
> > --use-local-mbox is conceptually an offline operation, but it still
> > requires being online because get_default_resolver() is called at the
> > top-level of b4/__init__.py.
> >
> > Support offline operation by delaying the call to
> > get_default_resolver() until it's needed.  Note that
> > get_default_resolver() already caches the result, so there's no need
> > for b4 to store the result as a global variable on its end.
> 
> Any thoughts on this patch?

Sorry, Kyle, it wasn't my intent to delay for long. I had to refocus my
efforts on something else for a while, so b4 took a bit of a backseat (plus,
I'm waiting on public-inbox 1.7 to be out so I can drop a bunch of redundant
features from b4 before putting in any work on new stuff).

I'll deal with all outstanding patches either tomorrow or early next week.

-K
