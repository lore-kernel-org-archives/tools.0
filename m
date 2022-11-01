Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF92A2112
	for <tools@linux.kernel.org>; Tue,  1 Nov 2022 15:13:42 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id x15so10492960qvp.1
        for <tools@linux.kernel.org>; Tue, 01 Nov 2022 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBUz9xidKcyAmfufSwKD+9wwTQJCe8m53sPImB6DPGc=;
        b=CoxjZhEdqEZ5QHMLGN/vqaQhwRjCMxBEFjYHE/kbiVZeFQBbi+Fwefw0H1tEGvMdsN
         NlFo65jFJulXfG5fiXCYKtTQodLV+hzD3SOALvAIaXMAtljxkvo5Q+Yc4LGABULxiilP
         bhf5ACGBpDA/uNvGH8IG9d2kshCOS/4wYMx7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBUz9xidKcyAmfufSwKD+9wwTQJCe8m53sPImB6DPGc=;
        b=2Da1ew1B83wC2RVDEtWMIAK0TsF11r7O05XJjU6zPaHF6qULzlNUt4Oxp01f0zFbkY
         5Wvc+bWIkkFjDo3N8Wj0x5jJ9Vh+K+VeI4evtWLI4K78Jyww+qtluHkEM6KGvbamfCv8
         VcdMS+Tp6egRhef9+1wBY4CEscJQdd6r5RYZ6wI7d4H9Cq4r6Lr5SU8Al2hD43paIKyj
         YUzeaoxp+i04+PoSWRZFOyreN6sRMvbCl35HccezBekwEX3pzltUNSlWjvXJdXGfKkn8
         ilhRIyTfUfg5oqA9bIeif9rVsjbSkbEaKfia4ByT45H75ioJLLvxAQqpEcrXSLnasYz5
         4zcA==
X-Gm-Message-State: ACrzQf2L6CHRbB1EkD4bKjdO5pY1Muxkv/b99MjVxWoPk1k4Bk0/yzBS
	UcmpZNtyRw0aPGKRS4pGlOSaww==
X-Google-Smtp-Source: AMsMyM5yQ68v5wa+UsQYNNMUDFay0HnSqCAc4ZERvzV5QQCEnzN39+Hbz2qyi1f/xxcpcmRQlUftDg==
X-Received: by 2002:a05:6214:1c8e:b0:4af:8570:8878 with SMTP id ib14-20020a0562141c8e00b004af85708878mr16388660qvb.33.1667315621719;
        Tue, 01 Nov 2022 08:13:41 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bn4-20020a05620a2ac400b006f9f714cb6asm6600845qkb.50.2022.11.01.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 08:13:41 -0700 (PDT)
Date: Tue, 1 Nov 2022 11:13:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: b4 ignoring Reviewed-by: in quoted-printable email
Message-ID: <20221101151339.rhp6hys6vnxm4skj@nitro.local>
References: <CAMuHMdUsfc-NNHswtS8jjhWFwk4fX2yvynKh4q0x_u01bnUQBA@mail.gmail.com>
 <20221101123035.xkytwxrhrkhjadc3@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221101123035.xkytwxrhrkhjadc3@meerkat.local>

On Tue, Nov 01, 2022 at 08:30:35AM -0400, Konstantin Ryabitsev wrote:
> It's actually because that message has a subject that doesn't indicate a
> follow-up (doesn't have a Re:):
> 
>     Subject: [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error
> 
> I'll see if we can recognize this situation, but it's definitely an odd
> corner-case.

There is a fix for this in master.

Best regards,
-K
