Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347370
	for <tools@linux.kernel.org>; Sun, 16 May 2021 22:52:49 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id j19so3652090qtp.7
        for <tools@linux.kernel.org>; Sun, 16 May 2021 15:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uSg6OMuIUV+x2oue1Esl0Ff7QPsXShm2NrD4E99nPiw=;
        b=TVqiMhu5Vr2jRMHmm+a8vKMm9awpIGzEYGLoP6Wb56ByjTmX+chuDCDuenSv/VNXIe
         7r+DLP69f1Gbmu85/YUTWvmuIRFhzLUF7FsGz5jOBZv5zRDx5/x99XhwPSnEL7ey0tZ2
         83ZL26oPEQTujbKRTVFxKuWOFIxZxWhQvsAfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uSg6OMuIUV+x2oue1Esl0Ff7QPsXShm2NrD4E99nPiw=;
        b=TOgVPgexv3WmGV1DvIhqn1YRy75UXhn0Z7bFzNaFre+/L0JBUgl3hyAuuKwIaINn93
         QXzWJCmaW7Fr9Ja2LUven+ttLt0ARKLi9Yu0924gPMDB0a96GyQkjojG71oPJNIdVe5+
         eg3XKSoYvJtdpmpv1zNzW7vCT4Ai2IFzGLg2tuP6BaGnOT7YunL85Yhal5uJd+zAFlYN
         c+txJO9vIFWkgKUmYWPm/4dIT/vWCFe/HceLg66RCio8YDLE2yeuJSnPpvyMU3uV4qsF
         cKwyOfuCXuGt8toAG8TyNV+UJ3xgk6veUj7GuGOf++CbosMdsGXaf0yTR2Ze5DKYzTZQ
         /Dgg==
X-Gm-Message-State: AOAM530wmpw2sGGYsKcGLkfd/e1rWXj9G6T8+dArzrSxQwGNkw+m3QgZ
	qaXwtjVqRVNIdlR83O8KSCbwwPQSpzuITQ==
X-Google-Smtp-Source: ABdhPJxTpyD3kDveQdowEiymuQwxlCHZ4dob6k1Qg+DDTEfXAS35G9gEilrAi6iZw7EjqsD+O4+JhA==
X-Received: by 2002:a05:622a:549:: with SMTP id m9mr22579521qtx.152.1621205568249;
        Sun, 16 May 2021 15:52:48 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id e20sm3404851qto.88.2021.05.16.15.52.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 15:52:47 -0700 (PDT)
Date: Sun, 16 May 2021 18:52:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 am support for partial series updates?
Message-ID: <20210516225244.ye7ty3pq5fzhpqzl@nitro.local>
References: <CAPcyv4ggbuHbqKV33_TpE7pqxvRag34baJrX3yQe-jXOikoATQ@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPcyv4ggbuHbqKV33_TpE7pqxvRag34baJrX3yQe-jXOikoATQ@mail.gmail.com>
User-Agent: NeoMutt/20171215

On Fri, May 14, 2021 at 03:50:21PM -0700, Dan Williams wrote:
> I recently had someone grumble at me about my requirement that they
> repost a full series just so "b4 am" could autograb the full set even
> though only a handful of patches changed.
> 
> As an experiment I tried replying to a patch to update and marked it
> v5, but b4 am reports:
> 
> # b4 am 162096970332.1865304.10280028741091576940.stgit@dwillia2-desk3.amr.corp.intel.com
> ...
> Writing ./v5_20210514_dan_j_williams_cxl_acpi_introduce_acpi0017_driver_and_cxl_root.mbx
>   ERROR: missing [1/8]!
>   ERROR: missing [2/8]!
>   ERROR: missing [3/8]!
>   ERROR: missing [4/8]!
>   [PATCH v5 5/8] cxl/acpi: Introduce ACPI0017 driver and cxl_root
>   ERROR: missing [6/8]!
>   ERROR: missing [7/8]!
>   ERROR: missing [8/8]!
> 
> ...which is helpful if v5 was partially sent, but not if all the other
> patches don't require updates. This feels like a "WANTVER+" option
> that means "grab latest, but fall back to vX" for missing patches. Has
> this come up before?
> 
> What format would help b4 detect this situation? By default tooling
> would make the prefix be [PATCH], I manually made that [PATCH v5 5/8]
> and forced the in-reply-to message-id to the v4 version.
> 
> I'm nearing the point where handling this manually is more painful
> than figuring out a b4 patch, but please consider this for the b4
> feature backlog in the meantime.

I was generally against handling such situations in the past because
they introduced ambiguity. E.g. consider this two-patch series:

[PATCH v2 1/2] First patch
\- [PATCH v3 1/2] First patch
[PATCH v2 2/2] Second patch

It's unclear here what happened:

- is it a single-patch reroll as you describe above?
- or is it a full reroll and [PATCH v3 2/2] simply got lost en route?

However, we are probably safe to treat it as a partial patch reroll if
the following conditions are true:

1. The series has a cover letter
2. Individual patch rerolls are sent as follow-ups to exact same patch
X/N (e.g. [PATCH v3 3/5] is sent as a follow-up to [PATCH v2 3/5].

Let me brainstorm about this on Monday and I'll share what I came up
with once I have something to show.

Best regards,
-K
