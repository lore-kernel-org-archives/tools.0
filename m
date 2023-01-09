Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDD3C0B
	for <tools@linux.kernel.org>; Mon,  9 Jan 2023 17:29:02 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id l3so1168710vkk.11
        for <tools@linux.kernel.org>; Mon, 09 Jan 2023 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jdpKUUJpl1ixbggzhqVh5kkLF7tv4IRVrI4Kurhsack=;
        b=aDVUXBt0DAmhs8stotHUfkj26XTFMbGXa39q0gWwwcreP3BfjokohiugGaEKf4Tyyy
         RZLjEw90aA2V/TMdj9AHqYubrahj//XBe4y2iG4u0o+tFJbIBU697DYZ5T1Z8Wl+RH6u
         OAw1K08SKgKNkbUjzJ4naMydWm4uH8ObAx4jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdpKUUJpl1ixbggzhqVh5kkLF7tv4IRVrI4Kurhsack=;
        b=TVZQfxbmnITE7ki9tsABFNukbDTpKKCbcJcx8YYB5hKAH+hd6z5yf1gcC94Mv60SjW
         XiyaXCJP0hk2iqMYW+7gJHoUqRg7GU8NQOKYT/v6UfwaxwPHER6WL4RaGf+sqho7MfDL
         PM0bnbuQrosDQlP8ep/jAHkCc6YNb6fsv0+EHOvsHbrqX/w49mpR+M4Zlru3qvdoBrSa
         Jy/nYBg7UqEPKg/QAnJFOrRcXDBCqsEmBH9gmviQNa3hkZIbXY0tb9tfZXRwFDp1swWu
         gQOPAASD9z467WlUQL5Ow4qjqdQ5Y0t5Y2E8K+sZ5K88jsmAXAZSEQ9Ja8auQRuwmSmz
         inHg==
X-Gm-Message-State: AFqh2kr+SDHgJIsRJQZY101VtFyPyq3PzQattOjU1NYVkf+4XXuuZdAU
	tc0JkNlwKeKQRoFbN0GlpdpFKIbAZ8VsLfqa
X-Google-Smtp-Source: AMrXdXsWFpP3WAPfeoJMOxejbE3jsPSzaUT3wNtN7FqJe15Z+2k98PIp/44GIbGIyLub2ptsCfebqQ==
X-Received: by 2002:a1f:1cd0:0:b0:3bd:4318:1dcc with SMTP id c199-20020a1f1cd0000000b003bd43181dccmr30664386vkc.5.1673285341639;
        Mon, 09 Jan 2023 09:29:01 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id y2-20020a05620a44c200b006f87d28ea3asm5642792qkp.54.2023.01.09.09.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:29:01 -0800 (PST)
Date: Mon, 9 Jan 2023 12:28:59 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Cc: Tools <tools@linux.kernel.org>
Subject: Re: [b4] "b4 (shaz)am --no-parent" gets all parents
Message-ID: <20230109172859.2o2gwntkpsvavonp@meerkat.local>
References: <956012a2-6a7b-3347-8b19-975fe71e4ea8@tessares.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <956012a2-6a7b-3347-8b19-975fe71e4ea8@tessares.net>

On Mon, Jan 09, 2023 at 06:24:30PM +0100, Matthieu Baerts wrote:
> Hi Konstantin,
> 
> First, thank you for maintaining this great tool!
> 
> I'm using it for a bit of time now to apply patches in my tree. Today, I
> noticed one issue with "b4 shazam" and its option "--no-parent": when I
> try it on patch 9/12, all its parents are also applied. I don't have
> this issue with any other patches of the series:
> 
>   $ b4 shazam --no-parent
> 20230104171526.1416746-10-matthieu.baerts@tessares.net
> 
> I can easily reproduce the issue when I launch this command on top of
> Linus' tree. No issue with the ID -9- or -11- for example.
> 
> I'm using b4 0.11.2 but I can provide more output if needed.

Are you trying to cherry-pick a single patch? In that case, you should use -P,
not --no-parent (it's mostly for when someone submits an unrelated patch
series in the middle of a thread). Try:

b4 shazam -P_ 20230104171526.1416746-10-matthieu.baerts@tessares.net

-K
