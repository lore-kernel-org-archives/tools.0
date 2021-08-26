Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516463FC2
	for <tools@linux.kernel.org>; Thu, 26 Aug 2021 19:40:42 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id ay33so4663682qkb.10
        for <tools@linux.kernel.org>; Thu, 26 Aug 2021 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=162gAX4aOqBiaIwHgar4NXCiHiKfXXxkQG1UA1VIx2E=;
        b=SQF/vgZ5inWru27BfHT1zO9wjlEslvmxR1j6FfS3kNsyQVy5vCuQK8s20glOLq/GnN
         TOeXipMT2A5SOtRM8TIeKrM1fRghddPBnw0GLa/ZpoDBds7DoU8EbYAzJbor87KDsr9P
         O8waLBjHRgxjw/BQGYhizc9Ab6xuYBs1JWiv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=162gAX4aOqBiaIwHgar4NXCiHiKfXXxkQG1UA1VIx2E=;
        b=CXp+yep60w8mRWMZsI7LA8600KIO3P9ZZJS1JEOnJ1aqf0fOcu/t5vFtb+mgX4zNPN
         OYZNFRKJGse1FxREMvYqoMFcDYOzxbsIjvElCxE57/QT/DPJzJZrSWR4hobuRWaoKuuJ
         jM899dzQ8/CrbU7PUx0m/OgbAGsoyR4NsPiJiDu+xOGE0qRQr0ooFHF5TOjxS/ML0l2f
         55CIWIc18rt9Urg3kxmC/lBXfqQJJseNBLnqX5pEOQZ8+py+FiqvrVHaPerLX7t5jgPo
         ADh6siziZe/I23MByIxb2qQF1idIwMsnC90QVrIm09V3yZdERFVRtm8oKMK5MMUaN0ag
         yrBg==
X-Gm-Message-State: AOAM531aChL/9EEzIoMEo6lP8sdF+rpTXmXVP2EUxL+nPYFqrD3VcX5G
	GaBIBATFoqHtiMeWz+7NXXmcPg==
X-Google-Smtp-Source: ABdhPJwLs1xI3J++e+pe36srhw6giHjDO5xeZcLKhNzVGvJ8S1cUOtmYRGOvysRyPn+V2ECs2qNc1Q==
X-Received: by 2002:a05:620a:24c1:: with SMTP id m1mr5357489qkn.309.1630006841092;
        Thu, 26 Aug 2021 12:40:41 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id j185sm3230844qkf.28.2021.08.26.12.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 12:40:40 -0700 (PDT)
Date: Thu, 26 Aug 2021 15:40:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] Reorder headers for `git imap-send` compatibility
Message-ID: <20210826194039.e2i3tpfaf3cgvsyy@nitro.local>
References: <20210811024132.8496-1-levraiphilippeblain@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811024132.8496-1-levraiphilippeblain@gmail.com>

On Tue, Aug 10, 2021 at 10:41:32PM -0400, Philippe Blain wrote:
> When downloading messages from a public-inbox instance, reorder the
> "From", "Date" and "Subject" headers in that specific order. This allows
> the output from 'b4 mbox -o- $url' to be piped to 'git imap-send', which
> expects these headers in that specific order.
> 
> An easy place to implement that is in 'mailsplit_bytes', which is called
> by 'get_pi_thread_by_url' and already loops over the messages in the 'git
> mailsplit'-ed mbox file to populate the message list.
> 
> Note that 'mailsplit_bytes' is also called by 'get_msgs' directly when
> piping in a local mailbox, i.e. when '-' is used as the value of
> '--use-local-mbox', but it does no harm to also reorder the headers in
> that case.

I've decided not to take this patch because it will rearrange headers on all
processed messages just to work around a deficiency in a single tool
(git-imap-send). The order of headers in an RFC-2822 message should not
matter, so any tool that expects them in a specific arrangement is what needs
fixing.

Furthermore, reordering headers may actually cause DKIM validation errors in
the case where there are multiple From, Date or Subject headers. I know this
sounds contrived, but I've learned not to consider anything too bizarre of a
corner case when it comes to email.

For your particular case, I suggest you simply make a tiny python command that
takes an mbox on stdin and spits it out on stdout with headers in the desired
order, which should be about 20 lines of Python at most. This way you can do
`b4 mbox -o- $url | reorder.py | git imap-send`.

-K
