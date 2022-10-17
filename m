Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27746BF
	for <tools@linux.kernel.org>; Mon, 17 Oct 2022 20:22:17 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id a18so7451851qko.0
        for <tools@linux.kernel.org>; Mon, 17 Oct 2022 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqFdzBGA3MPSjJ3iPJ4yscAoOQBqwlwgQ3uK8KxaFKg=;
        b=Wxan1lLVt0/OAIo/bpUtp702z7JdMrLpuoiKoPuARUbYmqYYJflltDiQwsR4sy0sXo
         c55DZqgKHkxLOtaNgSOsC5tDDLK8jcPpxn0mTW6jFuB+7Qr5zwrUx38Z5yuUJo0E9VdB
         r3efIDsZ+rsatVhT7IBQXGiwW9jbYujHoEugo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqFdzBGA3MPSjJ3iPJ4yscAoOQBqwlwgQ3uK8KxaFKg=;
        b=1HSqUu7ttczB4+OsNh/B4doh5tBcGpp/GJ+m2Lo4QIHiESQomNwF6BIoi1sQi5iJfh
         Uum2wgAPJceDTRDWVDdxSz4r3VIRcXmtL5KAyqETN/mxDrgytta2KWtNoZKJ5EBBVcQI
         AoMkr/wnab9ypvi/89aJtGx3L2PzDolFeUd7gK7EWmzsJOI2VGPp8CpOfXH1i3qDs1/i
         cDmlk5kWjQligXVQaz/mHb4GlHTEqXekucuU5FkjOuJcthyV1Z7oRalZl5nWDjeXQZp2
         XOyL/bF5hHPudMi3tMyn+rXZakj/Kcu/x8B+dR+1nKAmB7zlU4C1lRvLb8HMVCiQ91Gl
         Jn/w==
X-Gm-Message-State: ACrzQf2vnNPw5YEfFw2fKV8uSea1lRImlmFNMaEMuAj+rH5RSPAclEDj
	nRX5M8eo2C12yv7F3NmKxpRr5BCtNtpDZA==
X-Google-Smtp-Source: AMsMyM5d0pjJggfqAdivlWJVIr5IWsjqolDPj8sVr7umbBCWU5Avb9kBm/TlSsuiGTuW9e1B4agXWg==
X-Received: by 2002:a05:620a:15b9:b0:6ee:7839:8dff with SMTP id f25-20020a05620a15b900b006ee78398dffmr8867146qkk.245.1666038136215;
        Mon, 17 Oct 2022 13:22:16 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006cfc9846594sm531242qkg.93.2022.10.17.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:22:15 -0700 (PDT)
Date: Mon, 17 Oct 2022 16:22:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: "b4 ty -d all" crash
Message-ID: <20221017202214.dyt7lokid4shpqsv@nitro.local>
References: <20221017172323.GA3715117@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221017172323.GA3715117@bhelgaas>

On Mon, Oct 17, 2022 at 12:23:23PM -0500, Bjorn Helgaas wrote:
> I've used "b4 am" for a long time, but I'm a first-time and naive
> "b4 ty" user:
> 
>   12:17:52 ~/linux (for-linus)$ b4 ty -d all
>   Discarding 707 messages

Oh my.

>     Discarded: [PATCH 0/5] Handled return value of platform_get_irq correctly
>   Traceback (most recent call last):
>     File "/home/bjorn/.local/bin/b4", line 8, in <module>
>       sys.exit(cmd())
>     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 341, in cmd
>       cmdargs.func(cmdargs)
>     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 106, in cmd_ty
>       b4.ty.main(cmdargs)
>     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ty.py", line 678, in main
>       discard_selected(cmdargs)
>     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ty.py", line 578, in discard_selected
>       msgids.append(pdata[2])
>   IndexError: list index out of range

I think it's most likely due to tracking file format changes between when this
feature was first introduced and subsequent changes, especially considering
that your first tracked series are from:

> 	 Date: Mon, 4 May 2020 07:18:10 +0200

I suggest you just delete them manually by going into ~/.local/share/b4 and
deleting all *.am files.

-K
