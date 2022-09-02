Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41B1869
	for <tools@linux.kernel.org>; Fri,  2 Sep 2022 14:40:36 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id m5so1865982qkk.1
        for <tools@linux.kernel.org>; Fri, 02 Sep 2022 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=2HEhNcpGVaO3ylePgh3y4Af75tY/HKPYfdHNLN8eHeo=;
        b=BG7eRRvIB5z/rrpMgLDz5jEmoQh9geDiCEU+OHIGkxX6cc5waCyTLZ8UNzpm/Ujw13
         eOB4CQ0g2Dv1cRz+pfIpPsaSzSJLxsRaR3QdWezkiATaPXFfOYYEOdOhccLD4qAd5VkD
         uGaCXUR1zn8FZDSVwJfyiyDwx27vKgmH2JBKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2HEhNcpGVaO3ylePgh3y4Af75tY/HKPYfdHNLN8eHeo=;
        b=ch6XBqwh3jK7nNfu29w2/5K7kEa95v5lanMTS5ngiI6GdVDVQVN2Fl87LiCaIwfNDx
         L7lfVcE3klk4yXOsWWA+viHofmuXMzKNI+EbQGZHFFWnEWXJb8EEaXPJ/gamw/2CxKwj
         v+pgykmiQWxyRNoA0HLh+gPR0qohWjA1WANXKRx0iaAGxh4YqTcXIzxMDRrd2JufXsvb
         M1dnDfCvlO/SFX8z3Z6ASoSC5MIlQ20eUOuHadygAj2dkNVAQVnk94r3DPuLb/2qwXny
         HJIIGMnwt2xzCVj6Y5j0Fp95a0UkK7LlNAMRGKuBx/00OAHDCgYgmtJhz2LkG2vFy6yM
         SIEA==
X-Gm-Message-State: ACgBeo1Sglajmh9h+GwiHRkheZFaAZJPHjs7aIuEbRxtL10NXH38Egg2
	L2jB1AWsnc5tD/7xpuwIR9drJ0Fl5UQHzg==
X-Google-Smtp-Source: AA6agR5bJ/dsBXzPNg00bWXHyicapeXTXtU0kC94qjVV5Bvg5MHvmY4dZWLrfsKzo4+U6O8i4OAZ7w==
X-Received: by 2002:a05:620a:2809:b0:6bc:5e0d:d7b1 with SMTP id f9-20020a05620a280900b006bc5e0dd7b1mr23749517qkp.545.1662129635256;
        Fri, 02 Sep 2022 07:40:35 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id fe7-20020a05622a4d4700b00342fc6a8e25sm1152886qtb.50.2022.09.02.07.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 07:40:34 -0700 (PDT)
Date: Fri, 2 Sep 2022 10:40:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Please return trailer-order option
Message-ID: <20220902144033.g2yzsvnuw5p7lk76@meerkat.local>
References: <YtZZE/6BOR5m86Kq@unreal>
 <7bb8b97f-dc03-41af-866e-767e4c15df62@www.fastmail.com>
 <20220728171351.4v65ytd2s5wp2lb7@meerkat.local>
 <20c1ca09-58e8-4ed4-a586-871a2daad70f@www.fastmail.com>
 <20220901214047.oyrmg4hyyihkdbbg@meerkat.local>
 <YxHaILXFF5Fzt4ig@unreal>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxHaILXFF5Fzt4ig@unreal>

On Fri, Sep 02, 2022 at 01:25:36PM +0300, Leon Romanovsky wrote:
> I tried latest b4 with the following config:
> [b4]
>          trailer-order = "Cc,Fixes*,Link*,Suggested*,Reviewed*,Tested*,*"
> 
> ➜  kernel git:(tmp) ~/src/b4/b4.sh shazam -l -s https://lore.kernel.org/all/20220901202645.1463552-1-irogers@google.com
> Grabbing thread from lore.kernel.org/all/20220901202645.1463552-1-irogers%40google.com/t.mbox.gz
> Checking for newer revisions on https://lore.kernel.org/all/
> Analyzing 2 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v1] selftests/xsk: Avoid use-after-free on ctx
>     + Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
>     + Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>   ---
>   NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 1
> ---
> Applying: selftests/xsk: Avoid use-after-free on ctx
> 
> The end result as an outcome of 1 is:
>     Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
>     Signed-off-by: Ian Rogers <irogers@google.com>
>     Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
>     Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
>     Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> While I would like to see Link being below Fixes line:
>     Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
>     Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
>     Signed-off-by: Ian Rogers <irogers@google.com>
>     Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
>     Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Right, this is the intended change in behaviour -- we don't want to touch
anything that's above the Signed-off-by that doesn't belong to you. I see why
you want to move the Link: line above Ian's SoB (to indicate that it's his
message), but I think from the point of view of chain-of-custody it really
belongs under it:

    Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
    Signed-off-by: Ian Rogers <irogers@google.com>

This is Ian saying that he's signing off on anything above this trailer. If we
move Link: above his signoff, this would indicate that he's also signing off
on the contents of that URL, but that would be putting words in his mouth. If
we put the Link under it, though, this indicates where *you* got the message, so
it really belongs in your own custody section:

    Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com

"I got this message at this URL"

    Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>

"I also collected this Acked-by, which can also be found at that URL"

    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

"I am signing off on anything above this line"

Hope this helps explain the reasoning.

-Konstantin
