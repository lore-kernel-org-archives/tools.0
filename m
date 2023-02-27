Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF679EF
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 19:05:20 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id k21-20020a17090aaa1500b002376652e160so7239519pjq.0
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677524719;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+9fixrwIUIVkNU0OaJMKJP2740q+SmjOlQ277frw1w=;
        b=rv2x8qJ6ZP/19TZyW9EXn4iCFyt6zqMHIhQnoKJVuRbOPLXIPfs9kY+lxdb52iFcdT
         Gf4tE+rybK2ysCptw0MdODS6XnFe3o3fW/oPr2aNJW/RQPZmWsS4OZSSMZwyqyynRwW/
         hNUexSNKaXlrDjBQ9g1Mxug3ZvjTa3zmI1KDbgs+RogkeDPQW/kyABNhx8zfQ8knTEWN
         Bc6VGAU8O9+IbScHaFGHX2BPPUiegZZpsKIW59eV+DgVUlgnHixsQj0f1xKiuJTR3IRh
         sL/KzBvWP/3DCJjDf7uIkQP0o7nhFSOXWSC799guzgn9E92OeMg7cOheWnRvCUfXwhoP
         q0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677524719;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+9fixrwIUIVkNU0OaJMKJP2740q+SmjOlQ277frw1w=;
        b=1HSYsO/8gA++QWhLOk0BBAhsDYfT6ZL8oVAVWMNe4OG32oL589W6lsyEFQU1GmiyA3
         MP0Ag9TAhOnycd5nrce2nhg9EpdY4d8rEk3M4Au64Iao6jymnbO0AT2iQKxOQOhvRPU+
         ApTaaetQi2WVdBK3V6WXUTsHB46tTv1Ml68wLBdMvfUyg4LyXw2YIS9L1CpVUm/8Xg9E
         yLB3DMxB9l/S/yU8tz6X5VmpksWD0pahPqys2WgXJwU7+TGX6X5po6egrkk4T/B98GCl
         f2tZ/2VD9NJVvAWpeIIAuGWcvlOnEbDE6iGnJ4AFcnWvQdZ63mHkhO8+AW4ehILoqJ7X
         XH4w==
X-Gm-Message-State: AO0yUKXOUsVq/60xpuVfQGpZz9eG022KAUtR7Ecpsva+rVEB6UjuKL9T
	cuoSlG9IffVg0tbz7Pr5MbEK4J3DoDS9Ikb2
X-Google-Smtp-Source: AK7set8xs5zhsgw1+MYRjI+VkEYa5ql7EFkjt46xXn67R83byRxPCQilId7KFTmtoyNe+rcc8Cv73Q==
X-Received: by 2002:a17:902:e541:b0:19c:b4e3:c65b with SMTP id n1-20020a170902e54100b0019cb4e3c65bmr13633plf.8.1677524719546;
        Mon, 27 Feb 2023 11:05:19 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jd5-20020a170903260500b0019a7d58e595sm4999032plb.143.2023.02.27.11.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 11:05:19 -0800 (PST)
Date: Mon, 27 Feb 2023 11:05:19 -0800 (PST)
X-Google-Original-Date: Mon, 27 Feb 2023 11:04:34 PST (-0800)
Subject:     Re: [PATCH] shazam: Add the --add-message-id argument
In-Reply-To: <20230227190348.wbvqvpduk74x5yy4@meerkat.local>
CC: tools@linux.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: konstantin@linuxfoundation.org
Message-ID: <mhng-3ce78a47-f2c4-40a1-86fa-7339531c2250@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 27 Feb 2023 11:03:48 PST (-0800), konstantin@linuxfoundation.org wrote:
> On Mon, Feb 27, 2023 at 11:00:03AM -0800, Palmer Dabbelt wrote:
>> > I'd like to go a slightly different way about it. We already have a
>> > "b4.linkmask" parameter, so I suggest we also add "b4.linktrailer", such as
>> > you can specify:
>> >
>> >     [b4]
>> >         linktrailer = Message-ID
>> >         linkmask = <%s>
>> >
>> > This would additionally allow someone to differentiate Link trailers that
>> > point at code-review links vs. any other links.
>> >
>> > Does that sound like a potential alternative to creating another runtime flag?
>>
>> IIUC I can put that in each repo's config?  In that case it's actually
>> better, as I don't need to remember to type "-l" in Linux and "-I" in QEMU
>> ;)
>
> Yes, and you can also add it to wtglobs in get_main_config() in init.py, which
> should allow setting this in .b4-config for projects that want to add that to
> their toplevel.
>
> Do you feel like doing a v2 with this change?

Sure, but if someone else wants to take a whack then I'll be more than 
happy as it'll likely happen after the Linux merge window, QEMU soft 
freeze, and GCC branch...
